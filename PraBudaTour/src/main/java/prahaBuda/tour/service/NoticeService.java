package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface NoticeService {

	public void NoticeInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> NoticeList(PageDTO pageDto) throws Exception;

	public BoardDTO NoticeView(BoardDTO boardDto)throws Exception;

	public void NoticeDelete(BoardDTO boardDto)throws Exception;

	public void NoticeUpdate(BoardDTO boardDto)throws Exception;
	
	public int NoticeListCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
}
