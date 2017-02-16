package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.BoardDTO;

@Repository
public class TourInfoDaoImpl implements TourInfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void tourInfoInsert(BoardDTO boardDTO) throws Exception {
		sqlSession.insert("TourInfo.InfoInsert",boardDTO);
	}

	@Override
	public void tourInfoUpdate(BoardDTO boardDTO) throws Exception {
		sqlSession.update("TourInfo.InfoDelete",boardDTO);
	}

	@Override
	public void tourInfoDelete(BoardDTO boardDTO) throws Exception {
		sqlSession.delete("TourInfo.InfoUpdate",boardDTO);
	}

	@Override
	public List<BoardDTO> tourInfoSelect(int curPage) throws Exception {
		return sqlSession.selectList("TourInfo.InfoSelect",curPage);
	}

	@Override
	public int tourInfoSelectCount() throws Exception {
		return sqlSession.selectOne("TourInfo.InfoSelectCount");
	}

}
