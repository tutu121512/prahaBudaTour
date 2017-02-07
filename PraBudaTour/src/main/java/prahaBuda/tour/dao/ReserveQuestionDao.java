package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ReserveQuestionDao {

	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> ReserveQuestionSelect() throws Exception;

}
