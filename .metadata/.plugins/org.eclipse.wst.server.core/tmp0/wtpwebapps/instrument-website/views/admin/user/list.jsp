<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var="ProductURL" value="/admin-user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
</head>
<body>
	<div class="main-content">
 		<form action="<c:url value='/admin-user'/>" id="formSubmit"
			method="get"> 
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<input id="myInput" type="text" placeholder="Search.." style="margin-left: 20px;margin-top: 10px;">
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
												href='<c:url value="/admin-user?type=edit"/>'> <span>
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
										<table class="table table-bordered" id = "myTable">
											<thead>
												<tr>
													<th><input type="checkbox" id = "checkAll"></th>
													<th>Id</th>
													<th>Tên đăng nhập</th>
													<th>Tên đầy đủ</th>
													<th>Vai trò</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id = "checkbox_${item.id}" value="${item.id}"></td>
														<td>${item.id}</td>
														<td>${item.userName}</td>
														<td>${item.fullName}</td>
														<td>${item.role.name}</td>
																											
														<td>						
														<c:url var="editURL" value="/admin-user">
															<c:param name="type" value="edit"></c:param>
															<c:param name="id" value="${item.id}"></c:param>
														</c:url>
															<a class="btn btn-sm btn-primary btn-edit"
															data-toggle="tooltip" title="Cập nhật tài khoản"
															href='${editURL}'>
																<i class="fa fa-pencil-square-o"
																aria-hidden="true">
																</i> 
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
										<input type="hidden" value="" id="sortName" name="sortName" />
										<input type="hidden" value="" id="sortBy" name="sortBy" />
										<input type="hidden" value="" id="type" name="type" /> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		 </form>
	</div>
	<script type="text/javascript">
		
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tbody tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	
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
		
		
		$("#btnDelete").click(function() {
			$.confirm({
			    title: 'Thông báo',
			    content: 'Bạn có đồng ý xóa ?', 
			    buttons: {
			        confirm: function () {
						var data = {};
						var ids = $('tbody input[type=checkbox]:checked').map(function () {
				            return $(this).val();
				        }).get();
						data['ids'] = ids;
						deleteProduct(data);
						 $.alert('Xóa thành công!');
			        },
			        cancel: function () {
			        	
			        },
			    }
			});
		});
		
        function deleteProduct(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (result) {
                    window.location.href = "${ProductURL}?type=list&page=1&maxPageItem=5"
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }
	</script>
</body>
</html>