<div class="page-body" id="page-orders">
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Orders </h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('dashboard')  }}">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-home"></use>
                                </svg>
                            </a>
                        </li>
                        <li class="breadcrumb-item">Orders</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid common-order-history">
        <div class="row">
            <div class="col-sm-12">
                <div class="card heading-space">
                    <div class="gc_navigate">
                        <ul>
                            <li class="active">
                                <a href="#all_orders">
                                    <i class="fa fa-home"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#orders_pending">
                                    <i class="fa fa-bars-progress"></i>
                                    <span>Pending</span>
                                    <b data-stats="count_pending">0</b>
                                </a>
                            </li>
                            <li>
                                <a href="#orders_canceled">
                                    <i class="fa fa-cancel"></i>
                                    <span>Canceled</span>
                                    <b data-stats="count_canceled">0</b>
                                </a>
                            </li>
                            <li>
                                <a href="#orders_confirmed">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Confirmed</span>
                                    <b data-stats="count_confirmed">0</b>
                                </a>
                            </li>
                            <li>
                                <a href="#orders_shipping">
                                    <i class="fa fa-shipping-fast"></i>
                                    <span>Shipping</span>
                                    <b data-stats="count_shipping">0</b>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-header card-no-border text-end">
                        <div class="card-header-right-icon">
                            @if(auth()->user()->hasRole('admin', 'order_confirmation'))

                                <a class="btn btn-primary f-w-500" href="JavaScript:void(0)" data-action="new-order">
                                    <i class="fa fa-plus pe-2"></i>
                                    New order
                                </a>

                            @endif
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="tab-content p-3" id="content_orders" style="min-height: 200px">
                            <div class="tab-pane active" id="all_orders" role="tabpanel">

                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table" id="table_all_orders">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th> <span class="f-light f-w-600">Number</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Customer</span></th>
                                                <th> <span class="f-light f-w-600">Products</span></th>
                                                <th> <span class="f-light f-w-600">Total</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Status shipping</span></th>
                                                <th> <span class="f-light f-w-600">Source</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane" id="orders_canceled" role="tabpanel">

                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table" id="table_orders_canceled">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th> <span class="f-light f-w-600">Number</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Customer</span></th>
                                                <th> <span class="f-light f-w-600">Products</span></th>
                                                <th> <span class="f-light f-w-600">Total</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Status shipping</span></th>
                                                <th> <span class="f-light f-w-600">Source</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane" id="orders_pending" role="tabpanel">

                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table" id="table_orders_pending">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th> <span class="f-light f-w-600">Number</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Customer</span></th>
                                                <th> <span class="f-light f-w-600">Products</span></th>
                                                <th> <span class="f-light f-w-600">Total</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Status shipping</span></th>
                                                <th> <span class="f-light f-w-600">Source</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane" id="orders_confirmed" role="tabpanel">

                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table" id="table_orders_confirmed">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th> <span class="f-light f-w-600">Number</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Customer</span></th>
                                                <th> <span class="f-light f-w-600">Products</span></th>
                                                <th> <span class="f-light f-w-600">Total</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Status shipping</span></th>
                                                <th> <span class="f-light f-w-600">Source</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane" id="orders_shipping" role="tabpanel">

                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table" id="table_orders_shipping">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th> <span class="f-light f-w-600">Number</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Customer</span></th>
                                                <th> <span class="f-light f-w-600">Products</span></th>
                                                <th> <span class="f-light f-w-600">Total</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Status shipping</span></th>
                                                <th> <span class="f-light f-w-600">Source</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
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
