package com.website.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.ProductModel;
import com.website.model.UserModel;
import com.website.service.IProductService;
import com.website.utils.HttpUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-product"})
public class ProductAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private IProductService productService;
	

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ObjectMapper mapper = new ObjectMapper();
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
//		productModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
//		productModel = productService.save(productModel);
//		mapper.writeValue(response.getOutputStream(), productModel);
//	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productModel.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		productModel = productService.update(productModel);
		System.out.print(productModel);
		mapper.writeValue(response.getOutputStream(), productModel);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productService.delete(productModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
