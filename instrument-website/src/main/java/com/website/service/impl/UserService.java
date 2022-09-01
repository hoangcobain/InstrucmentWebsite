package com.website.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.website.dao.IRoleDAO;
import com.website.dao.IUserDAO;
import com.website.model.RoleModel;
import com.website.model.UserModel;
import com.website.paging.Pageble;
import com.website.service.IUserService;

public class UserService implements IUserService {
	
	@Inject
	private IUserDAO userDAO;
	
	@Inject
	private IRoleDAO roleDAO;
	
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password);
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		return userDAO.findAll(pageble);
	}

	@Override
	public UserModel findOne(Long id) {
		UserModel userModel = userDAO.findOne(id);
		RoleModel roleModel = roleDAO.findOne(userModel.getRoleId());
		userModel.setRoleCode(roleModel.getCode());
		return userModel;
	}

	@Override
	public int getTotalUser() {
		return userDAO.getTotalUser();
	}

	@Override
	public UserModel save(UserModel userModel) {
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		RoleModel roleModel = roleDAO.findOneByCode(userModel.getRoleCode());
		userModel.setRoleId(roleModel.getId());
		Long userId = userDAO.save(userModel);
		return userDAO.findOne(userId);
	}

	@Override
	public UserModel update(UserModel updateUserModel) {
		UserModel oldUser = userDAO.findOne(updateUserModel.getId());
		updateUserModel.setCreatedDate(oldUser.getCreatedDate());
		updateUserModel.setCreatedBy(oldUser.getCreatedBy());
		updateUserModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		RoleModel roleModel = roleDAO.findOneByCode(updateUserModel.getRoleCode());
		updateUserModel.setRoleId(roleModel.getId());
		userDAO.update(updateUserModel);
		return userDAO.findOne(updateUserModel.getId());
	}

	@Override
	public void delete(Long[] ids) {
		for (long id : ids) {
//			delete comment trc (khoa ngoai)
			userDAO.delete(id);
		}
	}

}
