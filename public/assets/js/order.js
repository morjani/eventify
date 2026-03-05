$(function () {

    let page = $('#page-orders');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableAllOrders = initDatatable('#table_all_orders', [
            {
                title : 'Number',
                name  : 'number',
                data  : 'number',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Date",
                name  : 'created_at',
                data  : 'created_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Customer",
                name  : 'customer',
                data  : 'customer',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Products",
                name  : 'products',
                data  : 'products',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : "Total",
                name  : 'total_ttc',
                data  : 'total_ttc',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status",
                name  : 'state',
                data  : 'state',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status shipping",
                name  : 'status_shipping',
                data  : 'status_shipping',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Source",
                name  : 'source',
                data  : 'source',
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
            ajax    : "/ajax/dt-orders",
            order           : [[1, 'desc']],
        }, undefined);

        tableOrdersCanceled = initDatatable('#table_orders_pending', [
            {
                title : 'Number',
                name  : 'number',
                data  : 'number',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Date",
                name  : 'created_at',
                data  : 'created_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Customer",
                name  : 'customer',
                data  : 'customer',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Products",
                name  : 'products',
                data  : 'products',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : "Total",
                name  : 'total_ttc',
                data  : 'total_ttc',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status",
                name  : 'state',
                data  : 'state',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status shipping",
                name  : 'status_shipping',
                data  : 'status_shipping',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Source",
                name  : 'source',
                data  : 'source',
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
            ajax    : "/ajax/dt-orders?status=PENDING",
            order           : [[1, 'desc']],
        }, undefined);

        tableOrdersCanceled = initDatatable('#table_orders_canceled', [
            {
                title : 'Number',
                name  : 'number',
                data  : 'number',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Date",
                name  : 'created_at',
                data  : 'created_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Customer",
                name  : 'customer',
                data  : 'customer',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Products",
                name  : 'products',
                data  : 'products',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : "Total",
                name  : 'total_ttc',
                data  : 'total_ttc',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status",
                name  : 'state',
                data  : 'state',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status shipping",
                name  : 'status_shipping',
                data  : 'status_shipping',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Source",
                name  : 'source',
                data  : 'source',
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
            ajax    : "/ajax/dt-orders?status=CANCELED",
            order           : [[1, 'desc']],
        }, undefined);

        tableOrdersConfirmed = initDatatable('#table_orders_confirmed', [
            {
                title : 'Number',
                name  : 'number',
                data  : 'number',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Date",
                name  : 'created_at',
                data  : 'created_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Customer",
                name  : 'customer',
                data  : 'customer',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Products",
                name  : 'products',
                data  : 'products',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : "Total",
                name  : 'total_ttc',
                data  : 'total_ttc',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status",
                name  : 'state',
                data  : 'state',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status shipping",
                name  : 'status_shipping',
                data  : 'status_shipping',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Source",
                name  : 'source',
                data  : 'source',
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
            ajax    : "/ajax/dt-orders?status=CONFIRMED",
            order           : [[1, 'desc']],
        }, undefined);

        tableOrdersShipping = initDatatable('#table_orders_shipping', [
            {
                title : 'Number',
                name  : 'number',
                data  : 'number',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Date",
                name  : 'created_at',
                data  : 'created_at',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Customer",
                name  : 'customer',
                data  : 'customer',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Products",
                name  : 'products',
                data  : 'products',
                render: null,
                orderable : false,
                searchable : false,
            },
            {
                title : "Total",
                name  : 'total_ttc',
                data  : 'total_ttc',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status",
                name  : 'state',
                data  : 'state',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Status shipping",
                name  : 'status_shipping',
                data  : 'status_shipping',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : "Source",
                name  : 'source',
                data  : 'source',
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
            ajax    : "/ajax/dt-orders?status=SHIPPING",
            order           : [[1, 'desc']],
        }, undefined);

        billStatic();

        $(document).on('click','.gc_navigate li',function (e) {

            var target = $(this).find('a').attr('href'); // ex: "#requester"

            // Remove active from all tabs
            $('.gc_navigate li').removeClass('active');
            $(this).addClass('active');

            // Hide all tab panes
            $('.tab-content .tab-pane').removeClass('active');

            // Show selected pane
            $(target).addClass('active');

        })

    })
        .on('new-order',function (elem,data) {
            newOrder();
        });

    function billStatic(){

        run_waitMe($('.gc_navigate'), 3, 'bouncePulse');

        $.get('/ajax/order-statis', function (res) {

            if(res.success){

                $('[data-stats="count_canceled"]').text(res.data.total_canceled);
                $('[data-stats="count_pending"]').text(res.data.total_pending);
                $('[data-stats="count_confirmed"]').text(res.data.total_confirmed);
                $('[data-stats="count_shipping"]').text(res.data.total_shipping);

            } else {

                Toast.fire({
                    icon: "error",
                    title: res.message ?? 'Unexpected error'
                });

            }

        }, 'json')
            .fail(function(xhr){

                let message = 'Server error';

                if(xhr.responseJSON && xhr.responseJSON.message){
                    message = xhr.responseJSON.message;
                }

                Toast.fire({
                    icon: "error",
                    title: message
                });

            })
            .always(function () {

                setTimeout(function () {
                    $(".gc_navigate").waitMe('hide');
                }, 800);

            });
    }

    function newOrder(){

        modalAjax('/ajax/new-order/', {

            title           : 'New order',
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

                let $orderCustomer = $('#order_customer');
                $orderCustomer.selectpicker();

                $orderCustomer.on('shown.bs.select', function () {

                    let $select = $(this);

                    $('.bs-searchbox input').off('input').on('input', function () {

                        let search = $(this).val();

                        if (search.length < 2) return;

                        $.ajax({
                            url: '/ajax/search-customers',
                            type: 'GET',
                            data: { q: search },
                            dataType: 'json',
                            success: function (res) {

                                let options = '';

                                if (!res.length) {
                                    options = '<option disabled>No results</option>';
                                } else {
                                    $.each(res, function (index, item) {
                                        options += `
                            <option value="${item.id}">
                                ${item.first_name} ${item.last_name} (${item.phone})
                            </option>
                        `;
                                    });
                                }

                                $select.html(options);
                                $select.selectpicker('refresh');
                            }
                        });

                    });

                });

                $(document).on('change', '#product_search', function () {

                    let productId = $(this).val();
                    let $variantSelect = $('#product_variants');

                    if (!productId) return;

                    // Show loading state
                    $variantSelect.removeClass('d-none')
                        .html('<option selected disabled>Loading...</option>');

                    $.ajax({
                        url: '/ajax/get-variants-product/' + productId,
                        type: 'GET',
                        dataType: 'json',
                        success: function (res) {

                            if (!res.success) {
                                $variantSelect
                                    .html('<option selected disabled>No variants found</option>');
                                return;
                            }

                            if (!res.variants.length) {
                                $variantSelect
                                    .html('<option selected disabled>No variants available</option>');
                                return;
                            }

                            let options = '<option selected disabled value="">Sélectionner</option>';

                            $.each(res.variants, function (index, variant) {

                                options += `
                                    <option value="${variant.sku}" data-price="${variant.price ?? 0}">
                                        ${variant.name + ' '+variant.sku}
                                    </option>
                                `;
                            });

                            $variantSelect.html(options).removeClass('d-none');
                        },
                        error: function (xhr) {

                            console.error(xhr);

                            $variantSelect
                                .html('<option selected disabled>Error loading variants</option>');

                            Toast.fire({
                                icon: "error",
                                title: 'Unable to load variants'
                            });
                        }
                    });
                });

                $(document).on('change', '#order_customer', function () {

                    let customerId = $(this).val();
                    let $variantSelect = $('#product_variants');

                    if (!customerId) return;

                    // Show loading state
                    run_waitMe(jQuery('#form_new_order'), 1, 'facebook');

                    $.ajax({
                        url: '/ajax/get-customer/' + customerId,
                        type: 'GET',
                        dataType: 'json',
                        success: function (res) {

                            if (!res.success) {
                                Toast.fire({
                                    icon: "error",
                                    title: 'No customer found'
                                });
                                return;
                            }

                            if (!res.customer) {
                                Toast.fire({
                                    icon: "error",
                                    title: 'No customer available'
                                });
                                return;
                            }

                            let customer = res.customer;

                            $('#order_first_name').val(customer.first_name);
                            $('#order_last_name').val(customer.last_name);
                            $('#order_email').val(customer.email);
                            $('#order_phone').val(customer.phone);
                            $('#order_billing_address').val(customer.address);

                        },
                        error: function (xhr) {

                            Toast.fire({
                                icon: "error",
                                title: 'Unable to load customer'
                            });
                        },
                        complete: function() {
                            setTimeout(function () {
                                $("#form_new_order").waitMe('hide');
                            },500);
                        }
                    });
                });

                $('#order_custom_number').on('blur', function () {

                    let number = $(this).val();

                    $.get('/ajax/check-order-number', { number: number }, function (res) {

                        if (res.exists) {
                            Toast.fire({
                                icon: "error",
                                title: 'This number already exists!'
                            });
                        }

                    });
                });

            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#form_new_order');
                let formData = new FormData(form[0]);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/store-order',
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

                                window.location.href = '/order/details/'+res.order_id;

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


    }

});

//Details order
$(function () {

    let page = $('#page-details-order');

    if(page.length ===0 ) return false;

    const orderID = $('#order_id').val();

    $(document).ready(function () {
        loadOrderProducts(orderID);
        loadOrder(orderID);
        recentActivity(orderID);
    })
        .on('order-new-product',function (elem,data) {
            newOrderProduct(orderID);
        })
        .on('edit-order-item',function (elem,data) {
            let orderItemId = data.element.data('id');
            editOrderItem(orderID,orderItemId);
        })
        .on('order-custom-product',function (elem,data) {
            customOrderProduct(orderID);
        })
        .on('edit-order-customer',function (elem,data) {
            editOrderCustomer(orderID);
        })
        .on('edit-order-note',function (elem,data) {
            editOrderNote(orderID);
        })
        .on('update-shipping-status',function (elem,data) {
            Swal.fire({
                title: "Update Shipping Status",
                text: "Do you really want to set this order's shipping status to Pending?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, update it!",
                cancelButtonText: "Cancel",
                imageUrl: window.APP_URL + "assets/images/gif/online-shopping.gif", // optional, you can change image
                imageWidth: 120,
                imageHeight: 120,
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: '/ajax/update-shipping-status',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            order_id: orderID,
                            _token: $('meta[name="csrf-token"]').attr('content') // CSRF token for Laravel
                        },
                        success: function(res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                loadOrder(orderID); // refresh order details
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
                                title: "Something went wrong"
                            });
                        }
                    });
                }
            });
        })
        .on('cancel-shipping',function (elem,data) {
            Swal.fire({
                title: "Update Shipping Status",
                text: "Do you really want to cancel shipping order?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, cancel it!",
                cancelButtonText: "Cancel",
                imageUrl: window.APP_URL + "assets/images/gif/online-shopping.gif", // optional, you can change image
                imageWidth: 120,
                imageHeight: 120,
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: '/ajax/order/cancel-shipping',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            order_id: orderID,
                            _token: $('meta[name="csrf-token"]').attr('content') // CSRF token for Laravel
                        },
                        success: function(res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                loadOrder(orderID); // refresh order details
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
                                title: "Something went wrong"
                            });
                        }
                    });
                }
            });
        })
        .on('delete-order-item',function (elem,data) {

            let orderItemId = data.element.data('id');

            Swal.fire({
                title: "Are you sure?",
                text: 'Do you really want to delete the order item?',
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, delete it!",
                imageUrl: window.APP_URL + "assets/images/gif/trash.gif",
                imageWidth: 120,
                imageHeight: 120,
            }).then((result) => {
                if (result.isConfirmed) {

                    $.post('/ajax/delete-order-item',{'order_item_id' : orderItemId},function (res) {

                        if(res.success){

                            Toast.fire({
                                icon: "success",
                                title: res.message
                            });
                            loadOrderProducts(orderID);

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

        })
        .on('change-order-status', function (elem, data) {

            let status = data.element.data('status');

            // ✅ If status is cancelled, show motif modal
            if (status === 'cancelled') {

                modalAjax('/ajax/order-cancel-reason/'+orderID, {
                    title        : 'Cancel Order',
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
                    onLoad       : function () {
                        // Optional: any JS to run inside the modal on load
                    },
                    onOk         : function (modal, loader, success, fail) {

                        let form = $('#form_cancel_reason');
                        let formData = new FormData(form[0]);

                        if (form[0].checkValidity()) {
                            $('.modal-footer button')
                                .addClass('loading')
                                .html('<span class="spinner"></span> Inprogress');

                            // Send AJAX to update order status
                            $.ajax({
                                url: '/ajax/change-order-status',
                                type: 'POST',
                                data: {
                                    order_id: orderID,
                                    order_status: status,
                                    cancel_reason: $('#cancel_reason').val(),
                                    _token: $('meta[name="csrf-token"]').attr('content')
                                },
                                dataType: 'json',
                                success: function (res) {
                                    if (res.success) {
                                        Toast.fire({
                                            icon: "success",
                                            title: res.message
                                        });
                                        modal.modal('hide');
                                        loadOrder(orderID);
                                    } else {
                                        Toast.fire({
                                            icon: "error",
                                            title: res.message
                                        });
                                    }
                                },
                                error: function (xhr) {
                                    console.error(xhr);
                                    Toast.fire({
                                        icon: "error",
                                        title: "Something went wrong"
                                    });
                                }
                            });

                        }
                        else{

                            form[0].reportValidity();

                        }
                    },
                    onCancel     : function () {},
                    onClose      : function () {}
                });

                return; // stop the normal status confirmation popup
            }

            // ✅ Normal status change for other statuses
            Swal.fire({
                title: "Are you sure?",
                text: "Do you really want to change status for this order?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, confirm it!",
                cancelButtonText: "Cancel"
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: '/ajax/change-order-status',
                        type: 'POST',
                        data: {
                            order_id: orderID,
                            order_status: status,
                            _token: $('meta[name="csrf-token"]').attr('content')
                        },
                        dataType: 'json',
                        success: function (res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                loadOrder(orderID);
                            } else {
                                Toast.fire({
                                    icon: "error",
                                    title: res.message
                                });
                            }
                        },
                        error: function (xhr) {
                            Toast.fire({
                                icon: "error",
                                title: "Something went wrong"
                            });
                            console.error(xhr);
                        }
                    });
                }
            });

        })
        .on('make-no-response', function (elem, data) {

            let status = data.element.data('status');

            Swal.fire({
                title: "Are you sure?",
                text: "Do you really want to mark this order as “No Response”?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#16C7F9",
                cancelButtonColor: "#FC4438",
                confirmButtonText: "Yes, confirm it!",
                cancelButtonText: "Cancel"
            }).then((result) => {

                if (result.isConfirmed) {

                    $.ajax({
                        url: '/ajax/order-no-response',
                        type: 'POST',
                        data: {
                            order_id: orderID,
                            order_status: status,
                            _token: $('meta[name="csrf-token"]').attr('content')
                        },
                        dataType: 'json',
                        success: function (res) {

                            if (res.success) {

                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });

                                loadOrder(orderID);

                            } else {

                                Toast.fire({
                                    icon: "error",
                                    title: res.message
                                });
                            }
                        },
                        error: function (xhr) {

                            Toast.fire({
                                icon: "error",
                                title: "Something went wrong"
                            });

                            console.error(xhr);
                        }
                    });
                }
            });
        });

    function loadOrder(orderId){

        run_waitMe(jQuery('#order_status'), 1, 'facebook');

        $.ajax({
            url: '/order/load/' + orderId,
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                if (!res.success) return;

                if(res.order){

                    run_waitMe(jQuery('#order_note_content'), 1, 'facebook');

                    $('#order_number').text('#' + res.order.id);
                    $('#order_note').text( res.order.note);
                    $('#order_custom_number').text('#' + res.order.custom_number);

                    let orderstatus = res.order?.state;

                    let orderActions = '';

                    if (orderstatus && res.is_confirmed) {

                        let actionsStatus = '';
                        $.each(res.order_status, function(index, item) {
                            if (orderstatus !== index) {
                                actionsStatus += `
                <li data-action="change-order-status" data-status="${index}">
                    <a class="dropdown-item" href="JavaScript:void(0)">${item}</a>
                </li>
            `;
                            }
                        });

                         orderActions += `
                                <div class="btn-group float-end">
                                    <button class="btn btn-outline-primary btn-sm"
                                        data-action="${orderstatus === 'no_response' ? 'make-no-response' : ''}"
                                        type="button" data-status="${orderstatus}">
                                        ${res.order_status[orderstatus]}
                                        ${orderstatus === 'no_response' ? '<strong>(' + res.count_no_response + ')</strong>' : ''}
                                    </button>
                                    <button class="btn btn-sm btn-primary dropdown-toggle dropdown-toggle-split"
                                        type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
                                    <ul class="dropdown-menu dropdown-block">
                                        ${actionsStatus}
                                    </ul>
                                </div>
                            `;

                        $("#order_actions").html(orderActions);

                    }

                    if(res.is_handler && res.order?.state === 'confirmed') {

                        if(res.order.status_shipping === 'pending'){

                            orderActions += `<button class="btn btn-outline-primary btn-sm b-r-8 float-end mr-4"
                                data-action="update-shipping-status" style="margin-right: 11px;">
                                <i class="fa fa-shipping-fast"></i> Shipping: Pending</button>`;

                        }

                        else if(res.order.status_shipping === 'processing'){

                            orderActions += `<button class="btn btn-outline-danger btn-sm b-r-8 float-end"
                                            data-action="cancel-shipping" style="margin-right: 11px;">
                                        <i class="fa fa-times"></i> Cancel Shipping
                                    </button>`;


                        }

                        $("#order_actions").html(orderActions);
                    }

                    activateStepper(orderstatus);

                    loadCustomer(res.order);

                    recentActivity(orderId);

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
                setTimeout(function () {
                    $("#order_status").waitMe('hide');
                    $("#order_note_content").waitMe('hide');
                },500);
            }
        });
    }
    function loadCustomer(order){

        run_waitMe(jQuery('#customer-details'), 1, 'facebook');

        let content = `<li>
                            <h6>Name </h6><span>${order.customer}</span>
                        </li>
                        <li>
                            <h6>Email Address:</h6><span>${order.email}</span>
                        </li>
                        <li>
                            <h6>Phone:</h6><span>${order.phone}</span>
                        </li>
                        <li>
                            <h6>Billing Address:</h6><span>${order.billing_address}</span>
                        </li>
                        <li>
                            <h6>Shipping Address:</h6><span>${order.customer_address}</span>
                        </li>
                        <li>
                            <h6>Payment Mode:</h6><span>COD</span>
                        </li>`;

        $('.customer-details').html(content);

        setTimeout(function () {
            $("#customer-details").waitMe('hide');
        },600);

    }
    function activateStepper(status) {

        // Reset all steps first
        $('#stepper1 .step').removeClass('active done');

        let stepIndex = 1;

        switch (status) {
            case 'pending':
                stepIndex = 2; // because first two are pending
                break;

            case 'no_response':
                stepIndex = 1;
                break;

            case 'confirmed':
            case 'shipped':
                stepIndex = 3;
                break;

            case 'delivered':
                stepIndex = 4;
                break;

            case 'cancelled':
            case 'failed':
            case 'refunded':
                stepIndex = 0; // special case
                break;
        }

        // If cancelled / failed / refunded
        if (stepIndex === 0) {
            $('#stepper1 .step').removeClass('active done');
            return;
        }

        // Activate steps
        $('#stepper1 .step').each(function(index) {

            let currentStep = index + 1;

            if (currentStep <= stepIndex) {
                $(this).addClass('done active');
            }

        });
    }

    function loadOrderProducts(orderId) {

        const $orderProducts = $('#order-products');
        let content = '';

        // Loading state
        $orderProducts.html(
            '<tr><td colspan="6" class="text-center">Loading...</td></tr>'
        );

        run_waitMe(jQuery('#order-details-product'), 1, 'roundBounce');

        $.ajax({
            url: '/order/load-products/' + orderId,
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                if (!res.success) return;

                if (!res.items.length) {
                    $orderProducts.html(
                        '<tr><td colspan="6" class="text-center">No products found</td></tr>'
                    );
                    return;
                }

                let total = 0;

                $.each(res.items, function (index, item) {

                    total += parseFloat(item.total);

                    let image = item.path
                        ? '/uploads/' + item.path
                        : '/assets/images/default-product.png';

                    let actionsColumn = '';

                    if (res.product_actions) {
                        actionsColumn = `
                                <td>
                                    <button class="btn btn-outline-danger delete-item"
                                        data-action="delete-order-item"
                                        data-id="${item.id}"
                                        style="width:30px;height:30px;padding:0;">
                                        <i class="fa fa-trash"></i>
                                    </button>

                                    <button class="btn btn-outline-info edit-item"
                                        data-action="edit-order-item"
                                        data-id="${item.id}"
                                        style="width:30px;height:30px;padding:0;">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                </td>
                            `;
                    } else {
                        actionsColumn = `<td></td>`;
                    }

                    content += `
                    <tr>
                        <td>
                            <div class="light-product-box">
                                <img class="img-fluid"
                                     src="${image}"
                                     alt="${item.name}">
                            </div>
                        </td>

                        <td>
                            <ul>
                                <li>
                                    <h6>
                                        <a href="#">${item.name ?? '-'}</a>
                                    </h6>
                                </li>
                                <li>
                                    <p>${item.sku ?? '-'}</p>
                                </li>
                            </ul>
                        </td>

                        <td>${parseFloat(item.price).toFixed(2)}</td>
                        <td>${item.quantity}</td>
                        <td>${parseFloat(item.total).toFixed(2)}</td>
                        ${actionsColumn}
                    </tr>
                `;
                });

                $orderProducts.html(content);
                $('#order_total').text(total.toFixed(2));

                $.post('/ajax/order/update-total-price', {
                    order_id: orderId,
                    total_price: total
                }, function(response) {
                    if (response.success) {
                        Toast.fire({
                            icon: 'success',
                            title: response.message
                        });
                    } else {
                        Toast.fire({
                            icon: 'error',
                            title: response.message || 'Erreur inconnue'
                        });
                    }
                }, 'json')
                    .fail(function(xhr) {
                        Toast.fire({
                            icon: 'error',
                            title: xhr.responseJSON?.message || 'Erreur serveur'
                        });
                    });



                recentActivity(orderId);

            },
            error: function(xhr) {
                console.error(xhr);
                Toast.fire({
                    icon: "error",
                    title: 'Server error. Please try again.'
                });
            },
            complete: function() {
                setTimeout(function () {
                    $("#order-details-product").waitMe('hide');
                },500);
            }
        });
    }

    function recentActivity(orderId){

        run_waitMe(jQuery('#order_recent_activity'), orderId, 'facebook');

        $.ajax({
            url: '/order/recent-activities/' + orderId,
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                if (!res.success) return;

                let content = '';

                if (!res.activities.length) {
                    content = `<li class="text-center p-3">No recent activity</li>`;
                    $('#order_recent_activity').html(content);
                    return;
                }

                const actionColorMap = {
                    create: 'primary',
                    update: 'warning',
                    delete: 'danger',
                    status_change: 'success',
                    payment_update: 'info'
                };

                $.each(res.activities, function(index, activity){

                    let color = actionColorMap[activity.action] ?? 'primary';

                    content += `
                    <li class="d-flex">
                        <div class="activity-dot-${color}"></div>
                        <div class="w-100 ms-3">
                            <p class="d-flex justify-content-between mb-2">
                                <span class="date-content light-background">
                                    ${activity.date}
                                </span>
                            </p>
                            <h6>
                                ${activity.user}
                                <span class="dot-notification"></span>
                            </h6>
                            <span class="f-light">
                                ${activity.description ?? activity.action}
                            </span>
                        </div>
                    </li>
                `;
                });

                $('#order_recent_activity').html(content);

            },
            error: function(xhr) {
                console.error(xhr);
                Toast.fire({
                    icon: "error",
                    title: 'Server error. Please try again.'
                });
            },
            complete: function() {
                setTimeout(function () {
                    $("#order_recent_activity").waitMe('hide');
                }, 300);
            }
        });
    }

    function newOrderProduct(orderId) {

        modalAjax('/ajax/order-new-product/', {

            title           : 'New product',
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
            onLoad          : function(){

                $('#product_search').selectpicker();

                $('#product_search').on('shown.bs.select', function () {

                    let $select = $(this);

                    $('.bs-searchbox input').off('input').on('input', function () {

                        let search = $(this).val();

                        if (search.length < 2) return;

                        $.ajax({
                            url: '/ajax/search-products',
                            type: 'GET',
                            data: { q: search },
                            dataType: 'json',
                            success: function (res) {

                                let options = '';

                                if (!res.length) {
                                    options = '<option disabled>No results</option>';
                                } else {
                                    $.each(res, function (index, item) {
                                        options += `
                            <option value="${item.id}">
                                ${item.name} (${item.sku})
                            </option>
                        `;
                                    });
                                }

                                $select.html(options);
                                $select.selectpicker('refresh');
                            }
                        });

                    });

                });
                $(document).on('change', '#product_search', function () {

                    let productId = $(this).val();
                    let $variantSelect = $('#product_variants');

                    if (!productId) return;

                    // Show loading state
                    $variantSelect.removeClass('d-none')
                        .html('<option selected disabled>Loading...</option>');

                    $.ajax({
                        url: '/ajax/get-variants-product/' + productId,
                        type: 'GET',
                        dataType: 'json',
                        success: function (res) {

                            if (!res.success) {
                                $variantSelect
                                    .html('<option selected disabled>No variants found</option>');
                                return;
                            }

                            if (!res.variants.length) {
                                $variantSelect
                                    .html('<option selected disabled>No variants available</option>');
                                return;
                            }

                            let options = '<option selected disabled value="">Sélectionner</option>';

                            $.each(res.variants, function (index, variant) {

                                options += `
                                    <option value="${variant.sku}" data-price="${variant.price ?? 0}">
                                        ${variant.name + ' '+variant.sku}
                                    </option>
                                `;
                            });

                            $variantSelect.html(options).removeClass('d-none');
                        },
                        error: function (xhr) {

                            console.error(xhr);

                            $variantSelect
                                .html('<option selected disabled>Error loading variants</option>');

                            Toast.fire({
                                icon: "error",
                                title: 'Unable to load variants'
                            });
                        }
                    });
                })
                    .on('change', '#product_variants', function () {

                        let selectedOption = $(this).find(':selected');

                        let price = selectedOption.data('price'),
                            sku = selectedOption.val();

                        if (!price) {
                            $('#order_products').addClass('d-none');
                            return;
                        }

                        // Show price & quantity section
                        $('#order_products').removeClass('d-none');

                        // Fill price
                        $('#product_price').val(parseFloat(price).toFixed(2));
                        $('#product_sku').val(sku);

                        // Default quantity
                        $('#product_quantity').val(1);
                    });


            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#order_new_product');
                let formData = new FormData(form[0]);

                // Append order_id
                formData.append('order_id', orderId);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/store-order-product',
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

                                loadOrderProducts(orderId);

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

    function editOrderItem(orderId,orderItemId) {

        modalAjax('/ajax/edit-order-item/'+orderItemId, {

            title           : 'Edit order item' ,
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

                let form = $('#order_edit_product');
                let formData = new FormData(form[0]);

                // Append order_id
                formData.append('order_item_id', orderItemId);
                formData.append('order_id', orderID);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/update-order-item/'+orderItemId,
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

                                loadOrderProducts(orderId);

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
    }

    function editOrderCustomer(orderId) {

        modalAjax('/ajax/edit-order-customer/'+orderId, {

            title           : 'Edit order customer' ,
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

                let form = $('#order_edit_customer');
                let formData = new FormData(form[0]);

                // Append order_id
                formData.append('order_id', orderId);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/update-order-customer',
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

                                loadOrder(orderId);

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
    }

    function editOrderNote(orderId) {

        modalAjax('/ajax/edit-order-note/'+orderId, {

            title           : 'Edit order note' ,
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
            onLoad          : function(){

                $('#custom_number').on('blur', function () {

                    let number = $(this).val();

                    $.get('/ajax/check-order-number', {
                        order_id: orderId,
                        number: number
                    }, function (res) {

                        if (res.exists) {
                            Toast.fire({
                                icon: "error",
                                title: 'This number already exists!'
                            });
                        }

                    });
                });

            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#order_edit_note');
                let formData = new FormData(form[0]);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    formData.append('order_id', orderId);

                    $.ajax({
                        url: '/ajax/update-order-note',
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

                                loadOrder(orderId);

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
    }

    function customOrderProduct (orderId) {

        let removeImage = false;

        modalAjax('/ajax/new-custom-product/', {

            title           : 'Custom product',
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

                $('#custom_product_image').dropify();

                $('.dropify-message .file-icon p').hide();


            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#form_custom_product');
                let formData = new FormData(form[0]);

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    formData.append('order_id', orderId);

                    $.ajax({
                        url: '/ajax/store-custom-product',
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
                                loadOrderProducts(orderId);

                                modal.modal('hide');

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




