<div class="sidebar-wrapper" data-sidebar-layout="stroke-svg">
    <div>
        <div class="logo-wrapper">
            <a href="index.html"><img class="img-fluid for-light" src="{{ asset('assets/images/logo/logo.png') }}" alt="">
                <img class="img-fluid for-dark" src="{{ asset('assets/images/logo/logo_dark.png') }}" alt=""></a>
            <div class="back-btn"><i class="fa-solid fa-angle-left"></i></div>
            <div class="toggle-sidebar"><i class="status_toggle middle sidebar-toggle" data-feather="grid"> </i></div>
        </div>
        <div class="logo-icon-wrapper"><a href="index.html"><img class="img-fluid" src="../assets/images/logo/logo-icon.png" alt=""></a></div>
        <nav class="sidebar-main">
            <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
            <div id="sidebar-menu">
                <ul class="sidebar-links" id="simple-bar">
                    <li class="back-btn">
                        <a href="index.html"><img class="img-fluid" src="../assets/images/logo/logo-icon.png" alt=""></a>
                        <div class="mobile-back text-end"><span>Back</span><i class="fa-solid fa-angle-right ps-2" aria-hidden="true"></i></div>
                    </li>
                    <li class="pin-title sidebar-main-title">
                        <div>
                            <h6>Pinned</h6>
                        </div>
                    </li>

                    @if(auth()->user()->hasRole('admin', 'order_confirmation','order_handler'))

                        <li class="sidebar-list {{ request()->routeIs('orders') ? 'active' : '' }}">
                            <i class="fa-solid fa-thumbtack"></i>
                            <a class="sidebar-link sidebar-title link-nav {{ request()->routeIs('orders') ? 'active' : '' }}"
                               href="{{ route('orders') }}">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-ecommerce"></use>
                                </svg>
                                <svg class="fill-icon">
                                    <use href="../assets/svg/icon-sprite.svg#fill-file"></use>
                                </svg>
                                <span>Orders</span>
                            </a>
                        </li>

                    @endif

                    @if(auth()->user()->hasRole('admin', 'order_confirmation'))

                        <li class="sidebar-list">
                            <i class="fa-solid fa-thumbtack"> </i>
                            <a class="sidebar-link sidebar-title {{ request()->routeIs('categories') ? 'active' : '' }}" href="#">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-board"></use>
                                </svg>
                                <svg class="fill-icon">
                                    <use href="../assets/svg/icon-sprite.svg#fill-project"></use>
                                </svg>
                                <span>Products
                                </span>
                            </a>
                            <ul class="sidebar-submenu" style="display: block">
                                <li>
                                    <a href="{{ route('products') }}" class="{{ request()->routeIs('products') ? 'active' : '' }}">
                                        Products
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ route('categories') }}" class="{{ request()->routeIs('categories') ? 'active' : '' }}">
                                        Categories
                                    </a>
                                </li>
                            </ul>
                        </li>

                    @endif

                </ul>
            </div>
            <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
        </nav>
    </div>
</div>
