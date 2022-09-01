package com.website.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.website.dao.IOrderDAO;
import com.website.model.OrderModel;
import com.website.paging.Pageble;
import com.website.service.IOrderService;

public class OrderService implements IOrderService {
	
	@Inject
	private IOrderDAO orderDAO;
	
	
	@Override
	public OrderModel save(OrderModel orderModel) {
		Long orderId = null;
		try {
			orderModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
			orderModel.setStatus(0);
			orderId = orderDAO.save(orderModel);
		} catch (Exception e) {
			System.out.print("Phải chọn thể loại");
		}
		return orderDAO.findOne(orderId);
	}


	@Override
	public Long saveCart(OrderModel orderModel) {
		Long orderId = null;
		try {
			orderId = orderDAO.saveCart(orderModel);
		} catch (Exception e) {
			System.out.print("Phải chọn thể loại");
		}
		return orderId;
	}


	@Override
	public List<OrderModel> findAll(Pageble pageble) {
		return orderDAO.findAll(pageble);
	}


	@Override
	public int getTotalOrder() {
		return orderDAO.getTotalOrder();
	}




	@Override
	public OrderModel update(OrderModel updateOrderModel) {
		orderDAO.update(updateOrderModel);
		return orderDAO.findOne(updateOrderModel.getId());
	}


	@Override
	public List<OrderModel> findAllOrderByDate(String date) {
		return orderDAO.findAllOrderByDate(date);
	}


	@Override
	public List<OrderModel> findAllOrderByMonth(String monthYear) {
		return orderDAO.findAllOrderByMonth(monthYear);
	}


	@Override
	public List<OrderModel> findAllOrderByYear(String year) {
		return orderDAO.findAllOrderByYear(year);
	}


	@Override
	public List<OrderModel> findAllOrderByPeriodTime(String dateFrom, String dateTo) {
		return orderDAO.findAllOrderByPeriodTime(dateFrom, dateTo);
	}

}
