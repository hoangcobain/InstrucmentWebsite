<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="NewURL" value="/admin-product"/>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
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
									<div class="table-responsive">
										<table class="table table-bordered table-hover table-striped">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tên sản phẩm</th>
													<th>Số lượng</th>
													<th>Giá</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${list}">
													<tr>
														<td>${item.orderId}</td>
														<td>${item.product.names}</td>
														<td>${item.quantity}</td>
														<td>${item.price}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
            </div>
        </div>
    </div>
<script>
	
	
</script> 
</body>
</html>