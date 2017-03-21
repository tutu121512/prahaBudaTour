package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.BoardDTO;

public interface UserBenefitDao {

	//이용혜택 insert
	public void serviceInsert(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 update
	public void serviceUpdate(BoardDTO boardDTO) throws Exception;

	//이용혜택 delete
	public void serviceDelete(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 selectList
	public List<BoardDTO> serviceSelect(BoardDTO boardDTO) throws Exception;
	
}
