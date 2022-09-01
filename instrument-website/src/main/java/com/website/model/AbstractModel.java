package com.website.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AbstractModel<T> {
	private Long id;
	private Timestamp createdDate;
	private Timestamp modifiedDate;
	private String createdBy;
	private String modifiedBy;
	private Long[] ids;
	private List<T> listResult = new ArrayList<>();
	private List<T> listResultWithDate = new ArrayList<>();
	private List<T> listResultWithMonth = new ArrayList<>();
	private List<T> listResultWithYear = new ArrayList<>();
	private List<T> listResultWithPeriodTime = new ArrayList<>();
	private Integer page;
	private Integer maxPageItem;
	private Integer totalPage;
	private Integer totalItem;
	private String sortName;
	private String sortBy;
	private String type;
	private String statisticDate;
	private String statisticDateFrom;
	private String statisticDateTo;
	
	
	
	public String getStatisticDateFrom() {
		return statisticDateFrom;
	}
	public void setStatisticDateFrom(String statisticDateFrom) {
		this.statisticDateFrom = statisticDateFrom;
	}
	public String getStatisticDateTo() {
		return statisticDateTo;
	}
	public void setStatisticDateTo(String statisticDateTo) {
		this.statisticDateTo = statisticDateTo;
	}
	
	public List<T> getListResultWithPeriodTime() {
		return listResultWithPeriodTime;
	}
	public void setListResultWithPeriodTime(List<T> listResultWithPeriodTime) {
		this.listResultWithPeriodTime = listResultWithPeriodTime;
	}
	public List<T> getListResultWithDate() {
		return listResultWithDate;
	}
	public void setListResultWithDate(List<T> listResultWithDate) {
		this.listResultWithDate = listResultWithDate;
	}
	public List<T> getListResultWithMonth() {
		return listResultWithMonth;
	}
	public void setListResultWithMonth(List<T> listResultWithMonth) {
		this.listResultWithMonth = listResultWithMonth;
	}
	public List<T> getListResultWithYear() {
		return listResultWithYear;
	}
	public void setListResultWithYear(List<T> listResultWithYear) {
		this.listResultWithYear = listResultWithYear;
	}
	public String getStatisticDate() {
		return statisticDate;
	}
	public void setStatisticDate(String statisticDate) {
		this.statisticDate = statisticDate;
	}
	public Long[] getIds() {
		return ids;
	}
	public void setIds(Long[] ids) {
		this.ids = ids;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxPageItem() {
		return maxPageItem;
	}
	public void setMaxPageItem(Integer maxPageItem) {
		this.maxPageItem = maxPageItem;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(Integer totalItem) {
		this.totalItem = totalItem;
	}
	public List<T> getListResult() {
		return listResult;
	}
	public void setListResult(List<T> listResult) {
		this.listResult = listResult;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Timestamp getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	
	
}
