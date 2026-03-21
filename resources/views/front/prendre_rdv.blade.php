<form id="form_prendre_rdv">
    @csrf
    <div class="row">
        
        <div class="col-sm-12 mb-3">
            <label for="">Heure</label>
            <select class="form-select" name="heure" id="heure" required>
                <option value="">Choisir l'heure</option>
                <option value="9-10">09-10</option>
                <option value="10-11">10-11</option>
                <option value="11-12">11-12</option>
                <option value="12-13">12-13</option>
                <option value="13-14">13-14</option>
                <option value="14-15">14-15</option>
                <option value="15-16">15-16</option>
                <option value="16-17">16-17</option>
                <option value="17-18">17-18</option>
            </select>
            <label for="rdv_message">Message</label>
            <textarea name="message" id="rdv_message" class="form-control" required></textarea>
        </div>
    </div>

</form>
<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
  <script src="{{ asset('assets/js/prendre.js') }}"></script>


