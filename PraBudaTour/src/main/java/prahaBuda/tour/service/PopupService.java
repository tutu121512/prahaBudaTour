package prahaBuda.tour.service;

import java.util.List;

import prahaBuda.tour.dto.*;

public interface PopupService {

	public void popupInsert(PopupDTO popupDTO) throws Exception;
	
	public PopupDTO popup() throws Exception;
	
	public void popupDelete(PopupDTO popupDTO) throws Exception;
	
	public List<PopupDTO> popupList() throws Exception;
}
