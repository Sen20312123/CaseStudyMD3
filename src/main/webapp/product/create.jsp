<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/02/2023
  Time: 6:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Form Elements | Zircos - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets\images\favicon.ico">

    <!-- App css -->
    <link href="/zircos-admin-dashboard/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="/zircos-admin-dashboard/assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link href="/zircos-admin-dashboard/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">

</head>


<body data-layout="horizontal">

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
    <header id="topnav">
        <!-- Topbar Start -->
        <div class="navbar-custom">
            <div class="container-fluid">
                <ul class="list-unstyled topnav-menu float-right mb-0">

                    <li class="dropdown notification-list">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle nav-link">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </li>

                    <li class="dropdown d-none d-lg-block">
                        <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="assets\images\flags\us.jpg" alt="user-image" class="mr-2" height="12"> <span class="align-middle">English <i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="assets\images\flags\germany.jpg" alt="user-image" class="mr-2" height="12"> <span class="align-middle">German</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="assets\images\flags\italy.jpg" alt="user-image" class="mr-2" height="12"> <span class="align-middle">Italian</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="assets\images\flags\spain.jpg" alt="user-image" class="mr-2" height="12"> <span class="align-middle">Spanish</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="assets\images\flags\russia.jpg" alt="user-image" class="mr-2" height="12"> <span class="align-middle">Russian</span>
                            </a>
                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="mdi mdi-bell noti-icon"></i>
                            <span class="badge badge-success rounded-circle noti-icon-badge">4</span>
                            <div class="noti-dot">
                                <span class="dot"></span>
                                <span class="pulse"></span>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-lg" style="">

                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="font-16 m-0">
                                                            <span class="float-right">
                                                                <a href="" class="text-dark">
                                                                    <small>Clear All</small>
                                                                </a>
                                                            </span>Notification
                                </h5>
                            </div>

                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 422.938px;"><div class="slimscroll noti-scroll" style="overflow: hidden; width: auto; height: 422.938px;">

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-success">
                                        <i class="mdi mdi-settings-outline"></i>
                                    </div>
                                    <p class="notify-details">New settings
                                        <small class="text-muted">There are new settings available</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-info">
                                        <i class="mdi mdi-bell-outline"></i>
                                    </div>
                                    <p class="notify-details">Updates
                                        <small class="text-muted">There are 2 new updates available</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-danger">
                                        <i class="mdi mdi-account-plus"></i>
                                    </div>
                                    <p class="notify-details">New user
                                        <small class="text-muted">You have 10 unread messages</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-info">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Caleb Flakelar commented on Admin
                                        <small class="text-muted">4 days ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-secondary">
                                        <i class="mdi mdi-heart"></i>
                                    </div>
                                    <p class="notify-details">Carlos Crouch liked
                                        <b>Admin</b>
                                        <small class="text-muted">13 days ago</small>
                                    </p>
                                </a>
                            </div><div class="slimScrollBar" style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>

                            <!-- All-->
                            <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                See all Notification
                                <i class="fi-arrow-right"></i>
                            </a>

                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="mdi mdi-email noti-icon"></i>
                            <span class="badge badge-danger rounded-circle noti-icon-badge">8</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="font-16 m-0">
                                                            <span class="float-right">
                                                                <a href="" class="text-dark">
                                                                    <small>Clear All</small>
                                                                </a>
                                                            </span>Messages
                                </h5>
                            </div>

                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 422.938px;"><div class="slimscroll noti-scroll" style="overflow: hidden; width: auto; height: 422.938px;">

                                <div class="inbox-widget">
                                    <a href="#">
                                        <div class="inbox-item">
                                            <div class="inbox-item-img"><img src="assets\images\users\avatar-1.jpg" class="rounded-circle" alt=""></div>
                                            <p class="inbox-item-author">Chadengle</p>
                                            <p class="inbox-item-text text-truncate">Hey! there I'm available...</p>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="inbox-item">
                                            <div class="inbox-item-img"><img src="assets\images\users\avatar-2.jpg" class="rounded-circle" alt=""></div>
                                            <p class="inbox-item-author">Tomaslau</p>
                                            <p class="inbox-item-text text-truncate">I've finished it! See you so...</p>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="inbox-item">
                                            <div class="inbox-item-img"><img src="assets\images\users\avatar-3.jpg" class="rounded-circle" alt=""></div>
                                            <p class="inbox-item-author">Stillnotdavid</p>
                                            <p class="inbox-item-text text-truncate">This theme is awesome!</p>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="inbox-item">
                                            <div class="inbox-item-img"><img src="assets\images\users\avatar-4.jpg" class="rounded-circle" alt=""></div>
                                            <p class="inbox-item-author">Kurafire</p>
                                            <p class="inbox-item-text text-truncate">Nice to meet you</p>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="inbox-item">
                                            <div class="inbox-item-img"><img src="assets\images\users\avatar-5.jpg" class="rounded-circle" alt=""></div>
                                            <p class="inbox-item-author">Shahedk</p>
                                            <p class="inbox-item-text text-truncate">Hey! there I'm available...</p>

                                        </div>
                                    </a>
                                </div> <!-- end inbox-widget -->

                            </div><div class="slimScrollBar" style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>

                            <!-- All-->
                            <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                See all Messages
                                <i class="fi-arrow-right"></i>
                            </a>



                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="assets\images\users\avatar-1.jpg" alt="user-image" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="mdi mdi-account-outline"></i>
                                <span>Profile</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="mdi mdi-settings-outline"></i>
                                <span>Settings</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="mdi mdi-lock-outline"></i>
                                <span>Lock Screen</span>
                            </a>

                            <div class="dropdown-divider"></div>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="mdi mdi-logout-variant"></i>
                                <span>Logout</span>
                            </a>

                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
                            <i class="mdi mdi-settings-outline noti-icon"></i>
                        </a>
                    </li>

                </ul>

                <!-- LOGO -->
                <div class="logo-box">
                    <a href="index.html" class="logo text-center">
                                    <span class="logo-lg">
                                        <img src="assets\images\logo.png" alt="" height="30">
                                        <!-- <span class="logo-lg-text-light">Zircos</span> -->
                                    </span>
                        <span class="logo-sm">
                                        <!-- <span class="logo-sm-text-dark">Z</span> -->
                                        <img src="assets\images\logo-sm.png" alt="" height="22">
                                    </span>
                    </a>
                </div>


                <ul class="list-unstyled topnav-menu topnav-menu-left m-0">

                    <li class="d-none d-sm-block">
                        <form class="app-search">
                            <div class="app-search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- end Topbar -->

        <div class="topbar-menu">
            <div class="container-fluid">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">
                        <li class="has-submenu">
                            <a href="/products"> <i class="mdi mdi-view-dashboard"></i>List Product</a>
                        </li>

                    </ul>
                    <!-- End navigation menu -->

                    <div class="clearfix"></div>
                </div>
                <!-- end #navigation -->
            </div>
            <!-- end container -->
        </div>
        <!-- end navbar-custom -->
    </header>
    <!-- End Navigation Bar-->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">

                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Zircos</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                                    <li class="breadcrumb-item active">Form elements</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <h4 class="header-title">Create Product</h4>
                            <div class="row">
                                <div class="col-lg-6">
                                    <c:if test="${requestScope.message != null}">
                                        <div class="alert alert-icon alert-success alert-dismissible fade show" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <i class="mdi mdi-check-all mr-2"></i>
                                            <strong>Well done!</strong> Successfully create product.
                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.errors!=null && requestScope.errors.size()!=0}">
                                        <div class="alert alert-icon alert-danger alert-dismissible fade show mb-0" role="alert">
                                            <c:forEach var="error" items="${requestScope.errors}">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <i class="mdi mdi-block-helper mr-2">${error}</i> <br>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <form class="form-horizontal" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">Name</label>
                                            <div class="col-md-10">
                                                <input type="text" name ="name" class="form-control" value="${requestScope.product.getName()}" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">Description</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" rows="2" name="description" value="${requestScope.product.getDescription()}" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">Price</label>
                                            <div class="col-md-10">
                                                <input type="number" class="form-control" name="price" value="${requestScope.product.getPrice()}" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">Quantity</label>
                                            <div class="col-md-10">
                                                <input type="number" class="form-control" name="quantity" value="${requestScope.product.getQuantity()}" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">Image</label>
                                            <div class="col-md-10">
                                                <input type="file" class="form-control" name="image" id="imgInput" required>
                                            </div>
                                            <img src="" id="idImage" style="width: 200px; height: auto">
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label"> Category</label>
                                            <div class="col-md-10">
                                                <select name="sCategories" class="col-4 form-control">
                                                    <c:forEach items="${requestScope.categories}" var="ct">
                                                        <option value="${ct.getId()}">${ct.getName()} </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-10 offset-2">
                                                <button type="submit" class="btn btn-primary" >Create</button>
                                                <a class="btn btn-warning" href="/products">Cancel</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div>
            <!-- end container-fluid -->

        </div>
        <script>
            // Chọn ảnh ở thẻ input thì hiện thị preview (xem trước)
            let imgInput = document.getElementById("imgInput");
            let idImage = document.getElementById("idImage");
            imgInput.onchange = evt => {
                const [file] = imgInput.files
                if (file) {
                    idImage.src = URL.createObjectURL(file)
                }
            }
        </script>
        <!-- end content -->
    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<div class="right-bar">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-toggle float-right">
            <i class="mdi mdi-close"></i>
        </a>
        <h4 class="font-16 m-0 text-white">Theme Customizer</h4>
    </div>
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 254px;"><div class="slimscroll-menu" style="overflow: hidden; width: auto; height: 254px;">

        <div class="p-4">
            <div class="alert alert-warning" role="alert">
                <strong>Customize </strong> the overall color scheme, layout, etc.
            </div>
            <div class="mb-2">
                <img src="assets\images\layouts\light.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-3">
                <input type="checkbox" class="custom-control-input theme-choice" id="light-mode-switch" checked="">
                <label class="custom-control-label" for="light-mode-switch">Light Mode</label>
            </div>

            <div class="mb-2">
                <img src="assets\images\layouts\dark.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-3">
                <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsstyle="assets/css/bootstrap-dark.min.css" data-appstyle="assets/css/app-dark.min.css">
                <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
            </div>

            <div class="mb-2">
                <img src="assets\images\layouts\rtl.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-3">
                <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch" data-appstyle="assets/css/app-rtl.min.css">
                <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
            </div>

            <div class="mb-2">
                <img src="assets\images\layouts\dark-rtl.png" class="img-fluid img-thumbnail" alt="">
            </div>
            <div class="custom-control custom-switch mb-5">
                <input type="checkbox" class="custom-control-input theme-choice" id="dark-rtl-mode-switch" data-bsstyle="assets/css/bootstrap-dark.min.css" data-appstyle="assets/css/app-dark-rtl.min.css">
                <label class="custom-control-label" for="dark-rtl-mode-switch">Dark RTL Mode</label>
            </div>

            <a href="https://1.envato.market/eKY0g" class="btn btn-danger btn-block mt-3" target="_blank"><i class="mdi mdi-download mr-1"></i> Download Now</a>
        </div>
    </div><div class="slimScrollBar" style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 65.0363px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
    <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
</a>

<!-- Vendor js -->
<script src="/zircos-admin-dashboard/assets/js/vendor.min.js"></script>

<!-- App js -->
<script src="/zircos-admin-dashboard/assets/js/app.min.js"></script>



</body>
</html>