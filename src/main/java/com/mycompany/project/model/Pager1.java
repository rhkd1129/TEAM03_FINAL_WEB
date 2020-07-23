package com.mycompany.project.model;

public class Pager1 {
	private int totalRows1;		//전체 행 수
	private int totalPageNo1;	//전체 페이지 
	private int totalGroupNo1;	//전체 그룹 수
	private int startPageNo1;	//그룹의 시작 페이지 번호
	private int endPageNo1;		//그룹의 끝 페이지 번호
	private int groupNo1;		//현재 그룹 번호
	private int pageNo1;			//현재 페이지 번호
	private int pagesPerGroup1; 	//그룹 당 페이지 수
	private int rowsPerPage1;	//페이지 당 행 수
	
	public Pager1(int rowsPerPage1, int pagesPerGroup1, int totalRows1, int pageNo1) {
		this.rowsPerPage1 = rowsPerPage1;
		this.pagesPerGroup1 = pagesPerGroup1;
		this.totalRows1 = totalRows1;
		this.pageNo1 = pageNo1;
		
		totalPageNo1 = totalRows1/rowsPerPage1;
		if(totalRows1 % rowsPerPage1 != 0) totalPageNo1++;
		
		totalGroupNo1 = totalPageNo1 / pagesPerGroup1;
		if(totalPageNo1 % pagesPerGroup1 != 0) totalGroupNo1++;
		
		groupNo1 = (pageNo1 - 1) / pagesPerGroup1 + 1;
		
		startPageNo1 = (groupNo1 - 1) * pagesPerGroup1 + 1;
		endPageNo1 = startPageNo1 + pagesPerGroup1 - 1;
		if(groupNo1 == totalGroupNo1) endPageNo1 = totalPageNo1;
	}

	public int getTotalRows1() {
		return totalRows1;
	}

	public int getTotalPageNo1() {
		return totalPageNo1;
	}

	public int getTotalGroupNo1() {
		return totalGroupNo1;
	}

	public int getStartPageNo1() {
		return startPageNo1;
	}

	public int getEndPageNo1() {
		return endPageNo1;
	}

	public int getGroupNo1() {
		return groupNo1;
	}

	public int getPageNo1() {
		return pageNo1;
	}

	public int getPagesPerGroup1() {
		return pagesPerGroup1;
	}

	public int getRowsPerPage1() {
		return rowsPerPage1;
	}
}
