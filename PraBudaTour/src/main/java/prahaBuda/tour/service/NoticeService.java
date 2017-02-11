package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface NoticeService {

	public void NoticeInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> NoticeList(PageDTO pageDto);

	public BoardDTO NoticePasswordCheck(BoardDTO boardDto);

	public void NoticeDelete(BoardDTO boardDto);

	public void NoticeUpdate(BoardDTO boardDto);
	
	
}
