package prahaBuda.tour.dto;

public class PageDTO {
	
	private int curPage;		//현재 페이지3
	private int startPage;		//시작페이지 
	private int endPage;		//끝 페이지 
	private int previPage;		//전 페이지 
	private int nextPage;		//후 페이지 
	private int count;			//전체 페이지 38

	 public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPreviPage() {
		return previPage;
	}
	public void setPreviPage(int previPage) {
		this.previPage = previPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
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
	
	
}
