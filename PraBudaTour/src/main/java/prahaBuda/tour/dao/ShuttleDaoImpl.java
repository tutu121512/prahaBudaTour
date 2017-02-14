package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.BoardDTO;

@Repository
public class ShuttleDaoImpl implements ShuttleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void ShuttleInsert(BoardDTO boardDto) throws Exception {
		sqlSession.insert("Shuttle.ShuttleInsert",boardDto);
		
	}

	@Override
	public List<BoardDTO> ShuttleList(int curPage) throws Exception {
		return sqlSession.selectList("Shuttle.ShuttleList",curPage);
		
	}

	@Override
	public int ShuttleListCount() throws Exception {
		return sqlSession.selectOne("Shuttle.ShuttleListCount");
	}

	@Override
	public BoardDTO prahaShuttlePasswordCheck(BoardDTO boardDto) throws Exception {

		return sqlSession.selectOne("Shuttle.prahaShuttlePasswordCheck",boardDto);
	}

	@Override
	public void prahaShuttleDelete(BoardDTO boardDto) throws Exception {
		sqlSession.delete("Shuttle.prahaShuttleDelete",boardDto);
	}

	@Override
	public void prahaShuttleUpdate(BoardDTO boardDto) throws Exception {
		sqlSession.update("Shuttle.prahaShuttleUpdate",boardDto);		
	}
	


}
