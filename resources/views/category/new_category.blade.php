<form id="form_category">
    @csrf
    <div class="row">
        <div class="col-sm-12 mb-3">
            <label class="form-label" for="category_name">Name
                <span class="txt-danger">*</span>
            </label>
            <input type="text" name="name" class="form-control" id="category_name"  placeholder="Enter category name"
                   required value="{{ $category ? $category->name : '' }}">
        </div>
        <div class="col-sm-12 mb-3">
            <label for="category_description">Description</label>
            <textarea name="description" id="category_description" class="form-control">{{ $category ? $category->description : '' }}</textarea>
        </div>
    </div>

</form>


