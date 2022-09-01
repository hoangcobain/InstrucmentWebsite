package com.website.controller.admin.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.ProductModel;
import com.website.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-topseller"})
public class TopSellerAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		mapper.writeValue(response.getOutputStream(),productModel);
	}
	
}
