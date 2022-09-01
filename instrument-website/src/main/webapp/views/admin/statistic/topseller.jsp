<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-admin-topseller"/>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm bán chạy</title>
</head>
<body>
	<div class="main-content">
 		<form  id="formSubmit"> 
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<select style="margin-left: 20px;" id="selectOption">
					<option value="month">Theo tháng</option>
					<option value="year">Theo năm</option>
					<option value="period">Chọn khoảng thời gian</option>
				</select>
				<input type="month" id="statisticDate" name="statisticDate" style="margin-left: 20px;margin-top: 10px;">
				<input type="hidden" id="statisticDateFrom" name="statisticDateFrom" style="margin-left: 20px;margin-top: 10px;">
				<input type="hidden" id="statisticDateTo" name="statisticDateTo" style="margin-left: 20px;margin-top: 10px;">
				<input type="submit" value="Tìm kiếm" class="btn btn-danger" id = "btnSearch">
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
													<th>Tên sản phẩm</th>
													<th>Thương hiệu</th>
													<th>Xuất sứ</th>
													<th>Giá</th>
													<th>Số lượng bán ra</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty model.listResultWithMonth}">
												<c:forEach var="item" items="${model.listResultWithMonth}">
													<tr>		
														<td>${item.names}</td>
														<td>${item.brand}</td>
														<td>${item.made}</td>
														<td>${item.price}</td>
														<td>${item.itemModel.sl}</td>
													</tr>
												</c:forEach>
												</c:if>
												<c:if test="${not empty model.listResultWithYear}">
												<c:forEach var="item" items="${model.listResultWithYear}">
													<tr>		
														<td>${item.names}</td>
														<td>${item.brand}</td>
														<td>${item.made}</td>
														<td>${item.price}</td>
														<td>${item.itemModel.sl}</td>
													</tr>
												</c:forEach>
												</c:if>
												<c:if test="${not empty model.listResultWithPeriodTime}">
												<c:forEach var="item" items="${model.listResultWithPeriodTime}">
													<tr>		
														<td>${item.names}</td>
														<td>${item.brand}</td>
														<td>${item.made}</td>
														<td>${item.price}</td>
														<td>${item.itemModel.sl}</td>
													</tr>
												</c:forEach>
												</c:if>
											</tbody>
										</table>
										<!-- <ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
										<input type="hidden" value="" id="sortName" name="sortName" />
										<input type="hidden" value="" id="sortBy" name="sortBy" />
										<input type="hidden" value="" id="type" name="type" />  -->
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
		/* var totalPage = "${model.totalPage}";
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
		}); */
		
		$(document).ready(function() {
			$("#selectOption").change(function() {
				let date =  $("#selectOption").val();
				let type = date == "month" ? "month" : "text";
				$("#statisticDate").attr('type',type);
				if($("#selectOption").val() == "period") {
					$("#statisticDate").attr('type',"hidden");
					$("#statisticDateFrom").attr('type',"date");
					$("#statisticDateTo").attr('type',"date");
				} else {
					$("#statisticDateFrom").attr('type',"hidden");
					$("#statisticDateTo").attr('type',"hidden");
				}	
				console.log($("#statisticDate").val())
				if (type == "text") {
					$('#statisticDate').datepicker({ dateFormat: 'yy' });
				}
			})
		})
		
		$("#btnSearch").click(function() {
			 var formData = $('#formSubmit').serializeArray();
             formData.forEach(function(v,index) { 
             data[""+v.name+""] = v.value;
			 })
			 getTopSeller(data);
		});
		
		function getTopSeller(data) {
			console.log(typeof(obj.value));
            $.ajax({
                url: '${APIurl}',
                type: 'GET',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
					alert("Tìm kiem thanh cong");
                },
                error: function (error) {
                    console.log(error)
                    alert("Đặt hàng thất bại");
                }
            }) 
        }
		
	
	</script>
</body>
</html>