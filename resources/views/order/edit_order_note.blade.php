<form id="order_edit_note" enctype="multipart/form-data">
    @csrf
    <div class="row">

        <div class="col-sm-12 mb-3">
            <label class="form-label" for="custom_number">Custom Number
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="order_custom_number" class="form-control" id="custom_number"  placeholder="Enter custom number"
                   value="{{ $order ? $order->custom_number : ''  }}" required>
        </div>

        <div class="col-sm-12 mb-3">
            <label class="form-label" for="order_note">Note
            </label>
            <textarea name="order_note" id="order_note" class="form-control" rows="5">{{ $order ? $order->note : ''  }}</textarea>
        </div>


    </div>

</form>


