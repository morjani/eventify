<form id="order_new_product" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-sm-12 mb-3">
            <label for="product_search">Product
                <span class="txt-danger">*</span>
            </label>
            <select name="product_id" id="product_search" class="selectpicker form-control"
                    data-live-search="true"
                    data-none-results-text="No product found"
                    title="Sélectionner" required>
            </select>
        </div>

        <div class="col-sm-12 mb-3">
            <label for="product_variants">Variants
                <span class="txt-danger">*</span>
            </label>
            <select name="product_variants" id="product_variants" class="form-select d-none">
                <option selected disabled value="">Sélectionner</option>

            </select>
        </div>

        <div id="order_products" class="d-none">
            <div class="col-sm-12 mb-3">
                <label class="form-label" for="product_sku">SKU
                    <span class="txt-danger">*</span>
                </label>
                <input type="text" name="product_sku" class="form-control" id="product_sku"  placeholder="Enter product SKU">
            </div>
            <div class="col-sm-12 mb-3">
                <label class="form-label" for="product_price">Price
                    <span class="txt-danger">*</span>
                </label>
                <input type="number" name="product_price" class="form-control" id="product_price" step="0.01"
                       min="0"  placeholder="Enter product price">
            </div>

            <div class="col-sm-12 mb-3">
                <label class="form-label" for="product_quantity">Quantity
                    <span class="txt-danger">*</span>
                </label>
                <input type="number" name="product_quantity" class="form-control" id="product_quantity"  placeholder="Enter product quantity">
            </div>
        </div>

    </div>

</form>
