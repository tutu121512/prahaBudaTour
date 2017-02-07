package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReserveQuestionService {

	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception;
	
	public List<BoardDTO> ReserveQuestionSelect() throws Exception;
	
}
