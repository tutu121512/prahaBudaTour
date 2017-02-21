package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.ReserveCompleteDTO;

@Repository
public class ReserveCompleteDaoImpl implements ReserveCompleteDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void reserveCompleteInsert(ReserveCompleteDTO reserveCompleteDTO) throws Exception {
		 sqlSession.insert("ReserveComplete.resereveCompleteInsert",reserveCompleteDTO);
	}

	@Override
	public void reserveCompleteUpdate(ReserveCompleteDTO reserveCompleteDTO) throws Exception {
		 sqlSession.update("ReserveComplete.rserveCompleteUpdate",reserveCompleteDTO);
	}

	@Override
	public void reserveCompleteDelete(ReserveCompleteDTO reserveCompleteDTO) throws Exception {
		 sqlSession.delete("ReserveComplete.reserveCompleteDelete",reserveCompleteDTO);
	}

	@Override
	public List<ReserveCompleteDTO> reserveCompleteCalendar() throws Exception {
		return sqlSession.selectList("ReserveComplete.reserveCompleteCalendar");
	}

	@Override
	public List<ReserveCompleteDTO> reserveCompleteBoard(int curPage) throws Exception {
		return sqlSession.selectList("ReserveComplete.reserveCompleteBoard",curPage);
	}

	@Override
	public int reserveCompleteBoardCount() throws Exception {
		return sqlSession.selectOne("ReserveComplete.reserveCompleteBoardCount");
	}

	@Override
	public ReserveCompleteDTO reserveCompleteView(ReserveCompleteDTO reserveCompleteDTO) throws Exception {
		return sqlSession.selectOne("ReserveComplete.reserveCompleteView", reserveCompleteDTO);
	}

}
