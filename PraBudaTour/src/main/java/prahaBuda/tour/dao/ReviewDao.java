package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReviewDao {

	public void ReviewInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> ReviewList(int curPage) throws Exception;

	public int ReviewListCount() throws Exception;
	
	public BoardDTO prahaReviewPasswordCheck(BoardDTO boardDto) throws Exception;

	public void prahaReviewDelete(BoardDTO boardDto) throws Exception;
	
	public void prahaReviewUpdate(BoardDTO boardDto) throws Exception;

}
