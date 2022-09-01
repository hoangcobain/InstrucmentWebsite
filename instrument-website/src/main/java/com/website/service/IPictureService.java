package com.website.service;

import java.util.List;

import com.website.model.PictureModel;

public interface IPictureService {
	void save(String fileName,Long productId);
	List<PictureModel> findAll(Long id);
}
