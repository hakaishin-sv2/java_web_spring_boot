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
                            <!-- Phân Trang -->
                            <div class="dataTables_paginate col-sm-6 infoBar align-left">
                                <div class="infos">
                                    <span>${totalItems} items found, displaying ${(currentPage - 1) * pageSize + 1} to ${((currentPage - 1) * pageSize) + buildingList.size()}</span>
                                </div>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="/admin/building-list?page=${currentPage - 1}&size=${pageSize}">&laquo;</a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                                            <li class="page-item <c:if test="${i == currentPage}">active</c:if>">
                                                <a class="page-link" href="/admin/building-list?page=${i}&size=${pageSize}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="/admin/building-list?page=${currentPage + 1}&size=${pageSize}">&raquo;</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
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
                    <tbody id="tbody_staff">
                    <tr>
                        <td class="center">
                            <input type="checkbox" class="ace"  value="1">
                            <span class="lbl"></span>
                        </td>
                        <td class="center">Minh Anh</td>
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

<script>

    // CALL API ĐỔ DỮ LIỆU
    function fetchStaff(buildingId) {
        $.ajax({
            url: '/api/building/' + buildingId + '/staffs',
            type: 'GET',
           // dataType: 'json',
            success: function(response) {
                console.log("Response:", response);
                var staffList = response.data;
                var tbody = $("#tbody_staff");
                tbody.empty(); // Xóa dữ liệu cũ
                staffList.forEach(function(staff) {
                    var checked = staff.checked ? "checked" : "";
                    var row = '<tr>' +
                        '<td class="center"><input type="checkbox" class="ace" value="' + staff.staffId + '" ' + checked + '><span class="lbl"></span></td>' +
                        '<td class="center">' + staff.fullName + '</td>' +
                        '</tr>';
                    tbody.append(row);
                });
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi lấy danh sách nhân viên!");
            }
        });
    }


    function giaotoanha(buildingid) {
        $('#myModal').modal('show');
        $('#modal_buildingid').val(buildingid);// set value cho thẻ hidden trong table đó
        fetchStaff(buildingid);
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

            var staffIDs = JSON.stringify(selectedValues);
            //console.log("Data object:", data); // In đối tượng data ra console
            console.log("JSON data:", staffIDs);
            $.ajax({
                url: '/api/building/'+buildingId+"/assignmentbuilding",
                type: 'POST',
                contentType: 'application/json',
                // dataType: 'json',
                data: staffIDs,
                success: function(response) {
                    console.log('Success:', response);
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
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
        console.log(idsJson);
        $.ajax({
            url: '/api/building/' + data,
            type: 'Delete',
            contentType: 'application/json',
            data: idsJson,
            success: function (response) {
                console.log("Response:", response);
                //alert("Xóa thành công!");
                // Xóa mảng ids sau khi xóa thành công
                ids = [];
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Vui lòng tích chọn các tòa nh bạn muốn xóa");
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
    // END  API XÓA

</script>
</body>
</html>
