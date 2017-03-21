package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

public interface TourInfoService {

	//여행정보 insert
	public void tourInfoInsert(BoardDTO boardDTO) throws Exception;
	
	//여행정보 update
	public void tourInfoUpdate(BoardDTO boardDTO) throws Exception;

	//여행정보 delete
	public void tourInfoDelete(BoardDTO boardDTO) throws Exception;
	
	//여행정보 selectList
	public List<BoardDTO> tourInfoSelect(BoardDTO boardDto) throws Exception;

}
