package com.website.dao.impl;

import java.util.List;

import com.website.dao.IUserDAO;
import com.website.mapper.UserMapper;
import com.website.model.UserModel;
import com.website.paging.Pageble;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u ");
		sql.append(" INNER JOIN role AS r ON r.id=u.roleid ");
		sql.append("  WHERE username = ? AND password = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName,password);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u ");
		sql.append(" INNER JOIN role AS r ON r.id=u.roleid ");
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		} 
		return query(sql.toString(), new UserMapper());
	}

	@Override
	public UserModel findOne(Long id) {
//		String sql = "SELECT * FROM user WHERE id = ?";
		String sql = "SELECT * FROM user AS u INNER JOIN role AS r ON r.id=u.roleid WHERE u.id = ?";
		List<UserModel> users = query(sql, new UserMapper(), id);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public int getTotalUser() {
		String sql = "SELECT count(*) FROM user";
		return count(sql, new UserMapper());
	}

	@Override
	public Long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO user(username,password,");
		sql.append("fullname,status,roleid,createddate,createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ? ,?)");
		return insert(sql.toString(), userModel.getUserName(),userModel.getPassword(),userModel.getFullName(),
					userModel.getStatus(),userModel.getRoleId(),userModel.getCreatedDate(),userModel.getCreatedBy());
	}

	@Override
	public void update(UserModel updateUserModel) {
		StringBuilder sql = new StringBuilder("UPDATE user SET username = ? , password = ?, ");
		sql.append(" fullname = ?, status = ? , roleid = ?, ");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateUserModel.getUserName(),updateUserModel.getPassword(),updateUserModel.getFullName(),
				updateUserModel.getStatus(),updateUserModel.getRoleId(),updateUserModel.getCreatedDate(),updateUserModel.getCreatedBy(),
				updateUserModel.getModifiedDate(),updateUserModel.getModifiedBy(),updateUserModel.getId());
		
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM user WHERE id = ? ";
		update(sql, id);		
	}

}
