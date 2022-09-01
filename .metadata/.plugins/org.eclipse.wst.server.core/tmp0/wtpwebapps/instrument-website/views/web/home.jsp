<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-cart"/>
<html>

<head>

<meta charset="UTF-8">

<title>Trang chủ</title>

</head>

<body>	
		
		
        <!-- Page Content-->
<form action="<c:url value='/homepage?page=1&maxPageItem=6'/>" id="formSubmit"
			method="get">
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="./img/nirvana.png" alt="..." style="height: 400px;"/></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">Nirvana Shop</h1>
                    <p>Nirvana là nhà phân phối nhạc cụ và các thương hiệu audio đẳng cấp cũng như Cửa Hàng Âm Nhạc hàng đầu châu Á, là đại diện thương hiệu Martin, Ibanez, Epiphone, Marshall, Akai và còn nhiều cái tên khác!</p>
                    <a class="btn btn-primary" href="#!">Liên hệ với chúng tôi</a>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">The measure of life is not its duration, but its donation.</p></div>
            </div>
            <div class="row gx-4 gx-lg-5" style="margin-bottom: 20px;"><h3 class="text-center text-danger">TOP SẢN PHẨM BÁN CHẠY</h3></div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
            	<c:forEach var="item" items="${model.listResult}">
            	<div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">${item.names}</h2>
							<img src="./images/${item.pictureModel.picture}" alt="image" style="width: 340px;height: 265px;" class="img-fluid">
                            <p class="card-text" style="margin-top: 7px;margin-bottom: 5px;">${item.description}</p>
                            <p class="price-text" style="margin-top: 7px;margin-bottom: 5px;">${item.price} VND</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href='<c:url value = "/product-detail?id=${item.id}&sortName=createddate&sortBy=desc" />'>Xem chi tiết</a></div>
                        <div class="card-footer"><a class="btn btn-success btn-sm" onclick="addToCart(${item.id},'${item.names}',${item.price})">Thêm vào giỏ hàng</a></div>

                    </div>
                </div>
            	</c:forEach>
            </div>
<!-- 			<ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page" />
            <input type="hidden" value="" id="maxPageItem" name="maxPageItem" /> -->
        </div>

</form>
    

    <script>
       /*  var totalPage = "${model.totalPage}";
		var currentPage = "${model.page}";
		var limit = 6;
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
						$("#formSubmit").submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		}); */


        function addToCart(id,name,price) {
            event.preventDefault();
            $.ajax({
                url: '${APIurl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(
                	{
                	    "productId": id,
                	    "productName": name,
                	    "price": price,
                	    "quantity": 1
                	}
                ),
                dataType: 'json',
                success: function (result) {
                    let counter = $("#cartCounter");
                    counter.html(result);
                    console.log(result);
					// location.reload();
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }

    </script>
</body>

</html>