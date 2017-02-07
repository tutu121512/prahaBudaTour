package prahaBuda.tour.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import favicon.tour.dto.*;

@Repository
public class ReserveQuestionDaoImpl implements ReserveQuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void ReserveQuestionInsert() throws Exception {
		
		int su = sqlSession.selectOne("ReserverQuestion.test");
		System.out.println("DB에서 가져온 값 : "  + su);
		System.out.println("Dao 부분 : ReserveQuestionInsert");
	}

}
