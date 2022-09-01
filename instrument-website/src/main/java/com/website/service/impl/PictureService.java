package com.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.website.dao.IPictureDAO;
import com.website.model.PictureModel;
import com.website.service.IPictureService;

public class PictureService implements IPictureService {
	
	@Inject
	private IPictureDAO pictureDAO;
	
	@Override
	public void save(String fileName,Long productId) {
		pictureDAO.save(fileName, productId);
	}

	@Override
	public List<PictureModel> findAll(Long id) {
		return pictureDAO.findAll(id);
	}

}
