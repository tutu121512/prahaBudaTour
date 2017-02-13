package brainburst.tt.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import brainburst.tt.dto.AdditionalInfoDTO;
import brainburst.tt.dto.EpisodeDTO;
import brainburst.tt.dto.ImageDTO;
import brainburst.tt.dto.UserDTO;
import brainburst.tt.dto.WebtoonDTO;
import brainburst.tt.service.AuthorService;

@Controller
@RequestMapping("author")
public class AuthorContoller {
	@Autowired
	private AuthorService authorService;
	
	@RequestMapping("{viewFolder}/{viewName}")
	public String pageMove(HttpServletRequest request,
			@PathVariable("viewFolder") String viewFolder, 
			@PathVariable("viewName") String viewName){
		
		System.out.println(viewFolder+"/"+viewName+"로 이동합니다.");
		return viewFolder+"/"+viewName;
	}

	/**
	 * 웹툰상세보기
	 * 작가가 자신의 웹툰보기 페이지에서 상세보기를 누를경우 작품정보를 가지고 해당페이지로 이동.
	 * @return webtoonDTO는 해당 작품의 정보가 담긴 DTO
	 */
	@RequestMapping("showDetail")
	public ModelAndView showDetail(HttpServletRequest request) {
		int webtoonCode = (Integer) request.getAttribute("webtoonCode");
		List<WebtoonDTO> list = (List<WebtoonDTO>) request.getAttribute("webtoonList");
		WebtoonDTO dto = null;
		Iterator<WebtoonDTO> iterator = list.iterator();
		while (iterator.hasNext()) {
			WebtoonDTO webtoonDTO = (WebtoonDTO) iterator.next();
			if (webtoonDTO.getWebtoonCode()==webtoonCode) {
				dto = webtoonDTO;
				break;
			}
		}
		return new ModelAndView("author/detail", "webtoonDTO", dto);
	}

	/**
	 * 마이페이지에서 작가페이지를 클릭할때,
	 * 작가일경우 작가페이지로이동, 독자일경우 작가페이지 활성화버튼으로 이동(기본값)
	 */
	@RequestMapping("authorPage")
	public ModelAndView authorPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		String userLevel = userDTO.getLevel();
		String nickname = userDTO.getNickname();
		String viewName = "myInfo/authorPromotion";
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("nickname", nickname);
		//유저레벨이 독자가 아닐경우(펀딩작가, 작가인경우!) 작가페이지로이동.
		if (!userLevel.equals("독자")) {
			//사용자의 닉네임으로 연제중인 웹툰목록 가져오기
			System.out.println("닉네임:"+nickname);
			List<WebtoonDTO> list = authorService.getSerialWebtoon(nickname);
			System.out.println(list);
			session.setAttribute("webtoonList", list);
			//이동할 뷰이름 변경
			viewName = "myInfo/authorpage";
		}
		/*
		 * 웹툰상태변경시 변경가능한 웹툰목록가져오기
		 * (세션의 webtoonList가 수시로 변하여서 제대로 리스트가 출력되지 않으므로,
		 * 세션에 mylist로 새로운 목록을 넣어준다.)
		 */  
		List<WebtoonDTO> list2 = authorService.selectMyWebtoon(userDTO.getNickname());
		session.setAttribute("mylist", list2);
		modelAndView.setViewName(viewName);
		return modelAndView;
	}

	/**
	작가페이지의 마감된 웹툰탭 클릭할 때, 연재완료 상태의 웹툰목록 가지고 이동
	*/
	@RequestMapping("complete")
	public ModelAndView concludedWebtoonPage(HttpServletRequest request, String nickname) {
		List<WebtoonDTO> list = authorService.getCompleteWebtoon(nickname);
		return new ModelAndView("author/completeList", "webtoonList", list);
	}

	/**
	웹툰등록
	등록하면 정보값 가지고 웹툰테이블 생성
	이후 작가페이지의 연재중웹툰탭으로 이동
	*/
	@RequestMapping("registerWebtoon")
	public String addSeries(HttpServletRequest request, WebtoonDTO webtoonDTO, EpisodeDTO episodeDTO) throws Exception {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		webtoonDTO.setNickname(userDTO.getNickname());
		List<MultipartFile> images = episodeDTO.getImage();
		List<ImageDTO> imageList = new ArrayList<ImageDTO>();
		
		String categoryName = authorService.getCategoryName(webtoonDTO.getCategoryCode());
		String path = request.getSession().getServletContext().getRealPath("/") + "/resources";
		
		if(webtoonDTO.getWebtoonThumbnailFile().getSize() == 0) {
			webtoonDTO.setWebtoonThumbnail(null);
		}else {
			webtoonDTO.setWebtoonThumbnail("/webtoon/webtoonThumbnail/"
					+ webtoonDTO.getWebtoonThumbnailFile().getOriginalFilename());
			webtoonDTO.getWebtoonThumbnailFile().transferTo(new File(path + "/webtoon/webtoonThumbnail/"
					+ webtoonDTO.getWebtoonThumbnailFile().getOriginalFilename()));
		}
		
		if(episodeDTO.getThumbnailFile().getSize() == 0) {
			episodeDTO.setThumbnail(null);
		}else {
			episodeDTO.setThumbnail("/webtoon/episodeThumbnail/"
						+ episodeDTO.getThumbnailFile().getOriginalFilename());
			episodeDTO.getThumbnailFile().transferTo(new File(path + "/webtoon/episodeThumbnail/"
					+ episodeDTO.getThumbnailFile().getOriginalFilename()));
		}
		int index = 0;
		for(int i = 0; i < images.size(); i++) {
			if(images.get(i).getSize() != 0) {
				imageList.add(new ImageDTO(index++, -1, "/webtoon/"+categoryName+"/"+images.get(i).getOriginalFilename()));
				images.get(i).transferTo(new File(path+"/webtoon/"+categoryName+"/"+images.get(i).getOriginalFilename()));
			}
		}

		int result = authorService.addSeries(webtoonDTO, episodeDTO, imageList);
		
		return "redirect:/author/authorPage";
	}
	
	/**
	웹툰수정
	*/
	@RequestMapping("modifyWebtoon")
	public String modifyWebtoon(HttpServletRequest request, WebtoonDTO webtoonDTO) throws Exception {
		MultipartFile webtoonThumbnailFile = webtoonDTO.getWebtoonThumbnailFile();

		String path = request.getSession().getServletContext().getRealPath("/") + "/resources";
		String dbPath = "/webtoon/webtoonThumbnail/" + webtoonThumbnailFile.getOriginalFilename();
		
		if(webtoonThumbnailFile.getSize() == 0) {
			webtoonDTO.setWebtoonThumbnail(null);
		}else {
			webtoonDTO.setWebtoonThumbnail(dbPath);
			webtoonThumbnailFile.transferTo(new File(path + dbPath));
		}
		authorService.modifyWebtoon(webtoonDTO);
		
		return "redirect:/author/authorPage";
	}
	
	/**
	 * 웹툰 수정페이지로 이동
	 * @param request
	 * @param webtoonCode
	 * @return
	 */
	@RequestMapping("modifyWebtoonPage")
	public String modifyWebtoonPage(HttpServletRequest request, int webtoonCode) {
		WebtoonDTO webtoonDTO = authorService.selectWebtoon(webtoonCode);
		String webtoonThumbnailPath = webtoonDTO.getWebtoonThumbnail();
		
		if(webtoonDTO.getWebtoonThumbnail() != null) {
			String[] path = webtoonDTO.getWebtoonThumbnail().split("/");
			webtoonDTO.setWebtoonThumbnail(path[path.length-1]);
		}

		request.setAttribute("webtoonDTO", webtoonDTO);
		request.setAttribute("webtoonThumbnailFile", webtoonThumbnailPath);
		
		return "myInfo/webtoonModify";
	}
	
	/**
	작품상태변경
	*/
	public String setSeriesState(HttpServletRequest request, String state) {
		//어떻게받는가...?
		String webtoonCode = null;
		authorService.setSeriesState(webtoonCode, state);
		return "author/authorPage";
	}
	
	/**
	 * 에피소드업로드
	 */
	@RequestMapping("episodeUpload")
	public String uploadEpisode(HttpServletRequest request, EpisodeDTO episodeDTO) throws Exception {
		List<MultipartFile> images = episodeDTO.getImage();
		List<ImageDTO> imageList = new ArrayList<ImageDTO>();
		
		String categoryName = authorService.selectCategoryName(episodeDTO.getWebtoonCode());
		String path = request.getSession().getServletContext().getRealPath("/");
		String dbPath = "/webtoon/";
		path += "/resources" + dbPath;
		
		if(episodeDTO.getThumbnailFile().getSize() == 0) {
			episodeDTO.setThumbnail(null);
		}else {
			episodeDTO.setThumbnail(dbPath + "episodeThumbnail/"
						+ episodeDTO.getThumbnailFile().getOriginalFilename());
			episodeDTO.getThumbnailFile().transferTo(new File(path + "episodeThumbnail/"
					+ episodeDTO.getThumbnailFile().getOriginalFilename()));
		}
		int index = 0;
		for(int i = 0; i < images.size(); i++) {
			if(images.get(i).getSize() != 0) {
				imageList.add(new ImageDTO(index++, -1, dbPath+categoryName+"/"+images.get(i).getOriginalFilename()));
				images.get(i).transferTo(new File(path+categoryName+"/"+images.get(i).getOriginalFilename()));
			}
		}
		
		Integer fundCode = authorService.selectFundCode(episodeDTO.getWebtoonCode());
		
		if(fundCode != null) {
			episodeDTO.setFundCode(fundCode);
		}

		authorService.episodeUpload(episodeDTO, imageList);
		
		return "redirect:/webtoon/webtoonPage/"+episodeDTO.getWebtoonCode();
	}
	
	/**
	 * 에피소드 수정
	 * @return
	 */
	@RequestMapping("modifyEpisode")
	public String modifyEpisode(HttpServletRequest request, 
			EpisodeDTO episodeDTO, String[] imageSize, int imageListSize) throws Exception {
		
		List<MultipartFile> images = episodeDTO.getImage();
		List<ImageDTO> modifyImageList = new ArrayList<ImageDTO>();
		List<ImageDTO> addImageList = new ArrayList<ImageDTO>();
		List<ImageDTO> deleteImageList = new ArrayList<ImageDTO>();
		
		String categoryName = authorService.selectCategoryName(episodeDTO.getWebtoonCode());
		String path = request.getSession().getServletContext().getRealPath("/");
		String dbPath = "/webtoon/";
		path += "/resources" + dbPath;
		
		if(episodeDTO.getThumbnailFile().getSize() == 0) {
			episodeDTO.setThumbnail(null);
		}else {
			episodeDTO.setThumbnail(dbPath + "episodeThumbnail/"
						+ episodeDTO.getThumbnailFile().getOriginalFilename());
			episodeDTO.getThumbnailFile().transferTo(new File(path + "episodeThumbnail/"
					+ episodeDTO.getThumbnailFile().getOriginalFilename()));
		}
		
		int count = 0;
		for(int i = 0; i < images.size(); i++) {
			if(images.get(i).getSize() != 0) {
				if(imageListSize > i) {
					modifyImageList.add(new ImageDTO(count++, episodeDTO.getEpisodeSequence(), 
							dbPath+categoryName+"/"+images.get(i).getOriginalFilename()));
				}else {
					addImageList.add(new ImageDTO(count++, episodeDTO.getEpisodeSequence(), 
							dbPath+categoryName+"/"+images.get(i).getOriginalFilename()));
				}
				images.get(i).transferTo(new File(path+categoryName+"/"+images.get(i).getOriginalFilename()));
				System.out.println("image name["+i+"] : " + images.get(i).getOriginalFilename());
				System.out.println(("image size["+i+"] : " + imageSize[i]));
			}else if(imageSize[i].equals("")) {
				System.out.println(("image size["+i+"] null : " + imageSize[i]));
			}else {
				count++;
				System.out.println(("image size["+i+"] not null : " + imageSize[i]));
			}
		}
		
		for(int i = count; i < imageListSize; i++) {
			deleteImageList.add(new ImageDTO(i, episodeDTO.getEpisodeSequence(), null));
		}
		
		Map<String, List<ImageDTO>> imageList = new HashMap<String, List<ImageDTO>>();
		imageList.put("modifyImageList", modifyImageList);
		imageList.put("addImageList", addImageList);
		imageList.put("deleteImageList", deleteImageList);
		
		int result = authorService.modifyEpisode(episodeDTO, imageList);
		for(ImageDTO img : modifyImageList) {
			System.out.println("modifyimage index : " + img.getImageIndex());
			System.out.println("modifyimage name : " + img.getFileName());
		}
		for(ImageDTO img : addImageList) {
			System.out.println("addimage index : " + img.getImageIndex());
			System.out.println("addimage name : " + img.getFileName());
		}
		System.out.println("수정결과 : " + result);
		
		return "redirect:/webtoon/webtoonPage/"+episodeDTO.getWebtoonCode();
	}
	
	/**
	 * 작가페이지만들기
	 * @return
	 */
	@RequestMapping("madeAuthorPage")
	public String madeAuthorPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		session.setAttribute("userDTO", authorService.madeAuthorPage(userDTO));
		List<WebtoonDTO> list = authorService.getSerialWebtoon(userDTO.getNickname());
		session.setAttribute("webtoonList", list);
		return "myInfo/authorpage";
	}
	/**
	 * 작가 추가정보 입력
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * */
	@RequestMapping("additionalInfo")
	@ResponseBody
	public String additionalInfo(HttpServletRequest request, AdditionalInfoDTO additionalInfoDTO) throws IllegalStateException, IOException{
		HttpSession session = request.getSession();
		String path = session.getServletContext().getRealPath("/") + "/resources";
		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		additionalInfoDTO.setEmail(userDTO.getEmail());
		
		if(additionalInfoDTO.getFile().getSize()==0){
			additionalInfoDTO.setIdentificationCard(null);
		}else{
			additionalInfoDTO.setIdentificationCard("/webtoon/IdentificationCard/"
					+ additionalInfoDTO.getFile().getOriginalFilename());
			additionalInfoDTO.getFile().transferTo(new File(path + "/webtoon/IdentificationCard/"
					+ additionalInfoDTO.getFile().getOriginalFilename()));
		}
		
		int result = authorService.additionalInfo(additionalInfoDTO);
		
		return "";
		
	}
	/**
	 * 작가 추가 정보 출력
	 * */
	@RequestMapping("selectAdditionalInfo")
	@ResponseBody
	public AdditionalInfoDTO selectAdditionalInfo(HttpServletRequest request){
		
		UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
		AdditionalInfoDTO additionalInfoDTO = authorService.selectAdditionalInfo(userDTO.getEmail());
		String identificationCard[] = additionalInfoDTO.getIdentificationCard().split("/");
		additionalInfoDTO.setIdentificationCard(identificationCard[identificationCard.length-1]);
		return additionalInfoDTO;
	}
}