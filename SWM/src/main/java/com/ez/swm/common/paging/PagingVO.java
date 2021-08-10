package com.ez.swm.common.paging;

public class PagingVO {
	
	public PagingVO() {
	}
	
	// ����������, ����������, ��������, �Խñ� �� ����, �������� �� ����, ������������, SQL������ �� start, end
	private int nowPage, startPage, endPage, total, lastPage, start, end;
	

	//1,2,3,4,5
	private int cntPage = 3;
	
	//�������� �۰���
	private int cntPerPage = 3;

	public PagingVO(int total, int nowPage) {
		setNowPage(nowPage);
		setTotal(total);
		
		// ������������ = ��ü�۰���/���������� ������ �۰���
		calcLastPage(getTotal(), cntPerPage);
		
		// ������ ����, �� ������ ���
		calcStartEndPage(getNowPage(), cntPage);
		
		// DB �������� ����� start, end�� ���
		calcStartEnd(getNowPage(), cntPerPage);
	}

	// ���� ������ ������ ��� (ceil : �ø���)
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// ������ ����, �� ������ ���
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB �������� ����� start, end�� ���
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}	
	public int setCntPage() {
		return cntPage;
	}
	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", lastPage=" + lastPage + ", start=" + start + ", end=" + end + ", cntPage=" + cntPage
				+ ", cntPerPage=" + cntPerPage + "]";
	}
	
}
