package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prahaBuda.tour.dao.TourInfoDao;
import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

@Service
public class TourInfoServiceImpl implements TourInfoService {

	@Autowired
	private TourInfoDao TourInfoDao;
	
	
	@Override
	public void tourInfoInsert(BoardDTO boardDTO) throws Exception {
		TourInfoDao.tourInfoInsert(boardDTO);		
	}

	@Override
	public void tourInfoUpdate(BoardDTO boardDTO) throws Exception {
		TourInfoDao.tourInfoUpdate(boardDTO);
	}

	@Override
	public void tourInfoDelete(BoardDTO boardDTO) throws Exception {
		TourInfoDao.tourInfoDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> tourInfoSelect(BoardDTO boardDto) throws Exception {
		return TourInfoDao.tourInfoSelect(boardDto);

	}


}
