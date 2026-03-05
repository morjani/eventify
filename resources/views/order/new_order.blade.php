<form id="form_new_order" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-sm-12 mb-3">
            <label for="order_custom">Customer
            </label>
            <select name="customer_id" id="order_customer" class="selectpicker form-control"
                    data-live-search="true"
                    data-none-results-text="No customer found"
                    title="Sélectionner">
            </select>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_first_name">First name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="order_first_name" class="form-control" id="order_first_name"
                   placeholder="Enter First name" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_last_name">Last name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="order_last_name" class="form-control" id="order_last_name"
                   placeholder="Enter Last name" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_email">Email
                <span class="txt-danger">*</span>
            </label>
            <input type="email" name="order_email" class="form-control" id="order_email"
                   placeholder="Enter email" required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_phone">Phone
                <span class="txt-danger">*</span>
            </label>
            <input type="tel" name="order_phone" class="form-control" id="order_phone"
                   placeholder="Enter Phone" required>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="order_billing_address">Billing Address
                <span class="txt-danger">*</span>
            </label>
            <textarea name="order_billing_address" id="order_billing_address" class="form-control" required></textarea>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="order_shipping_address">Shipping Address
                <span class="txt-danger">*</span>
            </label>
            <textarea name="order_shipping_address" id="order_shipping_address" class="form-control" required></textarea>
        </div>

        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_custom_number">Number
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="order_custom_number" class="form-control" id="order_custom_number"
                   placeholder="Enter Number" required value="{{ $number }}">
        </div>

        <div class="col-sm-6 mb-3">
            <label class="form-label" for="order_note">Note
            </label>
            <textarea name="order_note" class="form-control" id="order_note"></textarea>
        </div>


    </div>

</form>


