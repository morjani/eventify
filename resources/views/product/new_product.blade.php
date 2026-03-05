<form id="form_product" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="product_name">Name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="name" class="form-control" id="product_name"  placeholder="Enter product name"
                   required value="{{ $product ? $product->name : '' }}">
        </div>
        <div class="col-sm-6 mb-3">
            <label for="product_category">Category
                <span class="txt-danger">*</span>
            </label>
            <select name="category_id" id="product_category" class="form-select">
                <option selected disabled value="">Sélectionner</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" {{ $product && $product->category_id == $category->id ? 'selected' : ''}}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="product_price">Price
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="price" class="form-control" id="product_price"  placeholder="Enter product price"
                   required value="{{ $product ? $product->price : '' }}">
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="product_sku">SKU
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="sku" class="form-control" id="product_sku"  placeholder="Enter product SKU"
                   required value="{{ $product ? $product->sku : '' }}">
        </div>
        <div class="col-sm-6 mb-3">
            <label class="form-label" for="product_quantity">Quantity
                <span class="txt-danger">*</span>
            </label>
            <input type="number" name="quantity" class="form-control" id="product_quantity"  placeholder="Enter product quantity"
                   required value="{{ $product ? $product->quantity : '' }}">
        </div>
        <div class="col-sm-6 mb-3">
            <label for="product_description">Description</label>
            <textarea name="description" id="product_description" class="form-control">{{ $product ? $product->description : '' }}</textarea>
        </div>
        <div class="col-sm-12 mb-3">
            <label for="product_image">Image</label>
            <input type="file" id="product_image" name="product_image" class="dropify" data-default-file="{{ $product?->primaryMedia?->full_url }}"/>
        </div>
    </div>

</form>


