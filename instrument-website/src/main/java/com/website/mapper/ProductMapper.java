package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.ItemModel;
import com.website.model.PictureModel;
import com.website.model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel> {

	@Override
	public ProductModel mapRow(ResultSet resultSet) {
		try {
			ProductModel product = new ProductModel();
			product.setId(resultSet.getLong("id"));
			product.setNames(resultSet.getString("name"));
			product.setBrand(resultSet.getString("brand"));
			product.setMade(resultSet.getString("made"));
			product.setDescription(resultSet.getString("description"));
			product.setAmount(resultSet.getInt("amount"));
			product.setPrice(resultSet.getLong("price"));
			product.setCategoryId(resultSet.getLong("categoryid"));
			product.setCreatedDate(resultSet.getTimestamp("createddate"));
			product.setCreatedBy(resultSet.getString("createdby"));
			if (resultSet.getTimestamp("modifiedDate") != null) {
				product.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getTimestamp("modifiedDate") != null) {
				product.setModifiedBy(resultSet.getString("modifiedby"));
			}
			try {
				PictureModel pictureModel = new PictureModel();
				pictureModel.setPicture(resultSet.getString("picture"));
				pictureModel.setProductId(resultSet.getLong("productid"));
				product.setPictureModel(pictureModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			try {
				ItemModel itemModel = new ItemModel();
				itemModel.setSl(resultSet.getInt("SL"));
				product.setItemModel(itemModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return product;
		} catch (SQLException e) {
			return null;
		}
	}

}
