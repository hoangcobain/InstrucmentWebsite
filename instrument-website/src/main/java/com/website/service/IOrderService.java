package com.website.service;

import java.util.List;

import com.website.model.OrderModel;
import com.website.paging.Pageble;

public interface IOrderService {
	OrderModel save(OrderModel orderModel);
	Long saveCart(OrderModel orderModel);
	List<OrderModel> findAll(Pageble pageble);
	int getTotalOrder();
	OrderModel update(OrderModel updateOrderModel);
	List<OrderModel> findAllOrderByDate(String date);
	List<OrderModel> findAllOrderByMonth(String monthYear);
	List<OrderModel> findAllOrderByYear(String year);
	List<OrderModel> findAllOrderByPeriodTime(String dateFrom, String dateTo);
}
