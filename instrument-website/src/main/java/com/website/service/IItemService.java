package com.website.service;

import java.util.List;

import com.website.model.ItemModel;

public interface IItemService {
	void save(ItemModel itemModel);
	List<ItemModel> findByOrderId(Long orderId);
}
