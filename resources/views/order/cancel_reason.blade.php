<form id="form_cancel_reason" enctype="multipart/form-data">
    @csrf
    <div class="row">

        <div class="col-sm-12 mb-3">
            <label for="cancel_reason">Reason
                <span class="txt-danger">*</span>
            </label>
            <textarea name="cancel_reason" id="cancel_reason" class="form-control" required>{{ $order ? $order->cancel_reason : '' }}</textarea>
        </div>

    </div>

</form>


