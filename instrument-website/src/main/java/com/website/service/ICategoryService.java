package com.website.service;

import java.util.List;

import com.website.model.CategoryModel;

public interface ICategoryService {
	List<CategoryModel> findAll();
	CategoryModel findOne(Long id);
}
