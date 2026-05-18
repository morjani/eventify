<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User as Users;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function store(Request $request)
    {
       try{
            $validated = $request->validate([
                'last_name'=>'required|string|min:3|max:50',
                'first_name'=>'required|string|min:3|max:50',
                'id_pays' => 'required|exists:pays,id',
                'ville'=>'required|string|min:3|max:60',
                'email' => 'required|email|max:255|unique:users,email',
                'password'=>'required|string|min:3|max:255|confirmed',
                'phone'=>'required|string|min:3|max:10',
//Updated upstream

            ], [
                'email.unique' => 'Cet email est déjà utilisé.',
                'password.confirmed' => 'Les mots de passe ne correspondent pas.',
                'required' => 'Le champ :attribute est requis.',
                'email' => 'Veuillez entrer une adresse email valide.',
                'min' => 'Le champ :attribute doit contenir au moins :min caractères.',
                'max' => 'Le champ :attribute ne peut pas dépasser :max caractères.',

//Stashed changes
            ]);
            $user = Users::create(
                [
                    'last_name'    => $validated['last_name'],
                    'first_name' => $validated['first_name'],
                    'role_id'    => 2,
                    'id_pays'     => $validated['id_pays'],
                    'ville'     => $validated['ville'],
                    'email'     => $validated['email'],
                    'password' => Hash::make($validated['password']),
                    'phone'=>$validated['phone']
                ]);
                return response()->json([
                    'success' => true,
                    'message' => 'User saved successfully',

                ]);
        }catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (\Throwable $e) {
            logger()->error('Store user error', ['message' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong, please try again',
            ], 500);
        }

    }
}





