package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.BoardDTO;

public interface TourInfoDao {

	//이용혜택 insert
	public void tourInfoInsert(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 update
	public void tourInfoUpdate(BoardDTO boardDTO) throws Exception;

	//이용혜택 delete
	public void tourInfoDelete(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 selectList
	public List<BoardDTO> tourInfoSelect(BoardDTO boardDTO) throws Exception;
	
}
