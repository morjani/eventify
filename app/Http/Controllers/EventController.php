<?php

namespace App\Http\Controllers;
use Illuminate\Http\JsonResponse;
use App\Models\PageEvent;
use Throwable;

use Illuminate\Http\Request;

class EventController extends RootController
{
    public function index(){
         return backView('front.pageEvent', [
            'page' => 'pageEvent'
        ]);

    }
    public function PageEvent(Request $request): JsonResponse
    {
        try {


           
            $query = "
                SELECT pv.id_demandeur as id_demandeur,pv.id_demande,pv.heure,pv.message,e.date
                FROM prendre_rdv pv
                LEFT JOIN evenements e ON pv.id_event = e.id_event
                
                
            ";


            // Datatable processing (pagination, search, ordering)
            $result = $this->DoDatatable($query, $request, function ($i, $row) {


                $row->actions = '<div class="btn-group">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" style="">
                          <li>
                          <a class="dropdown-item prendre-rdv" href="JavaScript:void(0)"
                          data-id="'.$row->id_demandeur.'">Annuler</a>
                          <a class="dropdown-item prendre-rdv" href="JavaScript:void(0)"
                          data-id="'.$row->id_demandeur.'">Confirmer</a>
                          </li>  
                        </ul>
                      </div>';
                
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

    
}
