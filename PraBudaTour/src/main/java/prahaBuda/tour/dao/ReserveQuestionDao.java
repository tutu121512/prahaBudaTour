package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReserveQuestionDao {

	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> ReserveQuestionList(int curPage) throws Exception;

	public int ReserveQuestionListCount() throws Exception;
	
	public BoardDTO prahaReservePasswordCheck(BoardDTO boardDto) throws Exception;

	public void prahaReserveDelete(BoardDTO boardDto) throws Exception;
	
	public void prahaReserveUpdate(BoardDTO boardDto) throws Exception;
}
