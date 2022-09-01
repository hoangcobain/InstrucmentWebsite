package com.website.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.website.dao.IOrderDAO;
import com.website.mapper.OrderMapper;
import com.website.model.OrderModel;
import com.website.paging.Pageble;

public class OrderDAO extends AbstractDAO<OrderModel> implements IOrderDAO {
	
	
	@Override
	public Long save(OrderModel orderModel) {
		StringBuilder sql = new StringBuilder("insert into orders(userid,phone,");
		sql.append("email,address,total,createddate,status)");
		sql.append("values(?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), orderModel.getUserId(),orderModel.getPhone(),
					orderModel.getEmail(),orderModel.getAddress(),orderModel.getTotal(),
					orderModel.getCreatedDate(),orderModel.getStatus());
	}

	@Override
	public OrderModel findOne(Long id) {
		String sql = "SELECT * FROM orders WHERE id = ?";
		List<OrderModel> orders = query(sql, new OrderMapper(), id);
		return orders.isEmpty() ? null : orders.get(0);
	}

	@Override
	public Long saveCart(OrderModel orderModel) {
		StringBuilder sql = new StringBuilder("insert into orders(userid,phone,");
		sql.append("email,address,total,createddate,status)");
		sql.append("values(?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), orderModel.getUserId(),orderModel.getPhone(),
					orderModel.getEmail(),orderModel.getAddress(),orderModel.getTotal(),
					orderModel.getCreatedDate(),orderModel.getStatus());
	}

	@Override
	public List<OrderModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM orders as o INNER JOIN user as u ON u.id=o.userid");
		if(pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		} 
		return query(sql.toString(), new OrderMapper());
	}

	@Override
	public int getTotalOrder() {
		String sql = "SELECT count(*) FROM orders";
		return count(sql, new OrderMapper());
	}

	@Override
	public void update(OrderModel updateOrderModel) {
		String sql = "UPDATE orders SET status = ? WHERE id = ?";
		update(sql,updateOrderModel.getStatus(),updateOrderModel.getId());
		
	}


	@Override
	public List<OrderModel> findAllOrderByDate(String date) {
		String sql = "SELECT * FROM orders WHERE date(createddate) = ? ";
		return query(sql, new OrderMapper(),date);
	}

	@Override
	public List<OrderModel> findAllOrderByMonth(String monthYear) {
		String sql = "SELECT *,DATE_FORMAT(createddate, \"%Y-%m\") as date FROM orders WHERE DATE_FORMAT(createddate, \"%Y-%m\") = ?";
		return query(sql, new OrderMapper(),monthYear);
	}

	@Override
	public List<OrderModel> findAllOrderByYear(String year) {
		String sql = "SELECT *,DATE_FORMAT(createddate, \"%Y\") as date FROM dbstore.orders WHERE DATE_FORMAT(createddate, \"%Y\") = ? ";
		return query(sql, new OrderMapper(),year);
	}

	@Override
	public List<OrderModel> findAllOrderByPeriodTime(String dateFrom, String dateTo) {
		String sql = "SELECT *,DATE_FORMAT(createddate, \"%Y-%m-%d\") as date FROM orders WHERE DATE_FORMAT(createddate, \"%Y-%m-%d\") and DATE_FORMAT(createddate, \"%Y-%m-%d\") between ? and ?";
		return query(sql, new OrderMapper(),dateFrom,dateTo);
	}

}
