package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ShuttleService {

	public void ShuttleInsert(BoardDTO boardDto) throws Exception;
	
	public List<BoardDTO> ShuttleList(PageDTO pageDto) throws Exception;
	
	public int ShuttlePageCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
	public BoardDTO ShuttlePasswordCheck(BoardDTO boardDto) throws Exception;
	
	public void ShuttleDelete(BoardDTO boardDto) throws Exception;
	
	public void ShuttleUpdate(BoardDTO boardDto) throws Exception;
	
}
