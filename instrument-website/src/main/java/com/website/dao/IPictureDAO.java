package com.website.dao;

import java.util.List;

import com.website.model.PictureModel;

public interface IPictureDAO extends GenericDAO<PictureModel> {
	Long save(String fileName,Long productId);
	PictureModel findOne(Long id);
	List<PictureModel> findAll(Long id);
}
