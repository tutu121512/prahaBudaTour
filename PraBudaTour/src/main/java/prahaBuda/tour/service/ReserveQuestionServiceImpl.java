package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prahaBuda.tour.dao.ReserveQuestionDao;
import prahaBuda.tour.dto.*;

@Service
public class ReserveQuestionServiceImpl implements ReserveQuestionService {

	@Autowired
	private ReserveQuestionDao ReserveQuestionDao;
	
	@Override
	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception {
		System.out.println("Service 부분 : ReserveQuestionInsert");
		ReserveQuestionDao.ReserveQuestionInsert(boardDto);
	}

	@Override
	public List<BoardDTO> ReserveQuestionSelect() throws Exception {
	
		return ReserveQuestionDao.ReserveQuestionSelect();
	}

}
