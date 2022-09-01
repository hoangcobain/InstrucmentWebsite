package com.website.service;

import java.util.List;

import com.website.model.RoleModel;

public interface IRoleService {
	List<RoleModel> findAll();
	RoleModel findOne(Long id);
}
