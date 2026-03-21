<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use App\Models\Prendre;
use App\Models\Rndv;
use Throwable;

class PrendreController extends RootController
{
    public function index()
    {
        
        return backView('front.prendre', [
            'page' => 'prendre'
        ]);
    }
    public function dtPrendre(Request $request): JsonResponse
    {
        try {


           //get current user id
           //zido f requette fl where currentr_id <> 
           
            $query = "
                SELECT u.*, p.pays as pays
                FROM users u
                LEFT JOIN pays p ON p.id = u.id_pays
                WHERE u.role_id = 2
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
                          data-id="'.$row->id.'">Prendre RDV</a>
                          </li>  
                        </ul>
                      </div>';
                
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
                    'id_demandeur' =>$userId,//id_demandeur
                    'id_demande'=>$request->participant_id,//id_demande

                ]);

                return response()->json([
                'success' => true,
                'message' => 'La demande a été envoyée',
]);

    }


}
