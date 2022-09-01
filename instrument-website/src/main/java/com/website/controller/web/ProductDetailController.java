package com.website.controller.web;

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
import com.website.paging.PageRequest;
import com.website.paging.Pageble;
import com.website.service.ICommentService;
import com.website.service.IProductService;
import com.website.sort.Sorter;
import com.website.utils.FormUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IProductService productService;
	
	@Inject
	private ICommentService commentService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		Pageble pageble = new PageRequest(new Sorter(model.getSortName(), model.getSortBy()));
		model = productService.findOne(model.getId());
		model.setCommentCollection(commentService.findAllCommentByProductId(model.getId(),pageble));
		request.setAttribute(SystemConstant.MODEL, model);
		SessionUtil.getInstance().putValue(request, "productId", model);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/product/productdetail.jsp");
		rd.forward(request, response);
	}
}
