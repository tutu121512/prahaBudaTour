package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.BoardDTO;

@Repository
public class ReserveQuestionDaoImpl implements ReserveQuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception {
		sqlSession.insert("ReserveQuestion.ReserveQuestionInsert",boardDto);
	}

	@Override
	public List<BoardDTO> ReserveQuestionList(int curPage) throws Exception {
		return sqlSession.selectList("ReserveQuestion.ReserveQuestionList",curPage);
	}

	@Override
	public int ReserveQuestionListCount() throws Exception {
		return sqlSession.selectOne("ReserveQuestion.ReserveQuestionListCount");
	}

	@Override
	public BoardDTO prahaReservePasswordCheck(BoardDTO boardDto) throws Exception {

		return sqlSession.selectOne("ReserveQuestion.prahaReservePasswordCheck",boardDto);
	}

	@Override
	public void prahaReserveDelete(BoardDTO boardDto) throws Exception {
		sqlSession.delete("ReserveQuestion.prahaReserveDelete",boardDto);
	}

	@Override
	public void prahaReserveUpdate(BoardDTO boardDto) throws Exception {
		sqlSession.update("ReserveQuestion.prahaReserveUpdate",boardDto);		
	}

}
