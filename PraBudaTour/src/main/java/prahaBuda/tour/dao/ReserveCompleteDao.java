package prahaBuda.tour.dao;

import java.util.List;
import prahaBuda.tour.dto.*;

public interface ReserveCompleteDao {

	public void reserveCompleteInsert(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
	public List<ReserveCompleteDTO> reserveCompleteCalendar() throws Exception;
	
	public List<ReserveCompleteDTO> reserveCompleteBoard(int curPage) throws Exception;
	
	public int reserveCompleteBoardCount() throws Exception;
	
	public void reserveCompleteUpdate(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
	public void reserveCompleteDelete(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
}
