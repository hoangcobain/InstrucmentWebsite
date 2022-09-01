package com.website.dao;

import java.util.List;

import com.website.model.OrderModel;
import com.website.paging.Pageble;

public interface IOrderDAO extends GenericDAO<OrderModel> {
	Long save(OrderModel orderModel);
	Long saveCart(OrderModel orderModel);
	OrderModel findOne(Long id);
	List<OrderModel> findAll(Pageble pageble);
	List<OrderModel> findAllOrderByDate(String date);
	List<OrderModel> findAllOrderByMonth(String monthYear);
	List<OrderModel> findAllOrderByYear(String year);
	List<OrderModel> findAllOrderByPeriodTime(String dateFrom,String dateTo);
	int getTotalOrder();
	void update(OrderModel updateOrderModel);
	
}
