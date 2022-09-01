package com.website.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.website.dao.ICategoryDAO;
import com.website.dao.IProductDAO;
import com.website.model.CategoryModel;
import com.website.model.ProductModel;
import com.website.paging.Pageble;
import com.website.service.IProductService;

public class ProductService implements IProductService {
	
	@Inject
	private IProductDAO productDAO;
	
	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		return productDAO.findAll(pageble);
	}

	@Override
	public Long save(ProductModel productModel) {
		Long productId = null;
		try {
			productModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
			CategoryModel categoryModel = categoryDAO.findOneByCode(productModel.getCategoryCode());
			productModel.setCategoryId(categoryModel.getId());
			productId = productDAO.save(productModel);
		} catch (Exception e) {
			System.out.print("Phải chọn thể loại");
		}
		return productId;
	}

	@Override
	public ProductModel update(ProductModel updateProductModel) {
		ProductModel oldProduct = productDAO.findOne(updateProductModel.getId());
		updateProductModel.setCreatedDate(oldProduct.getCreatedDate());
		updateProductModel.setCreatedBy(oldProduct.getCreatedBy());
		updateProductModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel categoryModel = categoryDAO.findOneByCode(updateProductModel.getCategoryCode());
		updateProductModel.setCategoryId(categoryModel.getId());
		productDAO.update(updateProductModel);
		return productDAO.findOne(updateProductModel.getId());
	}

	@Override
	public void delete(Long[] ids) {
		for (long id : ids) {
//			delete comment trc (khoa ngoai)
			productDAO.delete(id);
		}
	}

	@Override
	public int getTotalItem() {
		return productDAO.getTotalItem();
	}

	@Override
	public ProductModel findOne(long id) {
		ProductModel productModel = productDAO.findOne(id);
		CategoryModel categoryModel = categoryDAO.findOne(productModel.getCategoryId());
		productModel.setCategoryCode(categoryModel.getCode());
		return productModel;
	}

	@Override
	public List<ProductModel> findAllProductBestSeller(String month) {
		return productDAO.findAllProductBestSeller(month);
	}

	@Override
	public List<ProductModel> findAllProductBestSellerByYear(String year) {
		return productDAO.findAllProductBestSellerByYear(year);
	}

	@Override
	public List<ProductModel> findAllOrderByPeriodTime(String dateFrom, String dateTo) {
		return productDAO.findAllOrderByPeriodTime(dateFrom, dateTo);
	}

	
	/*
	 * @Override public List<ProductModel> findByCategoryId(Long categoryId) {
	 * return productDAO.findByCategoryId(categoryId); }
	 */

}
