<div class="page-body" id="page-details-order">
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Order Details</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-home"></use>
                                </svg></a></li>
                        <li class="breadcrumb-item">Ecommerce</li>
                        <li class="breadcrumb-item active"> Order Details</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="d-none">
        <input type="text" id="order_id" value="<?= $orderId ?>">
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-xxl-9 col-xl-8 box-col-8e">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Order Status</h5>
                            </div>
                            <div class="card-body track-order-details basic-wizard" id="order_status">
                                <div class="stepper-horizontal custom-scrollbar" id="stepper1">
                                    <div class="stepper-one stepper step">
                                        <div class="step-circle"><span>1</span></div>
                                        <div class="step-title">Order Received</div>
                                        <div class="step-bar-left"></div>
                                        <div class="step-bar-right"></div>
                                    </div>
                                    <div class="stepper-two step">
                                        <div class="step-circle"><span>2</span></div>
                                        <div class="step-title">Processing</div>
                                        <div class="step-bar-left"></div>
                                        <div class="step-bar-right"></div>
                                    </div>
                                    <div class="stepper-three step">
                                        <div class="step-circle"><span>3</span></div>
                                        <div class="step-title">Confirmed</div>
                                        <div class="step-bar-left"></div>
                                        <div class="step-bar-right"></div>
                                    </div>
                                    <div class="stepper-four step">
                                        <div class="step-circle"><span>4</span></div>
                                        <div class="step-title">Delivered</div>
                                        <div class="step-bar-left"></div>
                                        <div class="step-bar-right"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12" id="order_note_content">
                        <div class="card widget-hover">
                            <div class="card-header card-no-border">
                                <div class="header-top">
                                    <h5>Custom Number: <span id="order_custom_number"></span></h5>

                                    @if(auth()->user()->hasRole('admin', 'order_confirmation'))

                                        <a class="f-light d-flex align-items-center gap-1 fs-1" href="JavaScript:void(0)"
                                           data-action="edit-order-note">
                                            <i class="fs-5 icon-pencil"></i>
                                        </a>

                                    @endif
                                </div>
                            </div>
                            <div class="card-body radial-progress-card">
                                <div>
                                    <h6 class="mb-2">Note : </h6>
                                    <p class="f-light" id="order_note">-</p>
                                </div>

                            </div>

                        </div>
                        <div class="card">
                            <div class="card-header card-no-border">
                                <div class="header-top">
                                    <h5>Order Number: <span id="order_number"></span></h5>

                                    @if(auth()->user()->hasRole('admin', 'order_confirmation'))

                                        <div class="text-right">
                                            <a class="btn btn-outline-primary btn-xs f-w-500" href="JavaScript:void(0)" data-action="order-new-product">
                                                <i class="fa fa-plus pe-2"></i>
                                                New product
                                            </a>

                                            <a class="btn btn-outline-primary btn-xs f-w-500" href="JavaScript:void(0)" data-action="order-custom-product">
                                                <i class="fa fa-plus pe-2"></i>
                                                Custom product
                                            </a>
                                        </div>

                                    @endif
                                </div>
                            </div>
                            <div class="card-body order-details-product pt-0" id="order-details-product">
                                <div class="table-responsive custom-scrollbar">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">Image</th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Qty</th>
                                            <th scope="col">Subtotal</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody id="order-products">

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4" class="text-center">Subtotal</td>
                                                <td id="order_total">0</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                                <div id="order_actions">


                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-3 col-xl-4 box-col-4">
                <div class="row">
                    <div class="col-12" id="customer-details">
                        <div class="card">
                            <div class="card-header card-no-border">
                                <div class="header-top">
                                    <h5>Customer Details</h5>

                                    @if(auth()->user()->hasRole('admin', 'order_confirmation'))

                                        <a class="f-light d-flex align-items-center gap-1 fs-1" href="JavaScript:void(0)"
                                        data-action="edit-order-customer">
                                            <i class="fs-5 icon-pencil"></i>
                                        </a>

                                    @endif
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <ul class="customer-details" style="min-height: 100px">

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header card-no-border">
                                <div class="header-top">
                                    <h5>Recent Activity</h5>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="recent-activity notification">
                                    <ul id="order_recent_activity" style="min-height: 147px;">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid Ends-->
</div>
