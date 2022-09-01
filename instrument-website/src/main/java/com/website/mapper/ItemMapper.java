package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.ItemModel;
import com.website.model.ProductModel;

public class ItemMapper implements RowMapper<ItemModel> {

	@Override
	public ItemModel mapRow(ResultSet rs) {
		try {
			ItemModel itemModel = new ItemModel();
			itemModel.setId(rs.getLong("id"));
			itemModel.setQuantity(rs.getInt("quantity"));
			itemModel.setPrice(rs.getLong("price"));
			itemModel.setProductId(rs.getLong("productid"));
			itemModel.setOrderId(rs.getLong("orderid"));
			try {
				ProductModel productModel = new ProductModel();
				productModel.setNames(rs.getString("name"));
				productModel.setBrand(rs.getString("brand"));
				productModel.setMade(rs.getString("made"));
				productModel.setDescription(rs.getString("description"));
				productModel.setAmount(rs.getInt("amount"));
				productModel.setPrice(rs.getLong("price"));
				productModel.setCategoryId(rs.getLong("categoryid"));
				itemModel.setProduct(productModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			
			return itemModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
