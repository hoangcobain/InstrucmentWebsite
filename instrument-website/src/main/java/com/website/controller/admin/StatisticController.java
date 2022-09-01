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
import com.website.model.OrderModel;
import com.website.service.IOrderService;
import com.website.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-statistic"})
public class StatisticController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private IOrderService orderService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderModel model = FormUtil.toModel(OrderModel.class, request);
		model.setListResultWithDate(orderService.findAllOrderByDate(model.getStatisticDate()));
		model.setListResultWithMonth(orderService.findAllOrderByMonth(model.getStatisticDate()));
		model.setListResultWithYear(orderService.findAllOrderByYear(model.getStatisticDate()));
		model.setListResultWithPeriodTime(orderService.findAllOrderByPeriodTime(model.getStatisticDateFrom(),model.getStatisticDateTo()));
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/statistic/list.jsp");
		rd.forward(request, response);
	}
}
