package com.website.dao.impl;

import java.util.List;

import com.website.dao.IItemDAO;
import com.website.mapper.ItemMapper;
import com.website.model.ItemModel;

public class ItemDAO extends AbstractDAO<ItemModel> implements IItemDAO {

	@Override
	public Long save(ItemModel itemModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO item(quantity,price,");
		sql.append("productid,orderid)");
		sql.append(" VALUES(?, ?, ?, ?)");
		return insert(sql.toString(),itemModel.getQuantity(),itemModel.getPrice(),
				itemModel.getProductId(),itemModel.getOrderId());
	}

	@Override
	public List<ItemModel> findByOrderId(Long orderId) {
		String sql = "SELECT * FROM item AS i INNER JOIN product as p ON p.id=i.productid WHERE i.orderid = ?";
		return query(sql, new ItemMapper(),orderId);
	}

}
