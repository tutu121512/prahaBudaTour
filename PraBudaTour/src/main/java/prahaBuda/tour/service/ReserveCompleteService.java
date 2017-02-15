package prahaBuda.tour.service;

import java.util.List;
import prahaBuda.tour.dto.*;

public interface ReserveCompleteService {

	public void reserveCompleteInsert(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
	public List<ReserveCompleteDTO> reserveCompleteCalendar() throws Exception;
	
	public List<ReserveCompleteDTO> reserveCompleteBoard(PageDTO pageDto) throws Exception;
	
	public int reserveCompleteBoardCount() throws Exception;
	
	public PageDTO paging(PageDTO pageDto) throws Exception;
	
	public void reserveCompleteUpdate(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
	public void reserveCompleteDelete(ReserveCompleteDTO reserveCompleteDTO) throws Exception;
	
}
