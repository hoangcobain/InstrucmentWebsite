package com.website.controller.admin.api;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.website.model.Cart;
import com.website.utils.CountCart;
import com.website.utils.HttpUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-cart"})
public class CartAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		Cart param = HttpUtil.of(request.getReader()).toModel(Cart.class);
		Map<Long, Cart> cart =  (Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart");
		if (cart == null) 
			cart = new HashMap<Long, Cart>();
		Long productId = param.getProductId();
		if (cart.containsKey(productId)) {
			Cart c = cart.get(productId);
			c.setQuantity(c.getQuantity() + 1);
		} else {
			cart.put(productId, param);
		}
		SessionUtil.getInstance().putValue(request, "cart", cart);
		mapper.writeValue(response.getOutputStream(), CountCart.countCart(cart));
	}
	
	@SuppressWarnings("unchecked")
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		Cart param = HttpUtil.of(request.getReader()).toModel(Cart.class);
		Map<Long, Cart> cart =  (Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart");
		if (cart == null) 
			cart = new HashMap<Long, Cart>();
		Long productId = param.getProductId();
		if (cart.containsKey(productId)) {
			Cart c = cart.get(productId);
			c.setQuantity(param.getQuantity());
		}
		SessionUtil.getInstance().putValue(request, "cart", cart);
		mapper.writeValue(response.getOutputStream(), CountCart.cartStats(cart));
	}
	
	
	@SuppressWarnings("unchecked")
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		Cart param = HttpUtil.of(request.getReader()).toModel(Cart.class);
		Map<Long, Cart> cart =  (Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart");
		Long productId = param.getProductId();
		if(cart != null && cart.containsKey(productId)) {
			cart.remove(productId);
			SessionUtil.getInstance().putValue(request, "cart", cart);
		}
		mapper.writeValue(response.getOutputStream(), CountCart.cartStats(cart));	
	}
	
}
