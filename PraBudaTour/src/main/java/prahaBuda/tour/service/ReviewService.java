package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReviewService {

	public void ReviewInsert(BoardDTO boardDto) throws Exception;
	
	public List<BoardDTO> ReviewList(PageDTO pageDto) throws Exception;
	
	public int ReviewPageCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
	public BoardDTO prahaReviewView(BoardDTO boardDto) throws Exception;
	
	public void ReviewDelete(BoardDTO boardDto) throws Exception;
	
	public void ReviewUpdate(BoardDTO boardDto) throws Exception;
	
}
