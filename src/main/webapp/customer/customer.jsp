<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Datatable | Zircos - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="//layout/assets/images/favicon.ico">

    <!-- Table datatable css -->
    <link href="/layout/assets/libs/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="/layout/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="/layout/assets/libs/datatables/buttons.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="/layout/assets/libs/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="/layout/assets/libs/datatables/scroller.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="/layout/assets/libs/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css">
    <link href="/layout/assets/libs/datatables/fixedColumns.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <!-- App css -->
    <link href="/layout/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"
          id="bootstrap-stylesheet">
    <link href="/layout/assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link href="/layout/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">

    <link href="/layout/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css">
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
                        <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <img src="/layout/assets/images/flags/us.jpg" alt="user-image" class="mr-2"
                                 height="12"> <span class="align-middle">English <i
                                class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="/layout/assets/images/flags/germany.jpg" alt="user-image"
                                     class="mr-2" height="12"> <span class="align-middle">German</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="/layout/assets/images/flags/italy.jpg" alt="user-image"
                                     class="mr-2" height="12"> <span class="align-middle">Italian</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="/layout/assets/images/flags/spain.jpg" alt="user-image"
                                     class="mr-2" height="12"> <span class="align-middle">Spanish</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <img src="/layout/assets/images/flags/russia.jpg" alt="user-image"
                                     class="mr-2" height="12"> <span class="align-middle">Russian</span>
                            </a>
                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#"
                           role="button" aria-haspopup="false" aria-expanded="false">
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

                            <div class="slimScrollDiv"
                                 style="position: relative; overflow: hidden; width: auto; height: 422.938px;">
                                <div class="slimscroll noti-scroll"
                                     style="overflow: hidden; width: auto; height: 422.938px;">

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
                                </div>
                                <div class="slimScrollBar"
                                     style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
                                <div class="slimScrollRail"
                                     style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                            </div>

                            <!-- All-->
                            <a href="javascript:void(0);"
                               class="dropdown-item text-center text-primary notify-item notify-all">
                                See all Notification
                                <i class="fi-arrow-right"></i>
                            </a>

                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#"
                           role="button" aria-haspopup="false" aria-expanded="false">
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

                            <div class="slimScrollDiv"
                                 style="position: relative; overflow: hidden; width: auto; height: 422.938px;">
                                <div class="slimscroll noti-scroll"
                                     style="overflow: hidden; width: auto; height: 422.938px;">

                                    <div class="inbox-widget">
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img
                                                        src="/layout/assets/images\users\avatar-1.jpg"
                                                        class="rounded-circle" alt=""></div>
                                                <p class="inbox-item-author">Chadengle</p>
                                                <p class="inbox-item-text text-truncate">Hey! there I'm available...</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img
                                                        src="/layout/assets/images\users\avatar-2.jpg"
                                                        class="rounded-circle" alt=""></div>
                                                <p class="inbox-item-author">Tomaslau</p>
                                                <p class="inbox-item-text text-truncate">I've finished it! See you
                                                    so...</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img
                                                        src="/layout/assets/images\users\avatar-3.jpg"
                                                        class="rounded-circle" alt=""></div>
                                                <p class="inbox-item-author">Stillnotdavid</p>
                                                <p class="inbox-item-text text-truncate">This theme is awesome!</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img
                                                        src="/layout/assets/images\users\avatar-4.jpg"
                                                        class="rounded-circle" alt=""></div>
                                                <p class="inbox-item-author">Kurafire</p>
                                                <p class="inbox-item-text text-truncate">Nice to meet you</p>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img
                                                        src="/layout/assets/images\users\avatar-5.jpg"
                                                        class="rounded-circle" alt=""></div>
                                                <p class="inbox-item-author">Shahedk</p>
                                                <p class="inbox-item-text text-truncate">Hey! there I'm available...</p>

                                            </div>
                                        </a>
                                    </div> <!-- end inbox-widget -->

                                </div>
                                <div class="slimScrollBar"
                                     style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
                                <div class="slimScrollRail"
                                     style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                            </div>

                            <!-- All-->
                            <a href="javascript:void(0);"
                               class="dropdown-item text-center text-primary notify-item notify-all">
                                See all Messages
                                <i class="fi-arrow-right"></i>
                            </a>


                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light"
                           data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="/layout/assets/images\users\avatar-1.jpg" alt="user-image" class="rounded-circle">
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
                                        <img src="/layout1/assets1/img/logo/logo.png" alt="" height="30">
                                        <!-- <span class="logo-lg-text-light">Zircos</span> -->
                                    </span>
                        <span class="logo-sm">
                                        <!-- <span class="logo-sm-text-dark">Z</span> -->
                                        <img src="/layout/assets/images\logo-sm.png" alt="" height="22">
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
                            <a href=/index.jsp> <i class="mdi mdi-view-dashboard"></i>Home</a>
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

                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive ">
                            <div><h1 class="header-title">List of Customer</h1>
                                <div class="col-sm-12 col-md-6">
                                    <a href="/customers?action=create">
                                        <button class="btn btn-primary" style="justify-content: space-between">Create
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <div>
                                <div class=" col-md-12 col-sm-6" style="justify-content: flex-end">
                                    <form method="get" action="/customers" class="search-form">
                                        <input type="text" name="kw" class="mr-1" value="${requestScope.kw}">
                                        <button class="btn btn-primary" style="justify-content: space-between">Search</button>
                                    </form>
                                </div>
                            </div>
                            <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                    </div>
                                </div>
                                <div class="row">
                                    <c:if test="${requestScope.message == 'delete'}">
                                        <script>
                                            window.onload = () => {
                                                Swal.fire(
                                                    'Deleted!',
                                                    'Your file has been deleted.',
                                                    'success'
                                                )
                                            }
                                        </script>
                                    </c:if>
                                    <c:if test="${requestScope.message == 'edit'}">
                                        <script>
                                            window.onload = () => {
                                                Swal.fire(
                                                    'Edit!',
                                                    'Thông tin không hợp lệ.',
                                                    'success'
                                                )
                                            }
                                        </script>
                                    </c:if>
                                    <div class="col-sm-12">
                                        <table class="table table-striped m-0">
                                            <thead style="text-align: center">
                                            <tr role="row">
                                                <th  tabindex="0" aria-controls="datatable"
                                                     rowspan="1" colspan="1" style="width: 10px;" >#
                                                </th>
                                                <th  tabindex="0" aria-controls="datatable"
                                                    rowspan="1" colspan="1" style="width: 181px;" >Name
                                                </th>
                                                <th  tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" style="width: 269px;"
                                                    aria-label="Position: activate to sort column ascending">Date of
                                                    birth
                                                </th>
                                                <th  tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" style="width: 130px;"
                                                    aria-label="Office: activate to sort column ascending">Address
                                                </th>
                                                <th  tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" style="width: 58px;"
                                                    aria-label="Age: activate to sort column ascending">Image
                                                </th>
                                                <th  tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" style="width: 121px;"
                                                    aria-label="Start date: activate to sort column ascending">Customer
                                                    Type
                                                </th>
                                                <th tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" style="width: 100px;"
                                                    aria-label="Salary: activate to sort column ascending">Action
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody style="text-align: center">
                                            <c:forEach var="c" items="${requestScope.customer}">
                                                <tr role="row" class="odd">
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 10px;">${c.getId()}</td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;">${c.getName()}</td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;"><fmt:formatDate pattern="dd-MM-yyyy"
                                                                        value="${c.getCreateAt()}"/></td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;">${c.getAddress()}</td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;">
                                                        <img src="/images/${c.getImage()}"
                                                             style="width: 100px; height: auto">
                                                    </td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;">
                                                        <c:forEach var="cType" items="${requestScope.customerTypes}">
                                                            <c:if test="${cType.getId()==c.getIdType()}">
                                                                ${cType.getName()}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td tabindex="0" aria-controls="datatable"
                                                        rowspan="1" colspan="1" style="width: 181px;">
                                                        <a href="/customers?action=edit&id=${c.getId()}"><i
                                                                class=" fas fa-edit"></i></a>
                                                        <a onclick="handleDeleteClick(${c.getId()})"><i
                                                                class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <form id="frmDelete" method="post" action="/customers?action=delete">
                                            <input type="hidden" name="idDelete" value="" id="idDelete">
                                        </form>
                                    </div>
                                    <div class="row justify-content-end">
                                        <ul class="pagination pagination-split float-right mb-0">
                                            <c:if test="${currentPage != 1}">
                                                <li class="page-item">
                                                    <a href="/customers?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${currentPage-1}" class="page-link"><i class="fa fa-angle-left"></i></a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="page-item active">
                                                            <a href="/customers?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${i}" class="page-link">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a href="/customers?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${i}" class="page-link">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${currentPage lt noOfPages}">
                                                <li class="page-item">
                                                    <a href="/customers?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${currentPage+1}" class="page-link"><i class="fa fa-angle-right"></i></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <script>
                                function handleDeleteClick(idCustomer) {
                                    document.getElementById("idDelete").value = idCustomer;
                                    /**
                                     Swal.fire({
                                        title: 'Are you sure?',
                                        // text: "You won't be able to revert this!",
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Yes, delete it!'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            document.getElementById("frmDelete").submit();
                                            // Swal.fire(
                                            //     'Deleted!',
                                            //     'Your file has been deleted.',
                                            //     'success'
                                            // )
                                        }
                                    })
                                     **/
                                    Swal.fire({
                                        title: "Are you sure?",
                                        text: "You won't be able to revert this!",
                                        type: "warning",
                                        showCancelButton: !0,
                                        confirmButtonColor: "#348cd4",
                                        cancelButtonColor: "#6c757d",
                                        confirmButtonText: "Yes, delete it!"
                                    }).then(function (result) {
                                        if (result.value) {
                                            document.getElementById("frmDelete").submit();
                                        }
                                    })
                                    return false;
                                }
                            </script>


                        </div>
                    </div>
                </div>
            </div>

            <!-- end row -->

        </div>
        <!-- end container-fluid -->

    </div>
    <!-- end content -->

    <!-- Footer Start -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    2018 - 2020 © Zircos theme by <a href="">Coderthemes</a>
                </div>
            </div>
        </div>
    </footer>
    <!-- end Footer -->

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
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 368px;">
        <div class="slimscroll-menu" style="overflow: hidden; width: auto; height: 368px;">

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
                    <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch"
                           data-bsstyle="assets/css/bootstrap-dark.min.css" data-appstyle="assets/css/app-dark.min.css">
                    <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
                </div>

                <div class="mb-2">
                    <img src="assets\images\layouts\rtl.png" class="img-fluid img-thumbnail" alt="">
                </div>
                <div class="custom-control custom-switch mb-3">
                    <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch"
                           data-appstyle="assets/css/app-rtl.min.css">
                    <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
                </div>

                <div class="mb-2">
                    <img src="assets\images\layouts\dark-rtl.png" class="img-fluid img-thumbnail" alt="">
                </div>
                <div class="custom-control custom-switch mb-5">
                    <input type="checkbox" class="custom-control-input theme-choice" id="dark-rtl-mode-switch"
                           data-bsstyle="assets/css/bootstrap-dark.min.css"
                           data-appstyle="assets/css/app-dark-rtl.min.css">
                    <label class="custom-control-label" for="dark-rtl-mode-switch">Dark RTL Mode</label>
                </div>

                <a href="https://1.envato.market/eKY0g" class="btn btn-danger btn-block mt-3" target="_blank"><i
                        class="mdi mdi-download mr-1"></i> Download Now</a>
            </div>
        </div>
        <div class="slimScrollBar"
             style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 136.516px;"></div>
        <div class="slimScrollRail"
             style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
    <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
</a>

<!-- Vendor js -->
<script src="/layout/assets/js/vendor.min.js"></script>

<!-- Datatable plugin js -->
<script src="/layout/assets/libs/datatables/jquery.dataTables.min.js"></script>
<script src="/layout/assets/libs/datatables/dataTables.bootstrap4.min.js"></script>

<script src="/layout/assets/libs/datatables/dataTables.responsive.min.js"></script>
<script src="/layout/assets/libs/datatables/responsive.bootstrap4.min.js"></script>

<script src="/layout/assets/libs/datatables/dataTables.buttons.min.js"></script>
<script src="/layout/assets/libs/datatables/buttons.bootstrap4.min.js"></script>

<script src="/layout/assets/libs/datatables/buttons.html5.min.js"></script>
<script src="/layout/assets/libs/datatables/buttons.print.min.js"></script>

<script src="/layout/assets/libs/datatables/dataTables.keyTable.min.js"></script>
<script src="/layout/assets/libs/datatables/dataTables.fixedHeader.min.js"></script>
<script src="/layout/assets/libs/datatables/dataTables.scroller.min.js"></script>
<script src="/layout/assets/libs/datatables/dataTables.fixedColumns.min.js"></script>

<script src="/layout/assets/libs/jszip/jszip.min.js"></script>
<script src="/layout/assets/libs/pdfmake/pdfmake.min.js"></script>
<script src="/layout/assets/libs/pdfmake/vfs_fonts.js"></script>

<!-- Datatables init -->
<%--<script src="/layout/assets/js/pages/datatables.init.js"></script>--%>

<!-- App js -->
<script src="/layout/assets/js/app.min.js"></script>


<script src="/layout/assets/libs/sweetalert2/sweetalert2.min.js"></script>

<script src="/layout/assets/js/pages/sweetalerts.init.js"></script>

</body>
</html>