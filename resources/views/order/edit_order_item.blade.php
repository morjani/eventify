<form id="order_edit_product" enctype="multipart/form-data">
    @csrf
    <div class="row">

        <div class="col-sm-12 mb-3">
            <label class="form-label" for="product_sku">SKU
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="product_sku" class="form-control" id="product_sku"  placeholder="Enter product SKU"
                    value="<?= $product ? $product->sku : '' ?>">
        </div>
        <div class="col-sm-12 mb-3">
            <label class="form-label" for="product_price">Price
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="product_price" class="form-control" id="product_price"  placeholder="Enter product price"
                   value="<?= $product ? $product->price : '' ?>">
        </div>

        <div class="col-sm-12 mb-3">
            <label class="form-label" for="product_quantity">Quantity
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="product_quantity" class="form-control" id="product_quantity"  placeholder="Enter product quantity"
                   value="<?= $product ? $product->quantity : '' ?>">
        </div>

    </div>

</form>


