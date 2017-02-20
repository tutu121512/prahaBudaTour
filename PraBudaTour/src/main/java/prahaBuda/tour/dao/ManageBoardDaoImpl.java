package prahaBuda.tour.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.*;

@Repository
public class ManageBoardDaoImpl implements ManageBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardDTO> ManageBoard(int curPage) throws Exception {	
		return sqlSession.selectList("Manage.ManageBoard",curPage);
	}

	@Override
	public int ManageBoardCount() throws Exception {	
		return sqlSession.selectOne("Manage.ManageBoardCount");
	}

	@Override
	public List<BoardDTO> ManageSelectBoard(PageDTO pageDto, BoardDTO boardDTO) throws Exception {
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("curPage", pageDto.getCurPage());
		hashMap.put("boardState", boardDTO.getBoardState());
		System.out.println(hashMap.toString());
		return sqlSession.selectList("Manage.ManageSelectBoard",hashMap);
	}

	@Override
	public int ManageSelectBoardCount(BoardDTO boardDTO) throws Exception {
		System.out.println(boardDTO.getBoardState());
		return sqlSession.selectOne("Manage.ManageSelectBoardCount",boardDTO.getBoardState());
	}

	@Override
	public int manageBoardReply(BoardDTO boardDTO) throws Exception {
		return sqlSession.update("Manage.boardReply",boardDTO);
	}
}
