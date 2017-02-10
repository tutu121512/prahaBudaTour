package prahaBuda.tour.dao;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface ShuttleDao {

	public void ShuttleInsert(BoardDTO boardDto) throws Exception;

	public List<BoardDTO> ShuttleList(int curPage) throws Exception;

	public int ShuttleListCount() throws Exception;
	
	public BoardDTO prahaShuttlePasswordCheck(BoardDTO boardDto) throws Exception;

	public void prahaShuttleDelete(BoardDTO boardDto) throws Exception;
	
	public void prahaShuttleUpdate(BoardDTO boardDto) throws Exception;

}
