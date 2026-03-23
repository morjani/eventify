<form id="form_cancel_rdv">
    @csrf
    <input type="hidden" name="id_rdv" value="{{ $rdv->id_rdv }}">
    <div class="mb-3">
        <label for="motif_annulation" class="form-label">Motif d'annulation</label>
        <textarea name="motif_annulation" id="motif_annulation" class="form-control" rows="4" required></textarea>
    </div>
</form>