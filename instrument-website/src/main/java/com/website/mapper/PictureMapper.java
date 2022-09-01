package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.PictureModel;

public class PictureMapper implements RowMapper<PictureModel> {

	@Override
	public PictureModel mapRow(ResultSet rs) {
		try {
			PictureModel pictureModel = new PictureModel();
			pictureModel.setId(rs.getLong("id"));
			pictureModel.setPicture(rs.getString("picture"));
			pictureModel.setProductId(rs.getLong("productid"));
			return pictureModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
