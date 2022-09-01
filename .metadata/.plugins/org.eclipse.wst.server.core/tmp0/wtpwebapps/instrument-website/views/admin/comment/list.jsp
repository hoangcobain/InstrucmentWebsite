<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-comment"/>
<c:url var="CommentURL" value="/admin-comment"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách bình luận</title>
</head>
<body>
	<div class="main-content">
 		<form action="<c:url value='/admin-comment'/>" id="formSubmit"
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
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bình luận'>
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
										<table class="table table-bordered">
											<thead>
												<tr>
													<th></th>
													<th>Nội dung</th>
													<th>Người bình luận</th>
													<th>Sản phẩm bình luận</th>
													<th>Ngày bình luận</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id = "checkbox_${item.id}" value="${item.id}"></td>
														<td>${item.content}</td>
														<td>${item.createdBy}</td>
														<td>${item.product.names}</td>
														<td>${item.createdDate}</td>
														
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
                    window.location.href = "${CommentURL}?type=list&page=1&maxPageItem=5"
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }
	</script>
</body>
</html>