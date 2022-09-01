package com.website.paging;

import com.website.sort.Sorter;

public class PageRequest implements Pageble {
	
	private Integer page;
	private Integer maxPageItem;
	private Sorter sorter;
	
	
	
	public PageRequest(Integer page, Integer maxPageItem, Sorter sorter) {
		super();
		this.page = page;
		this.maxPageItem = maxPageItem;
		this.sorter = sorter;
	}
	
	
	
	

	public PageRequest(Sorter sorter) {
		super();
		this.sorter = sorter;
	}





	public PageRequest(Integer page, Integer maxPageItem) {
		super();
		this.page = page;
		this.maxPageItem = maxPageItem;
	}
	
	public PageRequest() {
		super();
	}



	@Override
	public Integer getPage() {
		return this.page;
	}

	@Override
	public Integer getOffset() {
		if(this.page != null && this.maxPageItem != null) {
			return (this.page - 1) * this.maxPageItem;
		}else
			return null;
	}

	@Override
	public Integer getLimit() {
		return this.maxPageItem;
	}

	@Override
	public Sorter getSorter() {
		if(this.sorter != null)
			return this.sorter;
		return null;
	}

}
