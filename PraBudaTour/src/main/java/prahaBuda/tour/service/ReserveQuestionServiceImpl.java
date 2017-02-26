package prahaBuda.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prahaBuda.tour.dao.ReserveQuestionDao;
import prahaBuda.tour.dto.*;

@Service
public class ReserveQuestionServiceImpl implements ReserveQuestionService {

	@Autowired
	private ReserveQuestionDao ReserveQuestionDao;
	
	@Override
	public void ReserveQuestionInsert(BoardDTO boardDto) throws Exception {
		System.out.println("Service 부분 : ReserveQuestionInsert");
		ReserveQuestionDao.ReserveQuestionInsert(boardDto);
	}

	@Override
	public List<BoardDTO> ReserveQuestionList(PageDTO pageDto) throws Exception {
	
		//paging 부분
		int ReserveQuestionSelectCount = ReserveQuestionPageCount();
		System.out.println("전체 갯수 : " + ReserveQuestionSelectCount);
		pageDto.setCount(ReserveQuestionSelectCount);				//notice 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageDTO pVO = paging(pageDto);
		int curPage = pVO.getCurPage();
		System.out.println("현재 페이지 : " + curPage);
		return ReserveQuestionDao.ReserveQuestionList(curPage);
	}
	

	@Override
	public int ReserveQuestionPageCount() throws Exception{
	
		int noticeCount = ReserveQuestionDao.ReserveQuestionListCount();

		return noticeCount;
	}
	
	@Override
	public BoardDTO prahaReservePasswordCheck(BoardDTO boardDto) throws Exception {
		return ReserveQuestionDao.prahaReservePasswordCheck(boardDto);
	}	
	
	//페이징 
	@Override
	public PageDTO paging(PageDTO pageDto){

		int curPage = pageDto.getCurPage();			//현제 페이지 가져오기
		int limit=10;			
		//화면에 보일 리스트 갯수 지정

		int sponCount = pageDto.getCount();  		//카운트 가져오기
		int maxpage = (sponCount+limit-1)/limit;	//마지막 페이지 구하기 
		int startpage = ((curPage-1)/10) * 10 + 1; 	//1부터 5까지는 1 6부터 10까지는 2
		//한 화면에 출력되는 쪽 번호의 시작번호
		int endpage = startpage + 10 - 1; 		     //화면 마지막 페이지 지정


		// 화면 마지막 페이지가 한페이지거나, 마지막페이지인 경우
		if(endpage > maxpage) 
			endpage = maxpage;

		if(endpage < curPage) 
			curPage = endpage;

		//############ 이전, 다음 값 지정
		int previPage = curPage-1;
		int nextPage = curPage+1;	    

		//############ 이전버튼, 다음버튼을 눌렀을때  1페이지 혹은 마지막 페이지를 눌렀을 경우
		if(previPage < 1){
			previPage=1;
		}
		
		if(nextPage>maxpage){
			nextPage=maxpage;
		} 

		pageDto.setStartPage(startpage);	//startPage set해주기
		pageDto.setEndPage(endpage);		//endPage set 해주기
		pageDto.setPreviPage(previPage);
		pageDto.setNextPage(nextPage);
		return pageDto;

	}

	@Override
	public void prahaReserveDelete(BoardDTO boardDto) throws Exception {

		ReserveQuestionDao.prahaReserveDelete(boardDto);
	}

	@Override
	public void prahaReserveUpdate(BoardDTO boardDto) throws Exception {
		ReserveQuestionDao.prahaReserveUpdate(boardDto);
	}
}
