package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

public interface NoticeDao {
	
	public void NoticeInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> NoticeList(int curPage);

	public BoardDTO NoticeView(BoardDTO boardDto);

	public void NoticeDelete(BoardDTO boardDto);

	public void NoticeUpdate(BoardDTO boardDto);
	
	public int NoticeListCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
	public List<BoardDTO> popupNoticeList() throws Exception;
}
