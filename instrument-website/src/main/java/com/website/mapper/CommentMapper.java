package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.CommentModel;
import com.website.model.ProductModel;

public class CommentMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet rs) {
		try {
			CommentModel comment = new CommentModel();
			comment.setId(rs.getLong("id"));
			comment.setContent(rs.getString("content"));
			comment.setUserId(rs.getLong("userid"));
			comment.setProductId(rs.getLong("productid"));
			comment.setCreatedDate(rs.getTimestamp("createddate"));
			comment.setCreatedBy(rs.getString("createdby"));
			if (rs.getTimestamp("modifiedDate") != null) {
				comment.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			if (rs.getTimestamp("modifiedDate") != null) {
				comment.setModifiedBy(rs.getString("modifiedby"));
			}
			try {
				ProductModel productModel = new ProductModel();
				productModel.setNames(rs.getString("name"));
				productModel.setBrand(rs.getString("brand"));
				productModel.setMade(rs.getString("made"));
				productModel.setDescription(rs.getString("description"));
				productModel.setAmount(rs.getInt("amount"));
				productModel.setPrice(rs.getLong("price"));
				productModel.setCategoryId(rs.getLong("categoryid"));
				comment.setProduct(productModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return comment;
		} catch (SQLException e) {
			return null;
		}
	}

}
