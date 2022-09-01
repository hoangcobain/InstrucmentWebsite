package com.website.controller.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.model.Cart;
import com.website.utils.CountCart;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/cart-list"})
public class CartProductController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<Long, Cart> cart =(Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart");
		if (cart != null) {
			request.setAttribute("carts", cart.values());
		} else {
			request.setAttribute("carts", null);
		}
		request.setAttribute("cartCount", CountCart.countCart((Map<Long, Cart>) SessionUtil.getInstance().getValue(request, "cart")));
		request.setAttribute("cartStats", CountCart.cartStats(cart));
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/product/cartproduct.jsp");
		rd.forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		super.doPost(request, response);

	}
}
