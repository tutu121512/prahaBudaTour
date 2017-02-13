package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void ReviewInsert(BoardDTO boardDto) throws Exception {
		sqlSession.insert("Review.ReviewInsert",boardDto);
		
	}

	@Override
	public List<BoardDTO> ReviewList(int curPage) throws Exception {
		return sqlSession.selectList("Review.ReviewList",curPage);
		
	}

	@Override
	public int ReviewListCount() throws Exception {
		return sqlSession.selectOne("Review.ReviewListCount");
	}

	@Override
	public BoardDTO prahaReviewPasswordCheck(BoardDTO boardDto) throws Exception {
		return sqlSession.selectOne("Review.prahaReviewPasswordCheck",boardDto);
	}

	@Override
	public void prahaReviewDelete(BoardDTO boardDto) throws Exception {
		sqlSession.delete("Review.prahaReviewDelete",boardDto);
	}

	@Override
	public void prahaReviewUpdate(BoardDTO boardDto) throws Exception {
		sqlSession.update("Review.prahaReviewUpdate",boardDto);		
	}
	


}
