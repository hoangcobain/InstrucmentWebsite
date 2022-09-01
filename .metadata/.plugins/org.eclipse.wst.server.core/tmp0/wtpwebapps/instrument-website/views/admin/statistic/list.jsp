<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-admin-statistic"/>
<html>
<head>
<meta charset="UTF-8">
<title>Thống kê</title>
</head>
<body>
	<div class="main-content">
 		<form id="formSubmit"> 
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<select style="margin-left: 20px;" id="selectOption">
					<option value="day">Theo ngày</option>
					<option value="month">Theo tháng</option>
					<option value="year">Theo năm</option>
					<option value="period">Chọn khoảng thời gian</option>
				</select>
				<input type="date" id="statisticDate" name="statisticDate" style="margin-left: 20px;margin-top: 10px;">
				<input type="hidden" id="statisticDateFrom" name="statisticDateFrom" style="margin-left: 20px;margin-top: 10px;">
				<input type="hidden" id="statisticDateTo" name="statisticDateTo" style="margin-left: 20px;margin-top: 10px;">
				<input type="submit" value="Tìm kiếm" class="btn btn-danger" id = "btnSearch">
				<br>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
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
													<th>Mã hóa đơn</th>
													<th>Tổng tiền </th>
													<th>Ngày lập</th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${not empty model.listResultWithDate}">
												<c:set var="total" value="${0}" />
												<c:forEach var="item" items="${model.listResultWithDate}">
													<tr>
														<td>${item.id}</td>
														<td>${item.total}</td>
														<td>${item.createdDate}</td>						
													</tr>
													<c:set var="total" value="${total + item.total}" />
												</c:forEach>
												<%-- <fmt:parseDate pattern="dd-MM-yyyy" value="${model.statisticDate}" var="dateParseTime"/>
												<fmt:formatDate pattern="dd-MM-yyyy" value="${dateParseTime}" var="now" /> --%>
												<h2 class="text text-danger">Tổng doanh thu trong ngày <c:out value="${model.statisticDate}"/>: ${total} VND</h2>
											</c:if>
											<c:if test="${not empty model.listResultWithMonth}">
												<c:set var="total" value="${0}" />
												<c:forEach var="item" items="${model.listResultWithMonth}">
													<tr>
														<td>${item.id}</td>
														<td>${item.total}</td>
														<td>${item.createdDate}</td>						
													</tr>
													<c:set var="total" value="${total + item.total}" />
												</c:forEach>
												<h2 class="text text-danger">Tổng doanh thu trong tháng <c:out value="${model.statisticDate}"/>: ${total} VND</h2>
											</c:if>
											<c:if test="${not empty model.listResultWithYear}">
												<c:set var="total" value="${0}" />
												<c:forEach var="item" items="${model.listResultWithYear}">
													<tr>
														<td>${item.id}</td>
														<td>${item.total}</td>
														<td>${item.createdDate}</td>						
													</tr>
													<c:set var="total" value="${total + item.total}" />
												</c:forEach>
												<h2 class="text text-danger">Tổng doanh thu trong năm <c:out value="${model.statisticDate}"/>: ${total} VND</h2>
											</c:if>
											<c:if test="${not empty model.listResultWithPeriodTime}">
												<c:set var="total" value="${0}" />
												<c:forEach var="item" items="${model.listResultWithPeriodTime}">
													<tr>
														<td>${item.id}</td>
														<td>${item.total}</td>
														<td>${item.createdDate}</td>						
													</tr>
													<c:set var="total" value="${total + item.total}" />
												</c:forEach>
												<h2 class="text text-danger">Tổng doanh thu từ <c:out value="${model.statisticDateFrom}"/> đến <c:out value="${model.statisticDateTo}"/>: ${total} VND</h2>
											</c:if>
											</tbody>
										</table>
<!-- 										<ul class="pagination" id="pagination"></ul>
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
				let type = date == "day" ? "date" : (date == "month" ? "month" : "text");
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
		
		/* $("#selectOption").change(function() {
				let html =  $("#selectOption").val();
				let area =  document.getElementById("totalArea");
				if (html == "month") {
					area.innerHTML = `<h2>Doanh thu trong tháng</h2>
						<h3>Tổng tiền:</h3>`;
				} else if (html == "year") {
					area.innerHTML = `<h2>Doanh thu trong năm</h2>
						<h3>Tổng tiền:</h3>`;
				}
			}) */
		
		
		
		$("#btnSearch").click(function() {
			 var formData = $('#formSubmit').serializeArray();
             formData.forEach(function(v,index) { 
             data[""+v.name+""] = v.value;
			 })
			 getOrder(data);
		});
		
		function getOrder(data) {
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