<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-cart"/>
<c:url var="APICheckOut" value="/api-checkout"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/template/web/css/bootstrap.min.css' />" />
</head>
<body>
	<c:if test="${carts == null}">
		<h2 style="padding-bottom: 78vh; color: red;">Không có sản phẩm trong giỏ hàng</h2>
	</c:if>
	<c:if test="${carts != null}">
		<div class="row" style="margin-top: 100px; margin-bottom: 100px; padding-left: 100px; padding-right: 100px;">
		<div class="col-xs-12">
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Mã sản phẩm</th>
							<th>Tên sản phẩm</th>
							<th>Đơn giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:set var="total" value="${0}" /> --%>
						<c:forEach var="item" items="${carts}">
							<tr id="product${item.productId}">
								<td>${item.productId}</td>
								<td>${item.productName}</td>
								<td>${item.price}</td>
								<td style="width: 400px;">
									<div>
										<input type= "number" value="${item.quantity}" onblur="updateCart(this,${item.productId})" onclick="clickQuantity(this)">
									</div>
								</td>
								<td>${item.price * item.quantity}</td>
								<td>
									<div class = "form-group">
										<button type= "button" value="${item.productId}" class = "btn btn-primary" onclick="deleteCart(this)">Xóa</button>
									</div>
								</td>
								<%-- <c:set var="total"
									value="${total + (item.price * item.quantity)}" /> --%>
							</tr>
						</c:forEach>
						<th colspan="4">Tổng tiền:</th>
						<td class="text-center text-info"><span id="amountCart">${cartStats.amount}</span> VND</td>
					</tbody>
				</table>
		</div>
		
	</div>
	<div class="col-sm-5 col-lg-4">
              <header class="heading-5">
                <h4>01/</h4>
                <h5>Liên hệ chúng tôi</h5>
              </header>
              <ul class="contact-list">
                <li><span class="iconic"><i class="flaticon-call36"></i></span>0797 - 207 - 493</li>
                <br>
                <li><span class="iconic"><i class="flaticon-email15"></i></span><a href="#">hoang21062001@gmail.com</a></li>
                <br>
                <li><span class="iconic"><i class="flaticon-twitter16"></i></span><a href="#">@hoang</a></li>
                <br>
                <li><span class="iconic"><i class="flaticon-facebook43"></i></span><a href="#">facebook.com</a></li>
              </ul>
            </div>
           <div class="col-sm-7 col-lg-8">
              <div class="form-section-box">
                <header class="heading-5 text-center">
                  <h4>02/</h4>
                  <h5>Thông tin đơn hàng</h5>
                </header>

               <form id="formSubmit">
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Số điện thoại*</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" placeholder="phone" name="phone" id = "phone">
                    </div>
                  </div>
                  <br>
                  <br>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Họ tên</label>
                    <div class="col-md-10">
                    	<c:if test="${empty USERMODEL}">
                      		<input type="text" value="${USERMODEL.fullName}"class="form-control" placeholder="Name" name="fullName">
                        </c:if>
                        <c:if test="${not empty USERMODEL}">
                      		<input type="text" value="${USERMODEL.fullName}"class="form-control" placeholder="Name" name="fullName" readonly>
                        </c:if>
                    </div>
                  </div>
                  <br>
                  <br>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Email</label>
                    <div class="col-md-10">
                      <input type="email" class="form-control" placeholder="Email" name="email" id = "email">
                    </div>
                  </div>
                  <br>
                  <br>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Địa chỉ nhận hàng(Ghi rõ số nhà, tên đường)</label>
                    <div class="col-md-10">
                      <textarea class="form-control" placeholder="Adress" name="address" id = "address"></textarea>
                    </div>
                  </div>
                  <br>
                  <br>
                  <div class="form-group row" style="justify-content: flex-end">
                  	<div class="col-md-6">
                  	<c:if test="${not empty USERMODEL}">
                  		 <input type="button" class="btn btn-info form-control" value="Thanh toán" id="btnCheckOut">
                  	</c:if>
                  	
                  	<c:if test="${empty USERMODEL}">
                  		<button type="button" class="btn btn-info form-control">
							<a style="color: black;" class="nav-link" href='<c:url value = "/login?action=login&page=1&maxPageItem=6" />'>Thanh toán</a>
						</button>
                  	</c:if>
                     
                    </div>
                  </div>
                  <br>
                  <br>
                </form>
              </div><!-- /form-section-box -->
            </div>
		</div>
		
	</c:if>

	<script>
	
	 /* $("input[type=number]").click(function(e) {
        if($("input[type=number]").val() < 1) {
        	 $("input[type=number]").val(1);
        } 
    }) */
    
     function clickQuantity(obj) {
		 if(obj.value < 1) {
			 obj.value = 1
        } 
     }
    
    $("input[type=number]").keydown(function(e) {
      if (event.keyCode === 38 || event.keyCode === 40) {
        event.preventDefault();
      }
    })

    $('input[type=number]').on('input', function (e){
      if (e.target.value < 1) {
        	console.log(e.target.value);
        	$('input[type=number]').val(1)
        	/* e.preventDefault(); */
        }
 });

$("#btnCheckOut").click(function(e) {
		$.confirm({
		    title: 'Thông báo',
		    content: 'Bạn có đồng ý đặt hàng?', 
		    buttons: {
		        confirm: function () {
		        	 e.preventDefault();
		             var data = {};
		             var formData = $('#formSubmit').serializeArray();
		             formData.forEach(function(v,index) { 
		                 data[""+v.name+""] = v.value;
		             })
					 addOrder(data);
		             resetValue();

		        },
		        cancel: function () {
		        	
		        },
		    }
		});
       
    })
    
    function resetValue() {
        	 $("#phone").val("");
             $("#address").val("");
             $("#email").val("");
        }

	function addOrder(data) {
            $.ajax({
                url: '${APICheckOut}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
					alert("Đặt hàng thành công");
					location.reload();
                },
                error: function (error) {
                    console.log(error)
                    alert("Đặt hàng thất bại");
                }
            })
        }

		function updateCart(obj,productId) {
			 event.preventDefault();
			$.ajax({
                url: '${APIurl}',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(
                {
            	    "productId": productId,
            	    "productName": "",
            	    "price": 0,
            	    "quantity": obj.value
            	}),
                dataType: 'json',
                success: function (result) {
                	let counter = $("#cartCounter");
                    counter.html(result.counter);
                    let amount = $("#amountCart");
                    amount.html(result.amount);
                    console.log(result);
                },
                error: function (error) {
                    console.log(error)
                }
            })
		}
		
		function deleteCart(obj) {
			 event.preventDefault();
			$.ajax({
               url: '${APIurl}',
               type: 'DELETE',
               contentType: 'application/json',
               data: JSON.stringify(
               {
           	    "productId": obj.value,
           	}),
               dataType: 'json',
               success: function (result) {
                   let counter = $("#cartCounter");
                   counter.html(result.counter);
                   let amount = $("#amountCart");
                   amount.html(result.amount);
                   console.log(result);
                  /*  location.reload(); */
                  let row = document.getElementById(`product\${obj.value}`);
                  row.style.display = "none";
               },
               error: function (error) {
                   console.log(error)
               }
           })
		}
		
	</script>

</body>
</html>