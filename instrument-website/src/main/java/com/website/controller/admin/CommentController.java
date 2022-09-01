package com.website.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.constant.SystemConstant;
import com.website.model.CommentModel;
import com.website.paging.PageRequest;
import com.website.paging.Pageble;
import com.website.service.ICommentService;
import com.website.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-comment"})
public class CommentController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private ICommentService commentService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentModel commentModel = FormUtil.toModel(CommentModel.class, request);
		Pageble pageble = new PageRequest(commentModel.getPage(),commentModel.getMaxPageItem());
		commentModel.setListResult(commentService.findAll(pageble));
		commentModel.setTotalItem(commentService.getTotalComment());
		commentModel.setTotalPage((int) Math.ceil((double) commentModel.getTotalItem()/commentModel.getMaxPageItem()));
		request.setAttribute(SystemConstant.MODEL, commentModel);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/comment/list.jsp");
		rd.forward(request, response);
	}
}
