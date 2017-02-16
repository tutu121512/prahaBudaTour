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
	public List<BoardDTO> tourInfoSelect(PageDTO pageDto) throws Exception;
	
	//여행정보 selectView
	public List<BoardDTO> tourInfoView(BoardDTO boardDTO) throws Exception;
	
	//여행정보 selectListCount
	public int tourInfoSelectCount() throws Exception;

	//여행정보 Paging
	public PageDTO paging(PageDTO pageDto) throws Exception;

}
