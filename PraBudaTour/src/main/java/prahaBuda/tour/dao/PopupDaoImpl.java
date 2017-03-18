package prahaBuda.tour.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prahaBuda.tour.dto.PopupDTO;

@Repository
public class PopupDaoImpl implements PopupDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void popupInsert(PopupDTO popupDTO) throws Exception {
		sqlSession.insert("Popup.popupInsert",popupDTO);
	}

	@Override
	public PopupDTO popup() throws Exception {
		return sqlSession.selectOne("Popup.popup");
	}

	@Override
	public List<PopupDTO> popupList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void popupDelete(PopupDTO popupDTO) throws Exception {
		sqlSession.update("Popup.popupDelete", popupDTO);
	}

}
