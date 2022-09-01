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
import com.website.model.UserModel;
import com.website.paging.PageRequest;
import com.website.paging.Pageble;
import com.website.service.IRoleService;
import com.website.service.IUserService;
import com.website.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Inject 
	private IUserService userService;
	
	@Inject
	private IRoleService roleService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel model = FormUtil.toModel(UserModel.class, request);
		String view = "";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
			model.setListResult(userService.findAll(pageble));
			model.setTotalItem(userService.getTotalUser());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view = "/views/admin/user/list.jsp";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			if (model.getId() !=null) {
				model = userService.findOne(model.getId());
			} else {
				
			}
			request.setAttribute("roles", roleService.findAll());
			view = "/views/admin/user/edit.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
	