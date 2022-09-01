package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.OrderModel;
import com.website.model.UserModel;

public class OrderMapper implements RowMapper<OrderModel> {

	@Override
	public OrderModel mapRow(ResultSet rs) {
		try {
			OrderModel orderModel = new OrderModel();
			orderModel.setId(rs.getLong("id"));
			orderModel.setUserId(rs.getLong("userid"));
			orderModel.setPhone(rs.getString("phone"));
			orderModel.setEmail(rs.getString("email"));
			orderModel.setAddress(rs.getString("address"));
			orderModel.setTotal(rs.getLong("total"));
			orderModel.setCreatedDate(rs.getTimestamp("createddate"));
			orderModel.setStatus(rs.getInt("status"));
			try {
				UserModel userModel = new UserModel();
				userModel.setId(rs.getLong("id"));
				userModel.setUserName(rs.getString("username"));
				userModel.setPassword(rs.getString("password"));
				userModel.setFullName(rs.getString("fullname"));
				userModel.setStatus(rs.getInt("status"));
				userModel.setRoleId(rs.getLong("roleid"));
				orderModel.setUser(userModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return orderModel;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
