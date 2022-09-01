package com.website.controller.admin.api;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.Cart;
import com.website.model.ItemModel;
import com.website.model.OrderModel;
import com.website.model.UserModel;
import com.website.service.IItemService;
import com.website.service.IOrderService;
import com.website.service.IProductService;
import com.website.utils.CountCart;
import com.website.utils.HttpUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-checkout"})
public class CheckOutAPI extends HttpServlet {
	
	@Inject
	private IOrderService orderService;

	@Inject
	private IProductService productService;
	
	@Inject
	private IItemService itemService;
	
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		OrderModel orderModel = HttpUtil.of(request.getReader()).toModel(OrderModel.class);
		Map<Long, Cart> cart =  (Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart");
		orderModel.setUserId(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId());
		Map<String, String> stats = CountCart.cartStats(cart);
		orderModel.setTotal(Long.parseLong(stats.get("amount")));
		orderModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		orderModel.setStatus(0);
		Long orderId = orderService.saveCart(orderModel);
		
		for (Cart c : cart.values()) {
			ItemModel itemModel = new ItemModel();
			itemModel.setOrder(orderModel);
			itemModel.setOrderId(orderId);
			itemModel.setProduct(productService.findOne(c.getProductId()));
			itemModel.setProductId(c.getProductId());
			itemModel.setPrice(c.getPrice());
			itemModel.setQuantity(c.getQuantity());
			itemService.save(itemModel);
		}
		mapper.writeValue(response.getOutputStream(), orderModel);
		SessionUtil.getInstance().removeValue(request, "cart");
	}
	
	
}
