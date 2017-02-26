package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prahaBuda.tour.dao.ManageBoardDao;
import prahaBuda.tour.dto.BoardDTO;
import prahaBuda.tour.dto.PageDTO;

@Service
public class ManageBoardServiceImpl implements ManageBoardService {

	@Autowired
	private ManageBoardDao managerBoardDao;
	
	@Override
	public List<BoardDTO> ManageBoard(PageDTO pageDto) throws Exception {
		//paging 부분
		int ManageBoardCount = ManageBoardCount();
		pageDto.setCount(ManageBoardCount);				//notice 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageDTO pVO = paging(pageDto);
		int curPage = pVO.getCurPage();
		return managerBoardDao.ManageBoard(curPage);
	}

	@Override
	public int ManageBoardCount() throws Exception {
		return managerBoardDao.ManageBoardCount();
	}

	@Override
	public PageDTO paging(PageDTO pageDto) throws Exception {
		int curPage = pageDto.getCurPage();			//현제 페이지 가져오기
		int limit=10;			
		//화면에 보일 리스트 갯수 지정

		int sponCount = pageDto.getCount();  		//카운트 가져오기
		int maxpage = (sponCount+limit-1)/limit;	//마지막 페이지 구하기 
		int startpage = ((curPage-1)/10) * 10 + 1; 	//1부터 5까지는 1 6부터 10까지는 2
		//한 화면에 출력되는 쪽 번호의 시작번호  
		int endpage = startpage + 10 - 1; 		     //화면 마지막 페이지 지정
		

		// 화면 마지막 페이지가 한페이지거나, 마지막페이지인 경우
		if(endpage > maxpage) endpage = maxpage;

		if(endpage < curPage) curPage = endpage;

		//############ 이전, 다음 값 지정
		int previPage = curPage-1;
		int nextPage = curPage+1;	    

		//############ 이전버튼, 다음버튼을 눌렀을때  1페이지 혹은 마지막 페이지를 눌렀을 경우
		if(previPage < 1){ previPage=1; }
		
		if(nextPage>maxpage){ nextPage=maxpage; } 

		pageDto.setStartPage(startpage);	//startPage set해주기
		pageDto.setEndPage(endpage);		//endPage set 해주기
		pageDto.setPreviPage(previPage);
		pageDto.setNextPage(nextPage);
		return pageDto;
	}

	@Override
	public List<BoardDTO> ManageSelectBoard(PageDTO pageDto, BoardDTO boardDTO) throws Exception {
		//paging 부분
		int ManageSelectBoardCount = ManageSelectBoardCount(boardDTO);
		System.out.println("selectBoardCount 수  : "  + ManageSelectBoardCount );
		pageDto.setCount(ManageSelectBoardCount);				//notice 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageDTO pVO = paging(pageDto);
		pVO.getCurPage();
		return managerBoardDao.ManageSelectBoard(pageDto, boardDTO);
	}

	@Override
	public int ManageSelectBoardCount(BoardDTO boardDTO) throws Exception {
		return managerBoardDao.ManageSelectBoardCount(boardDTO);
	}

	@Override
	public int manageBoardReply(BoardDTO boardDTO) throws Exception {
		return managerBoardDao.manageBoardReply(boardDTO);
	}

	@Override
	public void manageBoardDelete(BoardDTO boardDTO) throws Exception {
		managerBoardDao.manageBoardDelete(boardDTO);
	}

	@Override
	public BoardDTO manageSelect(BoardDTO boardDTO) throws Exception {
		return managerBoardDao.manageSelect(boardDTO);
	}

	@Override
	public void manageUpdate(BoardDTO boardDTO) throws Exception {
		managerBoardDao.manageUpdate(boardDTO);
	}
}
