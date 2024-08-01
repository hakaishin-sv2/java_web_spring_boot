<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/27/2024
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách toàn nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>

                <li>
                    <a href="#">Tables</a>
                </li>
                <li class="active">Simple &amp; Dynamic</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
                <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                    <i class="ace-icon fa fa-cog bigger-130"></i>
                </div>

                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                            <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                            <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                            <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                            <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
                            <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
                            <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
                            <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="page-header">
                <h1>
                    Buildings
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Danh sách tòa nhà
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- form tìm kiếm -->
                    <div class="row">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">
                                    <div class="widget-menu">

                                    </div>
                                    <!-- Ccacs nút ẩn hiện -->
                                    <a href="#" data-action="fullscreen" class="orange2">
                                        <i class="ace-icon fa fa-expand"></i>
                                    </a>

                                    <a href="#" data-action="reload">
                                        <i class="ace-icon fa fa-refresh"></i>
                                    </a>

                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>

                                    <a href="#" data-action="close">
                                        <i class="ace-icon fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- Form Tìm Kiếm -->
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <form:form modelAttribute="buildingSearchRequest" action="building-list" id="filter_building" method="GET">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-xs-6">
                                                            <label for="name">Tên tòa nhà</label>
                                                            <input type="text" name="name" id="name" class="form-control" value="${buildingSearchRequest.name}">
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="floorarea">Diện tích sàn</label>
                                                            <input type="text" name="floorArea" id="floorArea" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-2">
                                                            <label for="districtid">Quận Hiện Có</label>
                                                            <select name="districtid" id="districtid" class="form-control">
                                                                <option value="">---Chọn Quận---</option>
                                                                <c:forEach var="entry" items="${listDistrict}">
                                                                    <option value="${entry.key}">${entry.value}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="ward">Phường</label>
                                                            <input type="text" name="ward" id="ward" class="form-control">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="street">Đường</label>
                                                            <input type="text" name="street" id="street" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-4 ">
                                                            <label for="">Số Tầng Hầm</label>
                                                            <input type="text" name="numberofbasement" id="numberofbasement" class="form-control">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="direction">Hướng </label>
                                                            <input type="text" name="direction" id="direction" class="form-control">
                                                        </div>
                                                        <div class="col-xs-4 ">
                                                            <label for="">Hạng</label>
                                                            <input type="text" name="level" id="lavel" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3 ">
                                                            <label for="">Diện Tích Từ</label>
                                                            <input type="text" name="areaFrom" id="areaFrom" class="form-control">
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label for="">Diện Tích Đến </label>
                                                            <input type="text" name="areaTo" id="areaTo" class="form-control">
                                                        </div>
                                                        <div class="col-xs-3 ">
                                                            <label for="">Giá Thuê Từ</label>
                                                            <input type="text" name="rentPriceFrom" id="rentPriceFrom" class="form-control">
                                                        </div>
                                                        <div class="col-xs-3 ">
                                                            <label for="">Giá Thuê Đến</label>
                                                            <input type="text" name="rentPriceTo" id="rentPriceTo" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-4 ">
                                                            <label for="">Tên Quản Lý</label>
                                                            <input type="text" name="managername" id="managername" class="form-control" value="${buildingSearchRequest.managerName}">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="">Số Điện Thoại Quản lÝ </label>
                                                            <input type="text" name="managerPhone" id="managerPhone" class="form-control">
                                                        </div>

                                                        <div class="col-xs-4">
                                                            <label for="staffId">Chọn Nhân Viên Phụ Trách</label>
                                                            <select id="staffId" name="staffId">
                                                                <option value="">---Chọn nhân viên---</option>
                                                                <c:forEach var="entry" items="${listSTAFF}">
                                                                    <option value="${entry.key}">${entry.value}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-6 ">
                                                            <c:forEach var="entry" items="${listRentype}">
                                                                <label for="" class="checkbox-inline">
                                                                    <input type="checkbox" name="typeCode" id="${entry.key}" value="${entry.key}" class="">${entry.value}
                                                                </label>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-6 ">
                                                            <button class="btn-info" type="submit" id="btnSearchBuilding"><i class="ace-icon fa fa-search nav-search-icon"></i>Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end form tìm kiếm -->
                            <div class="pull-right">
                                <a href="building-create">
                                    <button class="btn-success" data-toggle="tooltip-info" title="Thêm tòa nhà">

                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0" />
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                        </svg>
                                    </button>
                                </a>
                                <button class="btn-danger" data-toggle="tooltip-info" title="Xóa nhiều toàn nhà" id="btn_xoa_nhieu">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1" />
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z" />
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                    </svg>
                                </button>
                            </div>

                            <!-- End form tìm kiếm -->
                            <!-- Dang sách Tòa nha -->

                            <!-- End danh sách tòa nhà -->
                        </div>

                    </div>
                    <!-- form tìm kiếm-->
                    <div class="hr hr-18 dotted hr-double"></div>

                    <!-- Danh sách tòa nhà -->
                    <div class="hr hr-18 dotted hr-double"></div>

                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue">Danh sách tòa nhà</h3>

                            <div class="clearfix">
                                <div class="pull-right tableTools-container"></div>
                            </div>
                            <div class="table-header">
                                Results
                            </div>

                            <!-- div.table-responsive -->

                            <!-- div.dataTables_borderWrap -->
                            <div>
                                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th>Tên tòa nhà</th>
                                        <th>Địa chỉ</th>
                                        <th>Số tầng hầm</th>
                                        <th>Tên người quản lý</th>
                                        <th>SĐT</th>
                                        <th>DT sàn</th>
                                        <th>DT trống</th>
                                        <th>DT thuê</th>
                                        <th>Giá thuê</th>
                                        <th>Phí dịch vụ</th>
                                        <th>Phí môi giới</th>
                                        <th class="hidden-480">Thao tác</th>

                                        <th></th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="building" items="${buildingList}">
                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" value="${building.id}" />
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>
                                            <td>
                                                <a href="#">${building.name}</a>
                                            </td>
                                            <td>${building.address}</td>
                                            <td>${building.numberOfBasement}</td>
                                            <td>${building.managerName}</td>
                                            <td>${building.managerPhone}</td>
                                            <td>${building.floorArea}</td>
                                            <td>100m</td>
                                            <td>${building.rentArea}</td>
                                            <td>${building.rentPrice}</td>
                                            <td>1trieu</td>
                                            <td>300k</td>
                                            <td class="hidden-480">
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="giaotoanha(${building.id})">
                                                        <i class="ace-icon fa fa-check bigger-120"></i>
                                                    </button>
                                                    <a href="building-edit-${building.id}" class="btn btn-xs btn-info" title="Chỉnh sửa">
<%--                                                        <c:url value='building-edit/${building.id}' />--%>
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                    <button class="btn btn-xs btn-danger" title="Xóa" class="delete_one" onclick="addId(${building.id})">
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div>
<div class="modal" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Danh sách nhan viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="table_staff" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center"> Chọn</th>
                        <th>Tên Nhân Viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="center">
                            <input type="checkbox" class="ace" id="id_nhanvien_1" value="1">
                            <span class="lbl"></span>
                        </td>
                        <td class="center">Minh Anh</td>
                    </tr>
                    <tr>
                        <td class="center">
                            <input type="checkbox" class="ace" id="id_nhanvien_2" value="2">
                            <span class="lbl"></span>
                        </td>
                        <td class="center">Trần Linh</td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="buildingid" id="modal_buildingid" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn_giaotaonha">Giao tào nhà</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery.2.1.1.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="assets/js/dataTables.tableTools.min.js"></script>
<script src="assets/js/dataTables.colVis.min.js"></script>


<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
        //initiate dataTables plugin
        var oTable1 =
            $('#dynamic-table')
                //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                .dataTable({
                    bAutoWidth: false,
                    "aoColumns": [{
                        "bSortable": false
                    }, // Cột 1
                        null, // Cột 2
                        null, // Cột 3
                        null, // Cột 4
                        null, // Cột 5
                        null, // Cột 6
                        null, // Cột 7
                        null, // Cột 8
                        null, // Cột 9
                        null, // Cột 10
                        null, // Cột 11
                        null, // Cột 12

                        {
                            "bSortable": false
                        } // Cột 15
                    ],
                    "aaSorting": [],


                    //,
                    //"sScrollY": "200px",
                    //"bPaginate": false,

                    //"sScrollX": "100%",
                    //"sScrollXInner": "120%",
                    //"bScrollCollapse": true,
                    //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
                    //you may want to wrap the table inside a "div.dataTables_borderWrap" element

                    //"iDisplayLength": 50
                });
        //oTable1.fnAdjustColumnSizing();


        //TableTools settings
        TableTools.classes.container = "btn-group btn-overlap";
        TableTools.classes.print = {
            "body": "DTTT_Print",
            "info": "tableTools-alert gritter-item-wrapper gritter-info gritter-center white",
            "message": "tableTools-print-navbar"
        }

        //initiate TableTools extension
        var tableTools_obj = new $.fn.dataTable.TableTools(oTable1, {
            "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf",

            "sRowSelector": "td:not(:last-child)",
            "sRowSelect": "multi",
            "fnRowSelected": function(row) {
                //check checkbox when row is selected
                try {
                    $(row).find('input[type=checkbox]').get(0).checked = true
                } catch (e) {}
            },
            "fnRowDeselected": function(row) {
                //uncheck checkbox
                try {
                    $(row).find('input[type=checkbox]').get(0).checked = false
                } catch (e) {}
            },

            "sSelectedClass": "success",
            "aButtons": [{
                "sExtends": "copy",
                "sToolTip": "Copy to clipboard",
                "sButtonClass": "btn btn-white btn-primary btn-bold",
                "sButtonText": "<i class='fa fa-copy bigger-110 pink'></i>",
                "fnComplete": function() {
                    this.fnInfo('<h3 class="no-margin-top smaller">Table copied</h3>\
									<p>Copied ' + (oTable1.fnSettings().fnRecordsTotal()) + ' row(s) to the clipboard.</p>',
                        1500
                    );
                }
            },

                {
                    "sExtends": "csv",
                    "sToolTip": "Export to CSV",
                    "sButtonClass": "btn btn-white btn-primary  btn-bold",
                    "sButtonText": "<i class='fa fa-file-excel-o bigger-110 green'></i>"
                },

                {
                    "sExtends": "pdf",
                    "sToolTip": "Export to PDF",
                    "sButtonClass": "btn btn-white btn-primary  btn-bold",
                    "sButtonText": "<i class='fa fa-file-pdf-o bigger-110 red'></i>"
                },

                {
                    "sExtends": "print",
                    "sToolTip": "Print view",
                    "sButtonClass": "btn btn-white btn-primary  btn-bold",
                    "sButtonText": "<i class='fa fa-print bigger-110 grey'></i>",

                    "sMessage": "<div class='navbar navbar-default'><div class='navbar-header pull-left'><a class='navbar-brand' href='#'><small>Optional Navbar &amp; Text</small></a></div></div>",

                    "sInfo": "<h3 class='no-margin-top'>in danh sách</h3>\
									  <p>Please use your browser's print function to\
									  print this table.\
									  <br />Press <b>escape</b> when finished.</p>",
                }
            ]
        });
        //we put a container before our table and append TableTools element to it
        $(tableTools_obj.fnContainer()).appendTo($('.tableTools-container'));

        //also add tooltips to table tools buttons
        //addding tooltips directly to "A" buttons results in buttons disappearing (weired! don't know why!)
        //so we add tooltips to the "DIV" child after it becomes inserted
        //flash objects inside table tools buttons are inserted with some delay (100ms) (for some reason)
        setTimeout(function() {
            $(tableTools_obj.fnContainer()).find('a.DTTT_button').each(function() {
                var div = $(this).find('> div');
                if (div.length > 0) div.tooltip({
                    container: 'body'
                });
                else $(this).tooltip({
                    container: 'body'
                });
            });
        }, 200);



        //ColVis extension
        var colvis = new $.fn.dataTable.ColVis(oTable1, {
            "buttonText": "<i class='fa fa-search'></i>",
            "aiExclude": [0, 6],
            "bShowAll": true,
            //"bRestore": true,
            "sAlign": "right",
            "fnLabel": function(i, title, th) {
                return $(th).text(); //remove icons, etc
            }

        });
        //style it
        $(colvis.button()).addClass('btn-group').find('button').addClass('btn btn-white btn-info btn-bold')

        //and append it to our table tools btn-group, also add tooltip
        $(colvis.button())
            .prependTo('.tableTools-container .btn-group')
            .attr('title', 'Show/hide columns').tooltip({
            container: 'body'
        });

        //and make the list, buttons and checkboxed Ace-like
        $(colvis.dom.collection)
            .addClass('dropdown-menu dropdown-light dropdown-caret dropdown-caret-right')
            .find('li').wrapInner('<a href="javascript:void(0)" />') //'A' tag is required for better styling
            .find('input[type=checkbox]').addClass('ace').next().addClass('lbl padding-8');



        /////////////////////////////////
        //table checkboxes
        $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

        //select/deselect all rows according to table header checkbox
        $('#dynamic-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function() {
            var th_checked = this.checked; //checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function() {
                var row = this;
                if (th_checked) tableTools_obj.fnSelect(row);
                else tableTools_obj.fnDeselect(row);
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#dynamic-table').on('click', 'td input[type=checkbox]', function() {
            var row = $(this).closest('tr').get(0);
            if (!this.checked) tableTools_obj.fnSelect(row);
            else tableTools_obj.fnDeselect($(this).closest('tr').get(0));
        });




        $(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
            e.stopImmediatePropagation();
            e.stopPropagation();
            e.preventDefault();
        });


        //And for the first simple table, which doesn't have TableTools or dataTables
        //select/deselect all rows according to table header checkbox
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function() {
            var th_checked = this.checked; //checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function() {
                var row = this;
                if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#simple-table').on('click', 'td input[type=checkbox]', function() {
            var $row = $(this).closest('tr');
            if (this.checked) $row.addClass(active_class);
            else $row.removeClass(active_class);
        });

        // xÓA NHIỀU TÒA NHÀ
        $(document).ready(function() {
            $("#btn_xoa_nhieu").click(function(event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định của nút

                var selectedIds = [];

                // Duyệt qua tất cả các checkbox và kiểm tra xem chúng có được chọn không
                $("#dynamic-table input[type='checkbox']:checked").each(function() {
                    selectedIds.push($(this).val()); // Lấy giá trị của checkbox được chọn
                });

                // Chuyển đổi mảng selectedIds thành chuỗi JSON
                var ids = JSON.stringify(selectedIds);

                console.log("Selected IDs:", selectedIds); // In ra các ID đã chọn
                console.log("JSON data:", ids); // In ra chuỗi JSON

                // Gửi yêu cầu AJAX tới API
                $.ajax({
                    url: '/api/admin/buildings', // Thay đổi URL này cho phù hợp với API của bạn
                    type: 'DELETE',
                    contentType: 'application/json',
                    data: ids,
                    success: function(response) {
                        console.log("Response:", response); // Xử lý phản hồi từ máy chủ
                        alert("Xóa thành công!"); // Thông báo thành công
                        // Bạn có thể thêm logic để cập nhật giao diện người dùng sau khi xóa thành công
                    },
                    error: function(xhr, status, error) {
                        console.error("Error:", error); // Xử lý lỗi nếu có
                        alert("Có lỗi xảy ra khi xóa tòa nhà!");
                    }
                });
            });
        });


        /********************************/
        //add tooltip for small view action buttons in dropdown menu
        $('[data-rel="tooltip"]').tooltip({
            placement: tooltip_placement
        });

        //tooltip placement on right or left
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            //var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }

    })
</script>
<script>
    // show giao tòa nhà với id tương ứng khi đổ dữ liệu ra
    function giaotoanha(buildingid) {
        $('#myModal').modal('show');
        // set giá trị
        $('#modal_buildingid').val(buildingid);
    }

    $(document).ready(function() {
        $("#btn_giaotaonha").click(function(event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của nút

            var selectedValues = [];
            var buildingId = $("input[id='modal_buildingid']").val(); // Lấy giá trị của thẻ input hidden

            // Duyệt qua tất cả các checkbox để lấy giá trị của những checkbox được chọn
            $("#table_staff input[type='checkbox']:checked").each(function() {
                selectedValues.push($(this).val());
            });

            var data = {
                buildingId: buildingId,
                selectedValues: selectedValues
            };

            var jsonData = JSON.stringify(data); // Chuyển đổi đối tượng thành chuỗi JSON

            console.log("Data object:", data); // In đối tượng data ra console
            console.log("JSON data:", jsonData); // In chuỗi JSON ra console

            // Thực hiện gọi AJAX tại đây nếu cần
            // $.ajax({
            //     url: '/api/building/',
            //     type: 'POST',
            //     contentType: 'application/json',
            //     dataType: 'json',
            //     data: jsonData,
            //     success: function(response) {
            //         console.log('Success:', response);
            //     },
            //     error: function(error) {
            //         console.log('Error:', error);
            //     }
            // });
        });
    });

    $("#btnSearchBuilding").click(function(event){
        // event.preventDefault();
        var formData = $("#filter_building").serializeArray();

    });
    // xÓA 1 và NHIỀU TÒA NHÀ
    // xử lý luôn nếu xóa 1 sẽ thê vào list ids kia là 1 phần tu
    function addId(id) {
        addData_Ajax(id);
    }

    function addData_Ajax(data) {
        var idsJson = data;
        //JSON.stringify(data);
        console.log(idsJson);
        $.ajax({
            url: '/api/building/'+data,
            type: 'Delete',
            contentType: 'application/json',
            data: idsJson,
            success: function(response) {
                console.log("Response:", response); // Xử lý phản hồi từ máy chủ
                alert("Xóa thành công!");
                // Xóa mảng ids sau khi xóa thành công
                ids = [];
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi xóa tòa nhà!");
            }
        });
    }
    $("#btn_xoa_nhieu").click(function(event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của nút

        var selectedIds = [];
        $("#dynamic-table input[type='checkbox']:checked").each(function() {
            selectedIds.push($(this).val()); // Lấy giá trị của checkbox được chọn
        });

        // Chuyển đổi mảng selectedIds thành chuỗi JSON
        addData_Ajax(selectedIds);

    });

</script>
</body>
</html>
