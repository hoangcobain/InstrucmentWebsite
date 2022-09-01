package com.website.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.model.RoleModel;
import com.website.model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet rs) {
		try {
			UserModel user = new UserModel();
			user.setId(rs.getLong("id"));
			user.setUserName(rs.getString("username"));
			user.setFullName(rs.getString("fullname"));
			user.setPassword(rs.getString("password"));
			user.setStatus(rs.getInt("status"));
			user.setRoleId(rs.getLong("roleid"));
			user.setCreatedDate(rs.getTimestamp("createddate"));
			user.setCreatedBy(rs.getString("createdby"));
			if (rs.getTimestamp("modifiedDate") != null) {
				user.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			if (rs.getTimestamp("modifiedDate") != null) {
				user.setModifiedBy(rs.getString("modifiedby"));
			}
			try {
				RoleModel roleModel = new RoleModel();
				roleModel.setCode(rs.getString("code"));
				roleModel.setName(rs.getString("name"));
				user.setRole(roleModel);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return user;
		} catch (SQLException e) {
			return null;
		}
	}

}
