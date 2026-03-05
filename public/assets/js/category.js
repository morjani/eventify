$(function () {

    let page = $('#page-categories');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableCategory = initDatatable('#table-category', [
            {
                title : 'Category',
                name  : 'name',
                data  : 'name',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Description',
                name  : 'description',
                data  : 'description',
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
            ajax    : "/ajax/dt-categories",
            order           : [[3, 'desc']],
        }, undefined);

    })
        .on('new-category',function (elem,data) {

            newCategory();

        })
        .on('edit-category',function (elem,data) {

            let categoryId = data.element.data('id');
            newCategory(categoryId);

        })
        .on('delete-category',function (elem,data) {

            let categoryId = data.element.data('id');

                Swal.fire({
                    title: "Are you sure?",
                    text: 'Do you really want to delete the category?',
                    showCancelButton: true,
                    confirmButtonColor: "#16C7F9",
                    cancelButtonColor: "#FC4438",
                    confirmButtonText: "Yes, delete it!",
                    imageUrl: "../assets/images/gif/trash.gif",
                    imageWidth: 120,
                    imageHeight: 120,
                }).then((result) => {
                    if (result.isConfirmed) {

                        $.post('/ajax/delete-category',{'category_id' : categoryId},function (res) {

                            if(res.success){

                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                tableCategory.ajax.reload();

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

    function newCategory (categoryId='') {

        modalAjax('/ajax/new-category/'+categoryId, {

            title           : categoryId === '' ? 'New category' : 'Edit category' ,
            header_close    : true,
            footer_ok       : true,
            footer_cancel   : false,
            very_small      : false,
            size_md         : true,
            size_lg         : false,
            close_outsid    : true,
            ok              : 'Save',
            cancel          : 'Cancel',
            error_msg       : 'error',
            sucess_msg      : 'Data saved successfully!',
            always_close    : false,
            show_header     : true,
            show_footer     : true,
            post_data       : {},
            onLoad          : function(){},
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#form_category');

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/store-category',
                        type: 'POST',
                        data: form.serialize() + '&category_id=' + categoryId,
                        dataType: 'json',
                        success: function(res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                modal.modal('hide');
                                tableCategory.ajax.reload();
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




