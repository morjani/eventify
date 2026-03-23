<form id="form_prendre_rdv">
    @csrf
    <div class="row">
        
        <div class="col-sm-12 mb-3">
            <label for="heure">Heure</label>
            <select class="form-select" name="heure" id="heure" required>
                <option value="">Chargement des heures disponibles...</option>
            </select>
            <label for="rdv_message">Message</label>
            <textarea name="message" id="rdv_message" class="form-control" required></textarea>
        </div>
    </div>

</form>


