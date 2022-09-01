package com.website.dao;

import java.util.List;

import com.website.model.CommentModel;
import com.website.paging.Pageble;

public interface ICommentDAO extends GenericDAO<CommentModel>  {
	CommentModel findOne(Long id);
	Long save(CommentModel commentModel);
	List<CommentModel> findAllCommentByProductId(Long id,Pageble pageble);
	List<CommentModel> findAll(Pageble pageble);
	int getTotalComment();
	void delete(Long id);
}
