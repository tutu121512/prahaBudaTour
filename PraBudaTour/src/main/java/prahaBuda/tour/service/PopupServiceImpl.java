package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prahaBuda.tour.dto.PopupDTO;
import prahaBuda.tour.dao.*;

@Service
public class PopupServiceImpl implements PopupService {

	@Autowired
	private PopupDao PopupDao;
	
	@Override
	public void popupInsert(PopupDTO popupDTO) throws Exception {
		PopupDao.popupInsert(popupDTO);
	}

	@Override
	public PopupDTO popup() throws Exception {
		return PopupDao.popup();
	}

	@Override
	public List<PopupDTO> popupList() throws Exception {
		return null;
	}

	@Override
	public void popupDelete(PopupDTO popupDTO) throws Exception {
		PopupDao.popupDelete(popupDTO);
	}

}
