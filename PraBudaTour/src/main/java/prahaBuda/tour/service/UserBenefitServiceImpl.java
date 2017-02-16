package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dao.*;
@Service
public class UserBenefitServiceImpl implements UserBenefitService {

	@Autowired
	private UserBenefitDao UserBenefitDao;
	
	@Override
	public void serviceInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void serviceUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void serviceDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardDTO> serviceSelect() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> serviceView(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
