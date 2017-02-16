package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import prahaBuda.tour.dto.BoardDTO;

@Repository
public class UserBenefitDaoImpl implements UserBenefitDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

}
