<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
		<div class="container">
			<a class="navbar-brand" href="#">Laravel</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">Đăng
							nhập</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Đăng ký</a>
					</li>
				</ul>

			</div>
		</div>
	</nav>


	<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<c:if test="${not empty message }">
						<div class="alert alert-${alert}">
							<strong>${message}</strong>
						</div>
					</c:if>
					<div class="card">
						<div class="card-header">Đăng nhập</div>
						<div class="card-body">
							<form action="<c:url value='/login'/>" id="formLogin"
								method="post">
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">Tên đăng
										nhập</label>
									<div class="col-md-6">
										<input type="text" id="userName" class="form-control"
											name="userName" required autofocus>
									</div>
								</div>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">Mật khẩu</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" name="remember">
												Lưu tài khoản
											</label>
										</div>
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary">Đăng
										nhập</button>
									<a href="#" class="btn btn-link"> Quên mật khẩu? </a>
								</div>
								<input type="hidden" value="login" name="action" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
</body>
</html>