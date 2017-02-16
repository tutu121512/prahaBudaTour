package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

public interface UserBenefitService {

	//이용혜택 insert
	public void serviceInsert(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 update
	public void serviceUpdate(BoardDTO boardDTO) throws Exception;

	//이용혜택 delete
	public void serviceDelete(BoardDTO boardDTO) throws Exception;
	
	//이용혜택 selectList
	public List<BoardDTO> serviceSelect() throws Exception;
	
	//이용혜택 selectView
	public List<BoardDTO> serviceView(BoardDTO boardDTO) throws Exception;
	

}
