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
		sqlSession.insert("UserBenefit.serviceInsert",boardDTO);
	}

	@Override
	public void serviceUpdate(BoardDTO boardDTO) throws Exception {
		sqlSession.update("UserBenefit.serviceUpdate",boardDTO);
	}

	@Override
	public void serviceDelete(BoardDTO boardDTO) throws Exception {
		sqlSession.delete("UserBenefit.serviceDelete",boardDTO);
	}

	@Override
	public List<BoardDTO> serviceSelect() throws Exception {
		return sqlSession.selectList("UserBenefit.serviceSelect");
	}

}
