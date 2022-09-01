package com.website.dao.impl;

import java.util.List;

import com.website.dao.IPictureDAO;
import com.website.mapper.PictureMapper;
import com.website.model.PictureModel;

public class PictureDAO extends AbstractDAO<PictureModel> implements IPictureDAO {

	@Override
	public Long save(String fileName,Long productId) {
		String sql = "insert into picture(picture,productid) values (?, ?)";
		return insert(sql, fileName,productId);
	}

	@Override
	public PictureModel findOne(Long id) {
		String sql = "SELECT * FROM picture WHERE id = ?";
		List<PictureModel> pictures = query(sql, new PictureMapper(), id);
		return pictures.isEmpty() ? null : pictures.get(0);
	}

	@Override
	public List<PictureModel> findAll(Long id) {
		String sql = "SELECT * FROM picture WHERE productid = ?";
		return query(sql, new PictureMapper(),id);
	}

}
