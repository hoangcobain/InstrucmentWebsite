package com.website.dao.impl;

import java.util.List;

import com.website.dao.IRoleDAO;
import com.website.mapper.RoleMapper;
import com.website.model.RoleModel;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO {

	@Override
	public List<RoleModel> findAll() {
		String sql = "SELECT * FROM role";
		return query(sql, new RoleMapper());
	}

	@Override
	public RoleModel findOne(Long id) {
		String sql = "SELECT * FROM role WHERE id = ?";
		List<RoleModel> list = query(sql, new RoleMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public RoleModel findOneByCode(String code) {
		String sql = "SELECT * FROM role WHERE code = ?";
		List<RoleModel> list = query(sql, new RoleMapper(),code);
		return list.isEmpty() ? null : list.get(0);
	}

}
