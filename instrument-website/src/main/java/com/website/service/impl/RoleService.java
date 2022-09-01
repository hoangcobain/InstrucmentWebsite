package com.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.website.dao.IRoleDAO;
import com.website.model.RoleModel;
import com.website.service.IRoleService;

public class RoleService implements IRoleService {
	
	@Inject
	private IRoleDAO roleDAO;

	@Override
	public List<RoleModel> findAll() {
		return roleDAO.findAll();
	}

	@Override
	public RoleModel findOne(Long id) {
		return roleDAO.findOne(id);
	}

}
