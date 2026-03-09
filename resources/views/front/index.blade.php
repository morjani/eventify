<!DOCTYPE html>
<html lang="en">
<head>
   <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Landing Page</title>
</head>

   <body>
      @extends('front.master')
      @section('content')
      <!-- login page start-->
      <div class="container-fluid p-0">
      <div class="row m-0">
      <div class="col-xl-5">
         <img class="bg-img-cover bg-center" src="../assets/images/login/login_bg.jpg" alt="looginpage">
      </div>
      <div class="col-xl-7 p-0">
      <div class="login-card login-dark">
      <div>
      <div><a class="logo text-start" href="index.html">
         <img class="img-fluid for-light" src="../assets/images/logo/logo.png" alt="looginpage">
         <img class="img-fluid for-dark" src="../assets/images/logo/logo_dark.png" alt="looginpage"></a>
      </div>
      <div class="login-main create-account">
      <form class="theme-form" id="form-search" >
         @csrf
          <h4>Creer votre compte</h4>
          <p>Saisissez vos informations personnelles pour créer votre compte</p>
         <div class="form-group">
            <label class="col-form-label pt-0">Nom Complet</label>
            <div class="row g-2">
               <div class="col-sm-6">
                  <input class="form-control" type="text" placeholder="Nom" name='last_name' required>
               </div>
               <div class="col-sm-6">
                  <input class="form-control" type="text" placeholder="Prenom" name='first_name' required>
               </div>
            </div>
         </div>
        <div class="col-sm-12">
            <label class="col-form-label">Pays</label>
            <select class="form-select" name="id_pays" required>
               @foreach ($pays as $pay)
                     <option value="{{ $pay->id }}">{{ $pay->Pays }}</option>
               @endforeach
            </select>
         </div>
         <div class="col-sm-12">
                <label class="col-form-label ">Ville</label>
                <input class="form-control" type="text"  placeholder="ville" name="ville" required>
         </div>
         
         <div class="form-group">
            <label class="col-form-label">Addresse Email</label>
            <input class="form-control" type="email"  placeholder="test@gmail.com" name="email" required>
         </div>
         <div class="form-group">
            <label class="col-form-label">Mot de passe</label>
            <div class="form-input position-relative">
               <input class="form-control" type="password" name='password'  placeholder="*********" required>
            </div>
         </div>
         <div class="form-group mb-0">
            <div class="form-check">
               <input class="checkbox-primary form-check-input" id="checkbox1" type="checkbox">
               <label class="text-muted form-check-label" for="checkbox1">J'accepte les conditions générales et la  
               <a class="ms-2" href="#">Politique de confidentialité</a>
               </label>
            </div>
            <button class="btn btn-primary btn-block w-100" type="submit" id="submit-btn">Creer compte</button>
         </div>
      </form>
      @endsection
     <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
  
      <script src="{{ asset('assets/js/front.js') }}"></script>
   </body>
</html>