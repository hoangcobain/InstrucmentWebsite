package com.website.controller.admin.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.OrderModel;
import com.website.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-statistic"})
public class StatisticAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		OrderModel orderModel = HttpUtil.of(request.getReader()).toModel(OrderModel.class);
		mapper.writeValue(response.getOutputStream(),orderModel);
	}
	
}
