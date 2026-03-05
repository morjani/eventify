<form id="form_custom_product" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="custom_product_name">Name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="name" class="form-control" id="custom_product_name"  placeholder="Enter product name"
                   required>
        </div>
        <div class="col-sm-6 mb-3">
            <label for="custom_product_category">Category
            </label>
            <select name="category_id" id="custom_product_category" class="form-select">
                <option selected disabled value="">Sélectionner</option>
                <option value="11">
                    test
                </option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}">
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="custom_product_price">Price
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="price" class="form-control" id="custom_product_price"  placeholder="Enter product price"
                   required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="custom_product_sku">SKU
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="sku" class="form-control" id="custom_product_sku"  placeholder="Enter product SKU"
                   required>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="custom_product_quantity">Quantity
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="quantity" class="form-control" id="custom_product_quantity"  placeholder="Enter product quantity"
                   required>
        </div>
        <div class="col-sm-6 mb-3">
            <label for="custom_product_description">Description</label>
            <textarea name="description" id="custom_product_description" class="form-control"></textarea>
        </div>
        <div class="col-sm-12 mb-3">
            <label for="custom_product_image">Image</label>
            <input type="file" id="custom_product_image" name="product_image" class="dropify"/>
        </div>
    </div>

</form>


