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
import com.website.model.ProductModel;
import com.website.service.IProductService;
import com.website.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-topseller"})
public class TopSellerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private IProductService productService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		model.setListResultWithMonth(productService.findAllProductBestSeller(model.getStatisticDate()));
		model.setListResultWithYear(productService.findAllProductBestSellerByYear(model.getStatisticDate()));
		model.setListResultWithPeriodTime(productService.findAllOrderByPeriodTime(model.getStatisticDateFrom(),model.getStatisticDateTo()));
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/statistic/topseller.jsp");
		rd.forward(request, response);
	}
}
