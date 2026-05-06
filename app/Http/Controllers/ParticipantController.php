<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use App\Models\Prendre;
use App\Models\Rndv;
use App\Services\RdvService;
use Throwable;

class ParticipantController extends RootController
{
    public function index()
    {
        
        return backView('participant.index', [
            'page' => 'Participants'
        ]);
    }
    public function dtParticipants(Request $request): JsonResponse
    {
        try {

            $currentUserId = auth()->id();
            $user = auth()->user();

            $query = "
                SELECT u.*, p.pays as pays
                FROM users u
                LEFT JOIN pays p ON p.id = u.id_pays
                LEFT JOIN roles r ON r.id = u.role_id
                WHERE r.name = 'participant' AND u.id != $currentUserId
            ";

            // Datatable processing (pagination, search, ordering)
            $result = $this->DoDatatable($query, $request, function ($i, $row) use ($currentUserId, $user) {

                // Afficher le bouton uniquement si l'utilisateur actuel est un participant
                if ($user->hasRole('participant')) {
                    $canTakeRdv = RdvService::canTakeRdv($currentUserId, $row->id);

                    if ($canTakeRdv) {
                        $row->actions = '<button class="btn btn-outline-primary btn-sm prendre-rdv" data-id="' . $row->id . '">Prendre RDV</button>';
                    } else {
                        $row->actions = '';
                    }
                } else {
                    $row->actions = '';
                }
                
            });
            
            return response()->json($result);
            

        } catch (Throwable $e) {

            // Log error for debugging
            logger()->error('Erreur des participants dans le tableau de données', [
                'message' => $e->getMessage(),
            ]);

            // Return JSON error response
            return response()->json([
                'success' => false,
                'message' => 'Impossible de charger la liste des participants',
            ], 500);
        }
    }

    public function prendreRdv(Request $request)
    {
    
            // If ID exists → edit mode, otherwise create mode
            $participant_id = $request->get('participant_id');

            return backView('front.prendre_rdv', [
                'page'     => 'Prendre RDV',
            ], true,true);

       
    }
    public function store(Request $request)
    {
      $userId = Auth::id();

            $validated = $request->validate([
                'heure'=>'required',
                'message'=>'required',
                
               
                
            ]);
            $rnv = Rndv::create(
                [
                    'heure'    => $validated['heure'],
                    'message' => $validated['message'],
                    'id_event' => 1, // Set to null since it's not provided in the request
                    'id_demandeur' =>$userId,//id_demandeur
                    'id_demande'=>$request->participant_id,//id_demande

                ]);

                return response()->json([
                'success' => true,
                'message' => 'La demande a été envoyée',
]);

    }

    public function getAvailableHours($participantId): JsonResponse
    {
        try {
            $currentUserId = auth()->id();

            $availableHours = RdvService::getAvailableHours($currentUserId, $participantId);

            return response()->json([
                'success' => true,
                'data' => $availableHours
            ]);

        } catch (Throwable $e) {
            logger()->error('Error fetching available hours', [
                'message' => $e->getMessage(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Impossible de charger les heures disponibles',
            ], 500);
        }
    }

}
