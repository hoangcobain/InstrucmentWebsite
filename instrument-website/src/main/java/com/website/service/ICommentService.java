package com.website.service;

import java.util.List;

import com.website.model.CommentModel;
import com.website.paging.Pageble;

public interface ICommentService {
	void save(CommentModel commentModel);
	List<CommentModel> findAllCommentByProductId(Long id,Pageble pageble);
	List<CommentModel> findAll(Pageble pageble);
	int getTotalComment();
	void delete(Long[] ids);
}
