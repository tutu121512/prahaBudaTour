package prahaBuda.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import favicon.tour.dao.ReserveQuestionDao;
import favicon.tour.dto.*;

@Service
public class ReserveQuestionServiceImpl implements ReserveQuestionService {

	@Autowired
	private ReserveQuestionDao ReserveQuestionDao;
	
	@Override
	public void ReserveQuestionInsert() throws Exception {
		System.out.println("Service 부분 : ReserveQuestionInsert");
		ReserveQuestionDao.ReserveQuestionInsert();
	}

}
