package com.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.website.dao.IItemDAO;
import com.website.model.ItemModel;
import com.website.service.IItemService;

public class ItemService implements IItemService {
	
	@Inject
	private IItemDAO iItemDAO;

	@Override
	public void save(ItemModel itemModel) {
		iItemDAO.save(itemModel);
	}

	@Override
	public List<ItemModel> findByOrderId(Long orderId) {
		return iItemDAO.findByOrderId(orderId);
	}

}
