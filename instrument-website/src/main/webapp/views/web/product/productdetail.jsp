<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<c:url var="APIurl" value="/api-comment"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/template/web/css/shop-item.css'/>" rel="stylesheet" />
<link href="<c:url value='/template/web/css/bootstrap.min.css'/>" rel="stylesheet" />
</head>
<body>
	<div class="container">
    <div class="row" style="margin-bottom: 10vh;">

      <div class="col-lg-3">
        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item active">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
          <div class="card-body">
          <c:forEach var="item" items="model">
          	<h3 class="card-title">${model.names}</h3>
          	<img src="./images/${model.pictureModel.picture}" alt="image" style="width: 930px;height: 500px;" class="img-fluid" alt="image">
            <h4>${model.price} VND</h4>
            <p>${model.description}</p>
          </c:forEach> 
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
          </div>
        </div>
        <!-- /.card -->

        <!-- <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <div class="card-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <a href="#" class="btn btn-success">Leave a Review</a>
          </div>
        </div> -->
        <!-- /.card -->
      </div>
      <!-- /.col-lg-9 -->
   

    </div>
	<form id = "formSubmit">
     	<div class="form-group">
           	<textarea class="form-control" placeholder="Nhập đánh giá của bạn.." id= "content" name = "content"></textarea>	
     	</div>
     	<c:if test="${not empty USERMODEL}">
     		<input type="button" value="Gửi bình luận" class="btn btn-danger" id = "btnSendComment" />
     	</c:if>
     	<c:if test="${empty USERMODEL}">
				 <a style="color: white;width: 129px;" class="nav-link btn btn-danger" href='<c:url value = "/login?action=login&page=1&maxPageItem=6" />'>Gửi bình luận</a>
     	</c:if>

	</form>
	
	<div id = "commentArea">
			<c:forEach var="comment" items="${model.commentCollection}">
		<div class="row" style="padding: 10px">
		<div class="col-lg-1">
			<img class="rounded-circle img-fluid" src='<c:url value = "/img/profile.png" />'>
		</div>
		<div class="col-lg-11 myDate">
			<p style="margin-top: 6px;">${comment.content}</p>
			<i>${comment.createdDate}</i>
		</div>
		</div>
	</c:forEach>
	</div>

	
  </div>
  
<script>

$("#btnSendComment").click(function(e) {
	$.confirm({
	    title: 'Thông báo',
	    content: 'Bạn có đồng ý gửi bình luận?', 
	    buttons: {
	        confirm: function () {
	        	 e.preventDefault();
	             var data = {};
	             var formData = $('#formSubmit').serializeArray();
	             formData.forEach(function(v,index) { 
	                 data[""+v.name+""] = v.value;
	             })
				 addComment(data);

	        },
	        cancel: function () {
	        	
	        },
	    }
	});
   
})
    function addComment(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                console.log(result);

             let area = document.getElementById("commentArea");
                area.innerHTML = `
                	<div class="row" style="padding: 10px">
            		<div class="col-lg-1">
            			<img class="rounded-circle img-fluid" src='<c:url value = "/img/profile.png" />'>
            		</div>
            		<div class="col-lg-11 myDate">
            			<p style="margin-top: 6px;">\${result.content}</p>
            			<i>\${moment(result.createdDate).fromNow()}</i>
            		</div>
            	</div>
                ` + area.innerHTML
                
            },
            error: function (error) {
                console.log(error)
                alert("Gửi thật bại");
            }
        })
    }

        $(document).ready(function() {
  	  		let dates = $(".myDate > i");
  	  		for (let i = 0; i < dates.length; i++) {
  	  			let date = dates[i];
  	  			date.innerText = moment(date.innerText).fromNow();
          }
        }) 
        
       
</script> 

</body>
</html>