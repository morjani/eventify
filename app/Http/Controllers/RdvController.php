<?php

namespace App\Http\Controllers;
use Illuminate\Http\JsonResponse;
use App\Models\PageEvent;
use App\Models\Rndv;
use Throwable;
use App\Models\Evenement;

use Illuminate\Http\Request;

class RdvController extends RootController
{
    public function index(){
         return backView('rdv.index', [
            'page' => 'Page de gestion des rendez-vous'
        ]);

    }
    public function PageEvent(Request $request): JsonResponse
    {
        try {

            $currentUserId = auth()->id();

            $query = "
                SELECT pv.id_rdv,
                       CONCAT(u1.first_name, ' ', u1.last_name) as demandeur,
                       CONCAT(u2.first_name, ' ', u2.last_name) as demande,
                       e.nom as event_nom,
                       e.date as event_date,
                       pv.heure,
                       pv.message,
                       pv.status,
                       pv.motif_annulation,
                       pv.id_demandeur,
                       pv.id_demande
                FROM prendre_rdv pv
                LEFT JOIN evenements e ON pv.id_event = e.id_event
                LEFT JOIN users u1 ON pv.id_demandeur = u1.id
                LEFT JOIN users u2 ON pv.id_demande = u2.id
                WHERE pv.id_demandeur = $currentUserId OR pv.id_demande = $currentUserId
            ";

            // Datatable processing (pagination, search, ordering)
            $result = $this->DoDatatable($query, $request, function ($i, $row) use ($currentUserId) {


                $liConfirm = '';
                $liAnnuler = '';

                if ($row->status === 'en attente') {
                    $liAnnuler = '<li> <a class="dropdown-item annuler-rdv" href="JavaScript:void(0)" data-id="' . $row->id_rdv . '">Annuler</a></li>';

                    if ((int)$row->id_demande === (int)$currentUserId) {
                        $liConfirm = '<li><a class="dropdown-item confirmer-rdv" href="JavaScript:void(0)" data-id="' . $row->id_rdv . '">Confirmer</a></li> ';
                    }
                }

                $statusText = $row->status;
                $badgeClass = 'badge-light-secondary';
                if ($statusText === 'confirmé') $badgeClass = 'badge-light-success';
                if ($statusText === 'annulé') $badgeClass = 'badge-light-danger';
                if ($statusText === 'en attente') $badgeClass = 'badge-light-warning';

                $row->status = '<span class="badge ' . $badgeClass . '">' . ucfirst($statusText) . '</span>';

                if($liAnnuler === '' && $liConfirm === '') {
                    $row->actions = '';
                } else {
                     

                $row->actions = '<div class="btn-group">
                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" style="">
                            ' . $liConfirm . '
                            ' . $liAnnuler . '
                        </ul>
                      </div>';

                }
            
            });

            return response()->json($result);
            

        } catch (Throwable $e) {

            // Log error for debugging
            logger()->error('Erreur des evenements dans le tableau de données', [
                'message' => $e->getMessage(),
            ]);

            // Return JSON error response
            return response()->json([
                'success' => false,
                'message' => 'Impossible de charger la liste des evenements',
            ], 500);
        }
    }

    public function cancelForm($id_rdv)
    {
        $rdv = Rndv::findOrFail($id_rdv);
        return backView('rdv.cancel-rdv', [
            'rdv' => $rdv
        ],true,true);
    }

    public function changeStatus(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'id_rdv' => ['required', 'exists:prendre_rdv,id_rdv'],
            'status' => ['required', 'in:en attente,confirmé,annulé'],
            'motif_annulation' => ['nullable', 'string', 'max:1000'],
        ]);

        $rdv = Rndv::findOrFail($validated['id_rdv']);

        if ($rdv->status === $validated['status']) {
            return response()->json([
                'success' => false,
                'message' => 'Le statut est déjà à jour.'
            ], 409);
        }

        $rdv->status = $validated['status'];

        if ($validated['status'] === 'annulé') {
            $rdv->motif_annulation = $validated['motif_annulation'] ?? null;
            $rdv->annule_par = auth()->id();
        }

        $rdv->save();

        return response()->json([
            'success' => true,
            'message' => 'Statut mis à jour avec succès.'
        ]);
    }

    public function edit($id_event) {
        $event = Evenement::findOrFail($id_event);
        return backView('front.edit-event', [
            'event' => $event,
            'page' => 'edit-event'
        ]);
    }

    public function update(Request $request, $id_event) {
        $event = Evenement::findOrFail($id_event);
        $event->update($request->only(['nom', 'date', 'description', 'inscription_ouverte']));
        return redirect()->route('config-event', $id_event)->with('success', 'Event updated successfully');
    }
    
}
