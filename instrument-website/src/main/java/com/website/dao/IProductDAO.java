package com.website.dao;

import java.util.List;

import com.website.model.ProductModel;
import com.website.paging.Pageble;

public interface IProductDAO extends GenericDAO<ProductModel> {
	ProductModel findOne(Long id);
	List<ProductModel> findAll(Pageble pageble);
	List<ProductModel> findAllProductBestSeller(String month);
	List<ProductModel> findAllProductBestSellerByYear(String year);
	List<ProductModel> findAllOrderByPeriodTime(String dateFrom,String dateTo);
	Long save(ProductModel productModel);
	void update(ProductModel updateProductModel);
	void delete(Long id);
	int getTotalItem();
//	List<ProductModel> findByCategoryId(Long categoryId);
}
