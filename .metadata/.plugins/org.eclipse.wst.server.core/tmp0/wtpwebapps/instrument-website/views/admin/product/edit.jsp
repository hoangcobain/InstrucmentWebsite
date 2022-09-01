<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="NewURL" value="/admin-product"/>
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
                        <form id="formSubmit" action="<c:url value='/admin-product?type=list&page=1&maxPageItem=20&sortName=id&sortBy=desc'/>" enctype="multipart/form-data" method="post">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="categoryCode" name="categoryCode">
                                        <c:if test="${empty model.categoryCode}">
                                            <option value="">Chọn loại nhạc cụ</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.code}">${item.name}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty model.categoryCode}">
                                            <option value="">Chọn loại nhạc cụ</option>
                                            <c:forEach var="item" items="${categories}">
                                                <c:if test="${item.code == model.categoryCode}">
                                                    <option value="${item.code}" selected="selected">${item.name}</option>>
                                                </c:if>"
                                                <c:if test="${item.code != model.categoryCode}">
                                                    <option value="${item.code}">${item.name}</option>>
                                                </c:if>"
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <span id="error_categoryCode" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="names" name="names" value="${model.names}"/>
                                    <span id="error_names" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thương hiệu</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="brand" name="brand" value="${model.brand}"/>
                                    <span id="error_brand" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Xuất sứ</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="made" name="made" value="${model.made}"/>
                                    <span id="error_made" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                             <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Số lượng</label>
                                <div class="col-sm-9">                                 
                                    <input type="text" class="form-control" id="amount" name="amount" value="${model.amount}"/>
                                    <span id="error_amount" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                             <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                <div class="col-sm-9">                                 
                                    <input type="text" class="form-control" id="price" name="price" value="${model.price}"/>
                                    <span id="error_price" class="text-danger">*</span>
                                </div>
                            </div>
                            <br/>
                            <br/>
                             <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                <div class="col-sm-9">                                 
                                    <textarea rows="" cols="" id="description" name="description" style="width: 820px;height: 175px">${model.description}</textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>
                             <div class="form-group">
					               <label class="col-sm-3 control-label no-padding-right" for="picture">Hình ảnh</label>&emsp;  
					                <div class="col-sm-9">     
					               <input type="file" multiple id="gallery-photo-add" name="picture">
					                <div class="gallery"></div>
					                 </div>
					        </div>
					        <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <c:if test="${not empty model.id}">
                                        <input type="submit" class="btn btn-white btn-warning btn-bold" value="Cập nhật sản phẩm" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="submit" class="btn btn-white btn-warning btn-bold" value="Thêm sản phẩm" id="btnAddOrUpdateNew"/>
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
$(function() {
    // Multiple images preview in browser
    var imagesPreview = function(input, placeToInsertImagePreview) {
        if (input.files) {
            var filesAmount = input.files.length;
            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    $($.parseHTML('<img style="width:220px;height:200px;padding:3px;">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }
                reader.readAsDataURL(input.files[i]);
            }
        }
    };
    $('#gallery-photo-add').on('change', function() {
        imagesPreview(this, 'div.gallery');
    });
});

	
	/* $("#btnAddOrUpdateNew").click(function(e) {
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
		                 addProduct(data);
		                 $.alert('Thêm thành công!');
		                 resetValue();
                        }
		             } else {
                        if(addRegex() == false) {
                            $.alert('Cập nhật thất bại');
                         } else {
                            updateProduct(data);
		                 $.alert('Cập nhật thành công!');
                         }
		             } 
		        },
		        cancel: function () {
		        	
		        },
		    }
		});
       
    }) */
    function addProduct(data) {
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
	

        function updateProduct(data) {
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
        
        function resetValue() {
        	 $("#categoryCode").prop("selectedIndex", 0); 
        	 $("#names").val("");
             $("#brand").val("");
             $("#made").val("");
             $("#amount").val("");
             $("#price").val("");
             $("#description").val("");
        }

        function kiemTraTheLoai(){
                    var categoryCode = $("#categoryCode").val();
                    console.log(categoryCode);
                    if(categoryCode == ""){
                        $("#error_categoryCode").html('Phải chọn thể loại')
                        return false
                    }
                    $("#error_categoryCode").html('*')
                    return true
                }

                $("#categoryCode").blur(kiemTraTheLoai);

        function kiemTraTenSanPham(){
                var name = $("#names").val();
                if(name.trim() == ""){
                    $("#error_names").html("Phải nhập tên sản phẩm");
                    return false;
                }
                $("#error_names").html("*");
                return true;
            }
        $("#names").blur(kiemTraTenSanPham);

        function kiemTraThuongHieu(){
                var brand = $("#brand").val();
                if(brand.trim() == ""){
                    $("#error_brand").html("Phải nhập thương hiệu");
                    return false;
                }
                $("#error_brand").html("*");
                return true;
            }
        $("#brand").blur(kiemTraThuongHieu);

        function kiemTraXuatSu(){
                var made = $("#made").val();
                if(made.trim() == ""){
                    $("#error_made").html("Phải nhập xuất sứ");
                    return false;
                }
                $("#error_made").html("*");
                return true;
            }
        $("#made").blur(kiemTraXuatSu);

        function kiemtraSoLuong(){
                let amount = $("#amount").val()
                regex = /^[0-9]*$/
                if(amount.trim() == ""){
                    $("#error_amount").html("Phải nhập số lượng sản phẩm")
                    return false
                }
                if(amount <= 0) {
                    $("#error_amount").html("Số lượng sản phẩm phải lớn hơn 0")
                    return false
                }
                if(!regex.test(amount)){
                    $("#error_amount").html("Phải là số")
                    return false
                }

                $("#error_amount").html("*")
                return true
            }
        $("#amount").blur(kiemtraSoLuong);

        function kiemtraGia(){
                let price = $("#price").val()
                regex = /^[0-9]*$/
                if(price.trim() == ""){
                    $("#error_price").html("Phải nhập giá sản phẩm")
                    return false
                }
                if(!regex.test(price)){
                    $("#error_price").html("Phải là số")
                    return false
                }

                $("#error_price").html("*")
                return true
            }
        $("#price").blur(kiemtraGia);

        function addRegex() {
            if(!kiemTraTheLoai())
                return false;
            if(!kiemTraTenSanPham())
                return false;
            if(!kiemTraThuongHieu)
                return false;
            if(!kiemTraXuatSu())
                return false;
            if(!kiemtraSoLuong())
                return false;
            if(!kiemtraGia())
                return false;
        }

</script> 
</body>
</html>