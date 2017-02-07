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
		
		int su = sqlSession.insert("ReserverQuestion.ReserveQuestionInsert",boardDto);
		System.out.println("DB에서 가져온 값 : "  + su);
		System.out.println("Dao 부분 : ReserveQuestionInsert");
	}

	@Override
	public List<BoardDTO> ReserveQuestionSelect() throws Exception {

		return sqlSession.selectList("ReserverQuestion.ReserveQuestionSelect");
	}

}
