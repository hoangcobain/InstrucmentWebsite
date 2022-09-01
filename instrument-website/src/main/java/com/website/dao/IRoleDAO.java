package com.website.dao;

import java.util.List;

import com.website.model.RoleModel;

public interface IRoleDAO extends GenericDAO<RoleModel> {
	List<RoleModel> findAll();
	RoleModel findOne(Long id);
	RoleModel findOneByCode(String code);
}
