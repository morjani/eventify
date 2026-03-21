<div class="page-body" id="page-event">
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Participant List </h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-home"></use>
                                </svg>
                            </a>
                        </li>
                        <li class="breadcrumb-item">Participant</li>
                        <li class="breadcrumb-item active">Participant List</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card heading-space">
                    <div class="card-header card-no-border text-end">
                        <div class="card-header-right-icon">
                            <a class="btn btn-primary f-w-500" href="JavaScript:void(0)" data-action="new-product">
                                <i class="fa fa-plus pe-2"></i>
                                Add Participant
                            </a>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="order-history-wrapper">
                                    <div class="recent-table table-responsive custom-scrollbar">
                                        <table class="table dataTable" id="table-event">
                                            <thead>
                                            <tr>
                                               
                                                <th> <span class="f-light f-w-600">Demandeur</span></th>
                                                <th> <span class="f-light f-w-600">Demande</span></th>
                                                <th> <span class="f-light f-w-600">Date</span></th>
                                                <th> <span class="f-light f-w-600">Heure</span></th>
                                                <th> <span class="f-light f-w-600">Status</span></th>
                                                <th> <span class="f-light f-w-600">Action</span></th>
                                               
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
<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
  <script src="{{ asset('assets/js/PageEvent.js') }}"></script>