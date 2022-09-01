package com.website.dao;

import java.util.List;

import com.website.model.ItemModel;

public interface IItemDAO extends GenericDAO<ItemModel> {
	Long save(ItemModel itemModel);
	List<ItemModel> findByOrderId(Long orderId);
}
