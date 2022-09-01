package com.website.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.constant.SystemConstant;
import com.website.model.ItemModel;
import com.website.model.OrderModel;
import com.website.paging.PageRequest;
import com.website.paging.Pageble;
import com.website.service.IItemService;
import com.website.service.IOrderService;
import com.website.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-order"})
public class OrderController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Inject 
	private IOrderService orderService;
	
	@Inject 
	private IItemService itemService;
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderModel model = FormUtil.toModel(OrderModel.class, request);
			
		String view = "";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
			model.setListResult(orderService.findAll(pageble));
			model.setTotalItem(orderService.getTotalOrder());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view = "/views/admin/order/list.jsp";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			if (model.getId() !=null) {
				List<ItemModel> list = itemService.findByOrderId(model.getId());
				request.setAttribute("list", list);
			} else {
				
			}
			view = "/views/admin/order/edit.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
	