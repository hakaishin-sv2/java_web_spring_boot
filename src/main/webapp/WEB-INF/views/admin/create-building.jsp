<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/27/2024
  Time: 6:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
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
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Building-Edit
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12 ">
                    <form class="form-group" role="form" id="form_create_building">
                        <div class="container">
                            <!-- Tên tòa nhà -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="name">Tên tòa nhà</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="name" id="name" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Quận/Huyện -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="districtid">Quận/Huyện</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <select name="districtid" id="districtid" class="form-control">
                                                <option value="">---Chọn Quận---</option>
                                                <c:forEach var="entry" items="${listDistrict}">
                                                    <option value="${entry.key}">${entry.value}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Phường -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="ward">Phường</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="ward" id="ward" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Đường -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="street">Đường</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="street" id="street" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Kết cấu -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="structure">Kết cấu</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="structure" id="structure" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Số tầng hầm -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="numberofbasement">Số tầng hầm</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="number" name="numberofbasement" id="numberofbasement" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Diện tích sàn -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="floorarea">Diện tích sàn</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="number" name="floorarea" id="floorarea" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Hướng -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="direction">Hướng</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="direction" id="direction" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Hạng -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="level">Hạng</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="level" id="level" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Diện tích thuê -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="dt_thue">Diện tích thuê</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="dt_thue" id="dt_thue" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Giá thuê -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="rentprice">Giá thuê</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="rentprice" id="rentprice" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Mô tả giá -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="rentpricedescription">Mô tả giá</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="rentpricedescription" id="rentpricedescription" class="form-control" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Loại tòa nhà -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="typeCode">Loại tòa nhà</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="typeCode" id="noithat" value="NOI-THAT"> Nội thất
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="typeCode" id="nguyencan" value="NGUYEN-CAN"> Nguyên căn
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="typeCode" id="tangtret" value="TANG-TRET"> Tầng trệt
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Ghi chú -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <label for="ghichu">Ghi chú</label>
                                        </div>
                                        <div class="col-xs-9">
                                            <input type="text" name="ghichu" id="ghichu" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Nút bấm -->
                            <div class="row">
                                <div class="col-xs-12 text-left">
                                    <button type="submit" class="btn btn-success" id="create_building">
                                        <i class="fa fa-plus"></i> Thêm
                                    </button>
                                    <button type="button" class="btn btn-danger" onclick="document.getElementById('form_create_building').reset();">
                                        <i class="fa fa-times"></i> Hủy
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div>
<script>
    // Đẩy JSON về backend các trường cần lấy dữ liệu ô input phải đặt name và name trường với cột dữ liêu trong database để nó binđing vào không sẽ lỗi
    $(document).ready(function() {
        $("#create_building").click(function(event){
            event.preventDefault(); // Ngăn chặn hành vi mặc định của form khi nhấn nút

            var data = {};
            var typeCode = [];
            var formData = $("#form_create_building").serializeArray();

            formData.forEach(function(item) {
                if (item.name !== 'typeCode') { // Kiểm tra tên phần tử
                    data[item.name] = item.value; // Gán dữ liệu vào đối tượng data
                } else {
                    typeCode.push(item.value); // Thêm giá trị vào mảng typeCode nếu tên là 'typeCode'
                }
            });

            // Thêm mảng typeCode vào đối tượng data
            if (typeCode.length > 0) {
                data['typeCode'] = typeCode;
            }

            var jsonData = JSON.stringify(data); // Chuyển đối tượng data thành chuỗi JSON
            console.log("Data object:", data); // In ra đối tượng data
            console.log("JSON data:", jsonData); // In ra chuỗi JSON
            console.log("TypeCode array:", typeCode); // In ra mảng typeCode

            // Call API using AJAX
            $.ajax({
                url: '/api/building', // Thay thế bằng URL của API
                type: 'POST', // Hoặc 'POST' "GET" "DELETE"
                contentType: 'application/json',
                data: jsonData,
                dataType: 'JSON',  // định dạng từ phía back end gửi lên là json
                success: function(response) {
                    console.log("API response:", response); // Xử lý phản hồi từ API
                },
                error: function(xhr, status, error) {
                    console.error("API error:", status, error); // Xử lý lỗi từ API
                }
            });

            // Xóa nội dung form
            $("#form_create_building")[0].reset();
        });
    });
</script>
</body>
</html>
