<?php

namespace App\Services;

use App\Models\Rndv;
use App\Models\Evenement;
use Illuminate\Support\Facades\DB;

class RdvService
{
    /**
     * Vérifie si un RDV peut être pris avec un participant
     * 
     * @param int $currentUserId ID de l'utilisateur actuel
     * @param int $participantId ID du participant
     * @return bool true si on peut prendre un RDV, false sinon
     */
    public static function canTakeRdv($currentUserId, $participantId): bool
    {
        // Vérifier s'il existe déjà un RDV non annulé entre ces deux personnes
        $existingRdv = Rndv::where(function ($query) use ($currentUserId, $participantId) {
            $query->where('id_demandeur', $currentUserId)
                  ->where('id_demande', $participantId);
        })->orWhere(function ($query) use ($currentUserId, $participantId) {
            $query->where('id_demandeur', $participantId)
                  ->where('id_demande', $currentUserId);
        })->where('status', '!=', 'annulé')->exists();

        if ($existingRdv) {
            return false;
        }

        // Vérifier s'il existe au moins un événement avec une date future
        $futureEvent = Evenement::where('date', '>=', today())->exists();

        return $futureEvent;
    }

    /**
     * Raison pour laquelle le RDV ne peut pas être pris
     */
    public static function getRdvDisabledReason($currentUserId, $participantId): string
    {
        $existingRdv = Rndv::where(function ($query) use ($currentUserId, $participantId) {
            $query->where('id_demandeur', $currentUserId)
                  ->where('id_demande', $participantId);
        })->orWhere(function ($query) use ($currentUserId, $participantId) {
            $query->where('id_demandeur', $participantId)
                  ->where('id_demande', $currentUserId);
        })->where('status', '!=', 'annulé')->first();

        if ($existingRdv) {
            return 'RDV déjà existant';
        }

        $futureEvent = Evenement::where('date', '>=', today())->exists();
        if (!$futureEvent) {
            return 'Aucun événement futur';
        }

        return '';
    }

    /**
     * Récupère les heures indisponibles pour un utilisateur et un participant
     * 
     * @param int $currentUserId ID de l'utilisateur actuel
     * @param int $participantId ID du participant
     * @return array Tableau des heures indisponibles
     */
    public static function getUnavailableHours($currentUserId, $participantId): array
    {
        $unavailableHours = [];

        // Heures réservées par l'utilisateur actuel
        $currentUserHours = Rndv::where(function ($query) use ($currentUserId) {
            $query->where('id_demandeur', $currentUserId)
                  ->orWhere('id_demande', $currentUserId);
        })->where('status', '!=', 'annulé')
          ->pluck('heure')
          ->toArray();

        // Heures réservées par le participant
        $participantHours = Rndv::where(function ($query) use ($participantId) {
            $query->where('id_demandeur', $participantId)
                  ->orWhere('id_demande', $participantId);
        })->where('status', '!=', 'annulé')
          ->pluck('heure')
          ->toArray();

        $unavailableHours = array_merge($currentUserHours, $participantHours);

        return $unavailableHours;
    }

    /**
     * Récupère les heures disponibles
     * 
     * @param int $currentUserId ID de l'utilisateur actuel
     * @param int $participantId ID du participant
     * @return array Tableau des heures disponibles avec label
     */
    public static function getAvailableHours($currentUserId, $participantId): array
    {
        $allHours = [
            '9-10' => '09-10',
            '10-11' => '10-11',
            '11-12' => '11-12',
            '12-13' => '12-13',
            '13-14' => '13-14',
            '14-15' => '14-15',
            '15-16' => '15-16',
            '16-17' => '16-17',
            '17-18' => '17-18',
        ];

        $unavailableHours = self::getUnavailableHours($currentUserId, $participantId);

        $availableHours = [];
        foreach ($allHours as $key => $label) {
            if (!in_array($key, $unavailableHours)) {
                $availableHours[$key] = $label;
            }
        }

        return $availableHours;
    }
}