package com.website.controller.admin.api;

import java.io.IOException;
import java.sql.Timestamp;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.CommentModel;
import com.website.model.ProductModel;
import com.website.model.UserModel;
import com.website.service.ICommentService;
import com.website.utils.HttpUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private ICommentService commentService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CommentModel commentModel = HttpUtil.of(request.getReader()).toModel(CommentModel.class);
		commentModel.setProductId(((ProductModel) SessionUtil.getInstance().getValue(request, "productId")).getId());
		commentModel.setUserId(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId());
		commentModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		commentModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		commentService.save(commentModel);
		mapper.writeValue(response.getOutputStream(), commentModel);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CommentModel commentModel = HttpUtil.of(request.getReader()).toModel(CommentModel.class);
		commentService.delete(commentModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
	
}
