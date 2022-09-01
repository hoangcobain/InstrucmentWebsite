package com.website.service;

import java.util.List;

import com.website.model.ProductModel;
import com.website.paging.Pageble;

public interface IProductService {
	ProductModel findOne(long id);
	List<ProductModel> findAllProductBestSeller(String month);
	List<ProductModel> findAllProductBestSellerByYear(String year);
	List<ProductModel> findAllOrderByPeriodTime(String dateFrom, String dateTo);
	List<ProductModel> findAll(Pageble pageble);
	Long save(ProductModel productModel);
	ProductModel update(ProductModel updateProductModel);
	void delete(Long[] ids);
	int getTotalItem();
//	List<ProductModel> findByCategoryId(Long categoryId);
}
