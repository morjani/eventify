<form id="order_edit_customer" enctype="multipart/form-data">
    @csrf
    <div class="row">

        <div class="col-sm-6 mb-3">
            <label class="form-label" for="customer_first_name">First name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="customer_first_name" class="form-control" id="customer_first_name"  placeholder="Enter First name"
                   value="<?= $order ? $order->first_name : '' ?>" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="customer_last_name">Last name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="customer_last_name" class="form-control" id="customer_last_name"  placeholder="Enter Last name"
                   value="<?= $order ? $order->last_name : '' ?>" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="customer_email">Email
                <span class="txt-danger">*</span>
            </label>
            <input type="email" name="customer_email" class="form-control" id="customer_email"  placeholder="Enter email"
                   value="<?= $order ? $order->email : '' ?>" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="customer_phone">Phone
                <span class="txt-danger">*</span>
            </label>
            <input type="tel" name="customer_phone" class="form-control" id="customer_phone"  placeholder="Enter Phone"
                   value="<?= $order ? $order->phone : '' ?>" required>
        </div>

        <div class="col-sm-12 mb-3">
            <label for="customer_billing_address">Billing Address
                <span class="txt-danger">*</span>
            </label>
            <textarea name="customer_billing_address" id="customer_billing_address" class="form-control" required>{{ $order ? $order->billing_address : '' }}</textarea>
        </div>

        <div class="col-sm-12 mb-3">
            <label for="customer_shipping_address">Shipping Address
                <span class="txt-danger">*</span>
            </label>
            <textarea name="customer_shipping_address" id="customer_shipping_address" class="form-control" required>{{ $order ? $order->customer_address : '' }}</textarea>
        </div>

    </div>

</form>


