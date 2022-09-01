<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-admin-order" />
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách hóa đơn</title>
</head>
<body>
	<div class="main-content">
		<form action="<c:url value='/admin-order'/>" id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm tài khoản'
												href='<c:url value="/admin-order?type=edit"/>'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bài viết'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered table-hover table-striped">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tên khách hàng</th>
													<th>Số điện thoại</th>
													<th>Tổng tiền</th>
													<th>Ngày đặt hàng</th>
													<th>Trạng thái đơn hàng</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td>${item.id}</td>
														<td>${item.user.fullName}</td>
														<td>${item.phone}</td>
														<td>${item.total}</td>
														<td>${item.createdDate}</td>
														<td>
															<div class="custom-switch custom-switch-label-onoff pl-0">
																<c:if test="${item.status == 1}">
																	<input class="custom-switch-input" type="checkbox"
																		id="status" name="status" value="${item.status}"
																		checked onclick="updateStatus(this,${item.id})">
																	<label class="custom-switch-btn" for="status"></label>
																</c:if>
																<c:if test="${item.status == 0}">
																	<input class="custom-switch-input" type="checkbox"
																		id="status" name="status" value="${item.status}"
																		onclick="updateStatus(this,${item.id})">
																	<label class="custom-switch-btn" for="status"></label>
																</c:if>

															</div>
														</td>

														<td><c:url var="editURL" value="/admin-order">
																<c:param name="type" value="edit"></c:param>
																<c:param name="id" value="${item.id}"></c:param>
															</c:url> <a class="btn btn-sm btn-primary btn-edit"
															data-toggle="tooltip" title="Xem đơn hàng"
															href='${editURL}'> Xem </a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" /> <input
											type="hidden" value="" id="maxPageItem" name="maxPageItem" />
										<input type="hidden" value="" id="sortName" name="sortName" />
										<input type="hidden" value="" id="sortBy" name="sortBy" /> <input
											type="hidden" value="" id="type" name="type" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>



	<script>
	
	
	function updateStatus(obj,orderId) {	 
		 $.confirm({
			    title: 'Thông báo',
			    content: 'Bạn có đồng ý chuyển thành đã giao hàng?', 
			    buttons: {
			        confirm: function () {
			        	event.preventDefault();
           		 $.ajax({
                url: '${APIurl}',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(
                	{
                	    "id": orderId,
                	    "status": obj.value
                	}
                ),
                dataType: 'json',
                success: function (result) {
					location.reload();
					alert("Chuyển thành công");
                },
                error: function (error) {
                    console.log(error)
                }
            })
			        }, cancel: function () {
			        	
			        },
			    },
			});
	}

	$("#status").click(function(e) {
            if($("#status").is(':checked')) {
                $("#status").val(1);
            } else if($("#status").not(':checked') ) {
                $("#status").val(0);
            }
        })

			
		var totalPage = "${model.totalPage}";
		var currentPage = "${model.page}";
		var limit = 5;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPage,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					//console.info(page + ' (from options)');
					if (currentPage != page) {
						$("#maxPageItem").val(limit);
						$("#page").val(page);
						$("#sortName").val('id');
						$("#sortBy").val('desc');
						$("#type").val('list');
						$("#formSubmit").submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
			
		
		$(document).ready(function() {
			$(".view-product").click(function() {
				$("#myModal").modal();
			})
					 
		});

	</script>
</body>
</html>