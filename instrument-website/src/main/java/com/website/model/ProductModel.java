package com.website.model;

import java.util.Collection;

public class ProductModel extends AbstractModel<ProductModel> {
	private String names;
	private String brand;
	private String made;
	private String description;
	private int amount;
	private Long price;
	private Long categoryId;
	private String categoryCode;
	private Collection<CommentModel> commentCollection;
	private PictureModel pictureModel;
	private ItemModel itemModel;
	

	public ItemModel getItemModel() {
		return itemModel;
	}
	public void setItemModel(ItemModel itemModel) {
		this.itemModel = itemModel;
	}
	public PictureModel getPictureModel() {
		return pictureModel;
	}
	public void setPictureModel(PictureModel pictureModel) {
		this.pictureModel = pictureModel;
	}
	public Collection<CommentModel> getCommentCollection() {
		return commentCollection;
	}
	public void setCommentCollection(Collection<CommentModel> commentCollection) {
		this.commentCollection = commentCollection;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
