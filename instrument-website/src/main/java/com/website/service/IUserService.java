package com.website.service;

import java.util.List;

import com.website.model.UserModel;
import com.website.paging.Pageble;

public interface IUserService {
	UserModel findByUserNameAndPasswordAndStatus(String userName,String password);
	List<UserModel> findAll(Pageble pageble);
	UserModel save(UserModel userModel);
	UserModel update(UserModel updateUserModel);
	void delete(Long[] ids);
	UserModel findOne(Long id);
	int getTotalUser();
}
