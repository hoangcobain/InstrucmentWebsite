package com.website.utils;

import java.util.HashMap;
import java.util.Map;

import com.website.model.Cart;

public class CountCart {
	public static int countCart(Map<Long, Cart> cart) {
		int count = 0;
		if(cart != null) {
			for (Cart c : cart.values()) {
				count += c.getQuantity();
			}
		}
		return count;
	}
	
	public static Map<String, String> cartStats(Map<Long, Cart> cart) {
		Long s =0l;
		int q = 0;
		if(cart != null) {
			for (Cart c : cart.values()) {
				q+= c.getQuantity();
				s += c.getQuantity() * c.getPrice();
			}
		}
		Map<String, String> kq = new HashMap<>();
		kq.put("counter", String.valueOf(q));
		kq.put("amount", String.valueOf(s));
		
		return kq;
	}
}
