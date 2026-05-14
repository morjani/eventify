<!DOCTYPE html>
<html lang="en">
<head>
   <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="keywords" content="">
      <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css">
<!-- Updated upstream-->
      <!-- App css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
      <link id="color" rel="stylesheet" href="../assets/css/color-1.css" media="screen">
      <!-- Responsive css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
      <script defer src="../assets/css/color-1.js"></script>
      <script defer src="../assets/css/responsive.js"></script>
      <script defer src="../assets/css/style.js"></script>
      <link href="../assets/css/color-1.css" rel="stylesheet">
      <link href="../assets/css/responsive.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/sweetalert2.css') }}">

      <link rel="stylesheet" href="../assets/css/style.css">
<!-- Stashed changes-->
</head>
   <body id="form-index">
      <div class="container-fluid p-0">
      <div class="row m-0">
      <div class="col-xl-5">
      </div>
      <div class="col-xl-7 p-0">
      <div class="login-card login-dark">
      <div>
      <div><div class="logo text-start">
         <img class="img-fluid for-light" src="../assets/images/logo/logo.png" alt="looginpage">
         </div>
<!-- Stashed changes-->
      </div>
      <div class="login-main create-account">
      <form class="theme-form" id="form-search" >
         @csrf
          <h4><b>Creer votre compte</b></h4>
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
                     <option value="{{ $pay->id }}">{{ $pay->pays }}</option>
               @endforeach
            </select>
         </div>
         <div class="col-sm-12">
                <label class="col-form-label ">Ville</label>
                <input class="form-control" type="text"  placeholder="ville" name="ville" required>
         </div>
         <div class="col-sm-12">
                  <label class="col-form-label ">Numéro téléphone</label>
                  <input class="form-control" type="text" placeholder="numéro téléphone" name='phone' required>
               </div>
         <div class="form-group">
            <label class="col-form-label">Addresse Email</label>
            <input class="form-control" type="email"  placeholder="test@gmail.com" name="email" required>
         </div>
         <div class="form-group">
            <label class="col-form-label">Mot de passe</label>
            <div class="form-input position-relative">
               <img src="/assets/css/images/png-clipart-computer-icons-eye-icon-eye-side-miscellaneous-text.png" width="40px" id="icon">
               <input class="form-control" type="password" name='password' id='password'  placeholder="*********" required pattern="(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}" title="minimum 8 caractère et numbre">
            </div>
         <div class="form-group">
            <label class="col-form-label">Vérifier le mot de passe</label>
            <div class="form-input position-relative">
               <img src="/assets/css/images/png-clipart-computer-icons-eye-icon-eye-side-miscellaneous-text.png" width="40px" id="icon1">
               <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="*********" required pattern="(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}" title="minimum 8 caractère et numbre">
         </div>
         </div>
         <div class="form-group mb-0">
            <div class="form-check">
               <input class="checkbox-primary form-check-input" id="checkbox1" type="checkbox" required>
               <label class="text-muted form-check-label" for="checkbox1">J'accepte les conditions générales et la  
               <a class="ms-2" href="#">Politique de confidentialité</a>
               </label>
            </div>
            <button class="btn btn-primary btn-block w-100" type="submit" id="submit-btn">Creer compte</button>
         </div>
      </form>
     
   <script src="{{ asset('assets/js/jquery.min.js') }}"></script>

   <script src="{{ asset('assets/js/sweet-alert/sweetalert.min.js') }}"></script>

   <script src="{{ asset('assets/js/main.js') }}"></script>
  
   <script src="{{ asset('assets/js/front.js') }}"></script>
      <script>
         $(document).ready(function () {
            $('#form-search').on('submit', function(e) {
               if ($('#password').val() !== $('#password_confirmation').val()) {
                  e.preventDefault();
                  alert('Le mot de passe et sa confirmation ne correspondent pas');
               }
         });

         });
      </script>
      <script>
         const password = document.getElementById("password");
         const password1 = document.getElementById("password_confirmation");
         const icon = document.getElementById("icon");
         const icon1 =document.getElementById("icon1");

         icon.addEventListener("click", () => {
         if (password.type === "password") {
            password.type = "text";
         } else {
            password.type = "password";
         }
         });
         icon1.addEventListener("click", () => {
         if (password1.type === "password") {
            password1.type = "text";
         } else {
            password1.type = "password";
         }
         });
      </script>
   </body>

</html>
