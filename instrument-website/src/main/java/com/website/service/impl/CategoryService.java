package com.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.website.dao.ICategoryDAO;
import com.website.model.CategoryModel;
import com.website.service.ICategoryService;

public class CategoryService implements ICategoryService {
	
	@Inject
	private ICategoryDAO categoryDAO; 
	
	@Override
	public List<CategoryModel> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public CategoryModel findOne(Long id) {
		return categoryDAO.findOne(id);
	}

}
