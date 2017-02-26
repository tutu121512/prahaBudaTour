package prahaBuda.tour.dao;

import java.util.List;
import prahaBuda.tour.dto.*;

public interface ManageBoardDao {

	public List<BoardDTO> ManageBoard(int curPage) throws Exception;

	public int ManageBoardCount( ) throws Exception;

	public List<BoardDTO> ManageSelectBoard(PageDTO pageDto, BoardDTO boardDTO) throws Exception;
	
	public int ManageSelectBoardCount(BoardDTO boardDTO ) throws Exception;
	
	public int manageBoardReply(BoardDTO boardDTO) throws Exception;
	
	public void manageBoardDelete(BoardDTO boardDTO) throws Exception;

	public BoardDTO manageSelect(BoardDTO boardDTO) throws Exception;
	
	public void manageUpdate(BoardDTO boardDTO) throws Exception;
}
