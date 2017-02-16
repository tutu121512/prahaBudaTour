package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void NoticeInsert(BoardDTO boardDto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardDTO> NoticeList(int curPage) {
		return sqlSession.selectList("Notice.NoticeList", curPage);
	}

	@Override
	public BoardDTO NoticeView(BoardDTO boardDto) {
		return sqlSession.selectOne("Notice.NoticeView",boardDto);
	}

	@Override
	public void NoticeDelete(BoardDTO boardDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void NoticeUpdate(BoardDTO boardDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public int NoticeListCount() throws Exception {
		return sqlSession.selectOne("Notice.NoticeListCount");
	}

	@Override
	public PageDTO paging(PageDTO pageDto) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
