<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/template/web/css/styles.css'/>" rel="stylesheet" />
<link rel="stylesheet" href="<c:url value='/template/web/font-awesome/4.5.0/css/font-awesome.min.css' />" />
<link rel="stylesheet" href="<c:url value='/template/web/font-awesome/4.4.0/font-awesome.min.css' />" />
       
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="<c:url value='/template/web/js/jquery-3.6.0.min.js' />"></script>
<script src="<c:url value='/template/web/js/popper.min.js' />"></script>
<script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/template/pagination/jquery.twbsPagination.js' />"></script>
<link rel="stylesheet" href="<c:url value='/template/confirm/css/jquery-confirm.css' />" />
 <script src="<c:url value='/template/confirm/js/jquery-confirm.js' />"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>


</head>
<body>

		<%@ include file="/common/web/header.jsp" %>
		
		<dec:body/>
		
		<%@ include file="/common/web/footer.jsp" %>
        
        



</body>
</html>