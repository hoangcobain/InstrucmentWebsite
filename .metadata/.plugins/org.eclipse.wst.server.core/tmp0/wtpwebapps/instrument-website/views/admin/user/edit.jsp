<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="NewURL" value="/admin-user"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
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
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
						</c:if>
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Vai trò</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="roleCode" name="roleCode">
                                        <c:if test="${empty model.roleCode}">
                                            <option value="">Chọn vai trò</option>
                                            <c:forEach var="item" items="${roles}">
                                                <option value="${item.code}">${item.name}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty model.roleCode}">
                                            <option value="">Chọn vai trò</option>
                                            <c:forEach var="item" items="${roles}">
                                                <c:if test="${item.code == model.roleCode}">
                                                    <option value="${item.code}" selected="selected">${item.name}</option>>
                                                </c:if>"
                                                <c:if test="${item.code != model.roleCode}">
                                                    <option value="${item.code}">${item.name}</option>>
                                                </c:if>"
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <span id="error_roleCode" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên đăng nhập</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="userName" name="userName" value="${model.userName}"/>
                                    <span id="error_userName" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên đầy đủ</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${model.fullName}"/>
                                    <span id="error_fullName" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="password" name="password" value="${model.password}"/>
                                    <span id="error_password" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                             <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                                <div class="col-sm-9">                                 
                                    <div class="custom-switch custom-switch-label-onoff pl-0">
                                    <c:if test="${not empty model.id}">
                                    	<c:if test="${model.status == 1}">
                                    		<input class="custom-switch-input" type="checkbox" id="status" name="status" value="${model.status}" checked>
          									<label class="custom-switch-btn" for="status"></label>
                                    	</c:if>
                                    	<c:if test="${model.status == 0}">
                                    		<input class="custom-switch-input" type="checkbox" id="status" name="status" value="${model.status}">
          									<label class="custom-switch-btn" for="status"></label>
                                    	</c:if>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="hidden" value="1" id="status" name="status"/>
                                    </c:if>
        								
        							</div>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <c:if test="${not empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật tài khoản" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm tài khoản" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                </div>
                            </div>
                            <input type="hidden" value="${model.id}" id="id" name="id"/>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$("#btnAddOrUpdateNew").click(function(e) {
		$.confirm({
		    title: 'Thông báo',
		    content: 'Bạn có đồng ý thực hiện?', 
		    buttons: {
		        confirm: function () {
		        	 e.preventDefault();
		             var data = {};
		             var formData = $('#formSubmit').serializeArray();
		             formData.forEach(function(v,index) { 
		                 data[""+v.name+""] = v.value;
		             })
		             var id = $('#id').val();
		             if(id == "") {
                        if(addRegex() == false) {
                            $.alert('Thêm thất bại');
                        } else {                       
		                 addUser(data);
		                 $.alert('Thêm thành công!');
		                 resetValue();
                        }
		             } else {
                        if(addRegex() == false) {
                            $.alert('Cập nhật thất bại');
                         } else {
                        	updateUser(data);                  	
		                 	$.alert('Cập nhật thành công!');
                         }
		             } 
		        },
		        cancel: function () {
		        	
		        },
		    }
		});
       
    })
    function addUser(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }

        function updateUser(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }

        $("#status").click(function(e) {
            if($("#status").is(':checked')) {
                $("#status").val(1);
            } else if($("#status").not(':checked') ) {
                $("#status").val(0);
            }
        })
               
        function resetValue() {
        	 $("#roleCode").prop("selectedIndex", 0); 
        	 $("#userName").val("");
             $("#password").val("");
             $("#fullName").val("");
        }

        function kiemTraVaiTro(){
                    var roleCode = $("#roleCode").val();
                    if(roleCode == ""){
                        $("#error_roleCode").html('Phải chọn vai trò')
                        return false
                    }
                    $("#error_roleCode").html('*')
                    return true
                }

                $("#roleCode").blur(kiemTraVaiTro);

        function kiemTraTenDangNhap(){
                var userName = $("#userName").val();
                if(userName.trim() == ""){
                    $("#error_userName").html("Phải nhập tên đăng nhập");
                    return false;
                }
                $("#error_userName").html("*");
                return true;
            }
        $("#userName").blur(kiemTraTenDangNhap);

        function kiemTraTenDayDu(){
                var fullName = $("#fullName").val();
                let regex = /^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)*$/
                if(fullName.trim() == ""){
                    $("#error_fullName").html("Phải nhập tên");
                    return false;
                }
                if(!regex.test(fullName)) {
                    $("#error_fullName").html("Họ tên đầy đủ và chữ cái đầu viết hoa");
                    return false;
                }
                $("#error_fullName").html("*");
                return true;
            }
        $("#fullName").blur(kiemTraTenDayDu);

        function kiemTraMatKhau(){
                var password = $("#password").val();
                if(password.trim() == ""){
                    $("#error_password").html("Phải nhập mật khẩu");
                    return false;
                }
                $("#error_password").html("*");
                return true;
            }
        $("#password").blur(kiemTraMatKhau);

        function addRegex() {
            if(!kiemTraVaiTro())
                return false;
            if(!kiemTraTenDangNhap())
                return false;
            if(!kiemTraTenDayDu())
                return false;
            if(!kiemTraMatKhau())
                return false;
        }

</script> 
</body>
</html>