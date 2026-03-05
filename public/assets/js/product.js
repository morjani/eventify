$(function () {

    let page = $('#page-products');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableProduct = initDatatable('#table-product', [
            {
                title : '',
                name  : 'image',
                data  : 'image',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : 'Product',
                name  : 'name',
                data  : 'name',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Category',
                name  : 'category',
                data  : 'category',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'SKU',
                name  : 'sku',
                data  : 'sku',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Price',
                name  : 'price',
                data  : 'price',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Quantity',
                name  : 'quantity',
                data  : 'quantity',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Created by",
                name  : 'user',
                data  : 'user',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Last update",
                name  : 'updated_at',
                data  : 'updated_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Actions",
                name  : 'actions',
                data  : 'actions',
                render: null,
                orderable : false,
                searchable : false,
            },
        ], {
            ajax    : "/ajax/dt-products",
            order           : [[7, 'desc']],
        }, undefined);

    })
        .on('new-product',function (elem,data) {

            newProduct();

        })
        .on('edit-product',function (elem,data) {

            let productId = data.element.data('id');
            newProduct(productId);

        })
        .on('delete-product',function (elem,data) {

            let productID = data.element.data('id');

            Swal.fire({
                title: "Are you sure?",
                text: 'Do you really want to delete the product?',
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, delete it!",
                imageUrl: "../assets/images/gif/trash.gif",
                imageWidth: 120,
                imageHeight: 120,
            }).then((result) => {
                if (result.isConfirmed) {

                    $.post('/ajax/delete-product',{'product_id' : productID},function (res) {

                        if(res.success){

                            Toast.fire({
                                icon: "success",
                                title: res.message
                            });
                            tableProduct.ajax.reload();

                        }
                        else{

                            Toast.fire({
                                icon: "error",
                                title: res.message
                            });

                        }

                    },'json');

                }
            });

        });

    function newProduct (productId='') {

        let removeImage = false;

        modalAjax('/ajax/new-product/'+productId, {

            title           : productId === '' ? 'New product' : 'Edit product' ,
            header_close    : true,
            footer_ok       : true,
            footer_cancel   : false,
            very_small      : false,
            size_md         : false,
            size_lg         : true,
            close_outsid    : true,
            ok              : 'Save',
            cancel          : 'Cancel',
            error_msg       : 'error',
            sucess_msg      : 'Data saved successfully!',
            always_close    : false,
            show_header     : true,
            show_footer     : true,
            post_data       : {},
            onLoad          : function(){

                $('#product_image').dropify();

                $('.dropify-message .file-icon p').hide();

                $('.dropify').dropify().on('dropify.beforeClear', function(event, element){
                    // mark image to be removed
                    removeImage = true;
                    return true; // allow the input to be cleared visually
                });


            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#form_product');
                let formData = new FormData(form[0]);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    formData.append('product_id', productId);
                    formData.append('remove_image', removeImage ? 1 : 0);

                    $.ajax({
                        url: '/ajax/store-product',
                        type: 'POST',
                        data: formData,
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        success: function(res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                modal.modal('hide');
                                tableProduct.ajax.reload();
                            } else {
                                Toast.fire({
                                    icon: "error",
                                    title: res.message
                                });
                            }
                        },
                        error: function(xhr) {
                            console.error(xhr);
                            Toast.fire({
                                icon: "error",
                                title: 'Server error. Please try again.'
                            });
                        },
                        complete: function() {
                            $('.modal-footer button').removeClass('loading').html('Save');
                        }
                    });

                } else {
                    form[0].reportValidity();
                }

            },
            onCancel        : function () {},
            onClose         : function () {}
        });
    };

})




