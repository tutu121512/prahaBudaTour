package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReserveQuestionService {

	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception;
	
	public List<BoardDTO> ReserveQuestionList(PageDTO pageDto) throws Exception;
	
	public int ReserveQuestionPageCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
	public BoardDTO prahaReservePasswordCheck(BoardDTO boardDto) throws Exception;
	
	public void prahaReserveDelete(BoardDTO boardDto) throws Exception;
	
	public void prahaReserveUpdate(BoardDTO boardDto) throws Exception;
}
