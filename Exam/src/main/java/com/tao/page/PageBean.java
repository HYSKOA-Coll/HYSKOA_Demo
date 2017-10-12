package com.tao.page;

import java.util.List;
import java.util.Map;

/**
 * Created by hxj on 17-7-24.
 */
public class PageBean<T>{

    private int pageNow = 1;
    private int pageCount = 5;
    private int totalRows;
    private int totalPages;
    private int start;
    private List<T> datas;
    private Condition conditions;
    private Map<String,Object> params;
    private String major_name;
    private Map<String, Object> conditions2 ;
    

    public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}

	public int getPageNow() {
        return pageNow;
    }

    public int getPageCount() {
        return pageCount;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public int getStart() {
        return (pageNow-1)*pageCount;
    }

    public int getTotalPages() {
        if(totalRows%pageCount==0){
            totalPages = totalRows/pageCount;
        }else{
            totalPages = totalRows/pageCount+1;
        }
        return totalPages;
    }

    public List<T> getDatas() {
        return datas;
    }

    public Condition getConditions() {
        return conditions;
    }
    public Map<String, Object> getParams() {
		return params;
	}

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

    public void setConditions(Condition conditions) {
        this.conditions = conditions;
    }
    public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public Map<String, Object> getConditions2() {
		return conditions2;
	}

	public void setConditions2(Map<String, Object> conditions2) {
		this.conditions2 = conditions2;
	}

	@Override
	public String toString() {
		return "PageBean [pageNow=" + pageNow + ", pageCount=" + pageCount + ", totalRows=" + totalRows
				+ ", totalPages=" + totalPages + ", start=" + start + ", datas=" + datas + ", conditions=" + conditions
				+ ", params=" + params + "]";
	}
 
}