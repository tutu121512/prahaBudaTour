package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.*;

@Repository
public class ReserveQuestionDaoImpl implements ReserveQuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception {
		
		int su = sqlSession.insert("ReserveQuestion.ReserveQuestionInsert",boardDto);
		System.out.println("Dao 부분 : ReserveQuestionInsert");
	}

	@Override
	public List<BoardDTO> ReserveQuestionList(int curPage) throws Exception {
		return sqlSession.selectList("ReserveQuestion.ReserveQuestionList",curPage);
	}

	@Override
	public int ReserveQuestionListCount() throws Exception {
		return sqlSession.selectOne("ReserveQuestion.ReserveQuestionListCount");
	}

}
