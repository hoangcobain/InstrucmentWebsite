package com.website.dao;

import java.util.List;

import com.website.model.UserModel;
import com.website.paging.Pageble;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findByUserNameAndPasswordAndStatus(String userName,String password);
	List<UserModel> findAll(Pageble pageble);
	Long save(UserModel userModel);
	void update(UserModel updateUserModel);
	void delete(Long id);
	UserModel findOne(Long id);
	int getTotalUser();
}
