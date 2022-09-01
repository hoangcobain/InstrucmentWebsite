package com.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.website.dao.ICommentDAO;
import com.website.model.CommentModel;
import com.website.paging.Pageble;
import com.website.service.ICommentService;

public class CommentService implements ICommentService {
	
	@Inject
	private ICommentDAO commentDAO;

	@Override
	public List<CommentModel> findAllCommentByProductId(Long id,Pageble pageble) {
		return commentDAO.findAllCommentByProductId(id,pageble);
	}

	@Override
	public void save(CommentModel commentModel) {
		commentDAO.save(commentModel);
	}

	@Override
	public List<CommentModel> findAll(Pageble pageble) {
		return commentDAO.findAll(pageble);
	}

	@Override
	public int getTotalComment() {
		return commentDAO.getTotalComment();
	}

	@Override
	public void delete(Long[] ids) {
		for (long id : ids) {
			commentDAO.delete(id);
		}
	}

}
