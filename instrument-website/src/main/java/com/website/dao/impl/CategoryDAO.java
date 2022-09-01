package com.website.dao.impl;

import java.util.List;

import com.website.dao.ICategoryDAO;
import com.website.mapper.CategoryMapper;
import com.website.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(Long id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> list = query(sql, new CategoryMapper(),id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public CategoryModel findOneByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = ?";
		List<CategoryModel> list = query(sql, new CategoryMapper(),code);
		return list.isEmpty() ? null : list.get(0);
	}

}
