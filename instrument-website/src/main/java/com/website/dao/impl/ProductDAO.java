package com.website.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.website.dao.IProductDAO;
import com.website.mapper.ProductMapper;
import com.website.model.ProductModel;
import com.website.paging.Pageble;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO  {
	
	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM product as p inner join picture as pi on pi.productid=p.id");
		if(pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		} 
		return query(sql.toString(), new ProductMapper());
	}

	@Override
	public Long save(ProductModel productModel) {
		StringBuilder sql = new StringBuilder("insert into product(name,brand,");
		sql.append("made,description,amount,price,categoryid,createddate,createdby)");
		sql.append("values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), productModel.getNames(),productModel.getBrand(),productModel.getMade(),
						productModel.getDescription(),productModel.getAmount(),productModel.getPrice(),
						productModel.getCategoryId(),productModel.getCreatedDate(),productModel.getCreatedBy());
	}

	@Override
	public ProductModel findOne(Long id) {
		String sql = "SELECT * FROM product AS p INNER JOIN picture AS pi on p.id = pi.productid WHERE p.id = ?";
		List<ProductModel> products = query(sql, new ProductMapper(), id);
		return products.isEmpty() ? null : products.get(0);
	}

	@Override
	public void update(ProductModel updateProductModel) {
		StringBuilder sql = new StringBuilder("UPDATE product SET name = ?, brand = ?, ");
		sql.append(" made = ?, description = ?, amount = ?,price = ?,categoryid = ?, ");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateProductModel.getNames(),updateProductModel.getBrand(),updateProductModel.getMade(),
				updateProductModel.getDescription(),updateProductModel.getAmount(),updateProductModel.getPrice(),
				updateProductModel.getCategoryId(),updateProductModel.getCreatedDate(),updateProductModel.getCreatedBy(),
				updateProductModel.getModifiedDate(),updateProductModel.getModifiedBy(),updateProductModel.getId());
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM product WHERE id = ? ";
		update(sql, id);		
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM product";
		return count(sql, new ProductMapper());
	}

	@Override
	public List<ProductModel> findAllProductBestSeller(String month) {
		StringBuilder sql = new StringBuilder("SELECT *, Sum(i.quantity) AS SL,DATE_FORMAT(createddate, \"%Y-%m\") AS date ");
		sql.append("  FROM product p, item i WHERE p.id=i.productid and DATE_FORMAT(createddate, \"%Y-%m\") = ?  GROUP BY p.id ");
		sql.append(" ORDER BY Sum(i.quantity) DESC");
		return query(sql.toString(), new ProductMapper(),month);
	}

	@Override
	public List<ProductModel> findAllProductBestSellerByYear(String year) {
		StringBuilder sql = new StringBuilder("SELECT *, Sum(i.quantity) AS SL,DATE_FORMAT(createddate, \"%Y\") AS date ");
		sql.append("  FROM product p, item i WHERE p.id=i.productid and DATE_FORMAT(createddate, \"%Y\") = ?  GROUP BY p.id ");
		sql.append(" ORDER BY Sum(i.quantity) DESC");
		return query(sql.toString(), new ProductMapper(),year);
	}

	@Override
	public List<ProductModel> findAllOrderByPeriodTime(String dateFrom, String dateTo) {
		StringBuilder sql = new StringBuilder("SELECT *, Sum(i.quantity) AS SL,DATE_FORMAT(createddate, \"%Y-%m-%d\") AS date ");
		sql.append("  FROM product p, item i WHERE p.id=i.productid and DATE_FORMAT(createddate, \"%Y-%m-%d\") and DATE_FORMAT(createddate, \"%Y-%m-%d\") between ? and ? ");
		sql.append(" GROUP BY p.id ORDER BY Sum(i.quantity) DESC");
		return query(sql.toString(), new ProductMapper(),dateFrom,dateTo);
	}


	/*
	 * @Override public List<ProductModel> findByCategoryId(Long categoryId) {
	 * String sql = "SELECT * FROM product WHERE categoryid = ?"; return query(sql,
	 * new ProductMapper(), null) }
	 */
		
}
