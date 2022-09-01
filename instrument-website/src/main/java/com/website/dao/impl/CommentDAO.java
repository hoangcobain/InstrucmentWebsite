package com.website.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.website.dao.ICommentDAO;
import com.website.mapper.CommentMapper;
import com.website.mapper.OrderMapper;
import com.website.model.CommentModel;
import com.website.paging.Pageble;

public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO {

	@Override
	public List<CommentModel> findAllCommentByProductId(Long id, Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM comment WHERE productid = ?");
		if(pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		return query(sql.toString(), new CommentMapper(), id);
	}

	@Override
	public Long save(CommentModel commentModel) {
		StringBuilder sql = new StringBuilder("insert into comment(content,userid,");
		sql.append("productid,createddate,createdby,modifieddate,modifiedby)");
		sql.append("values(?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), commentModel.getContent(),commentModel.getUserId(),
				commentModel.getProductId(),commentModel.getCreatedDate(),commentModel.getCreatedBy(),
				commentModel.getModifiedDate(),commentModel.getModifiedBy());
	}

	@Override
	public CommentModel findOne(Long id) {
		String sql = "SELECT * FROM comment WHERE id = ? ORDER BY createddate desc";
		List<CommentModel> comments = query(sql, new CommentMapper(), id);
		return comments.isEmpty() ? null : comments.get(0);
	}

	@Override
	public List<CommentModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM comment AS c INNER JOIN product AS p ON p.id = c.productid ");
		if(pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		} 
		return query(sql.toString(), new CommentMapper());
	}

	@Override
	public int getTotalComment() {
		String sql = "SELECT count(*) FROM comment";
		return count(sql, new OrderMapper());
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM comment WHERE id = ? ";
		update(sql, id);	
	}

}
