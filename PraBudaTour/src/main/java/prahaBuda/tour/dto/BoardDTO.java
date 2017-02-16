package prahaBuda.tour.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {

	
	private String boardState;
	private String location;
	private String boardNo;
	private String writer;
	private String title;
	private String content;
	private String password;
	private String boardDate;
	private String boardReply;
	private String startDate;
	private String endDate;
	private String product;
	private String boardImg0;
	private String boardImg1;
	private String boardImg2;
	private String boardImg3;
	private String boardImg4;
	private String boardImg5;
	private String boardImg6;
	private String boardImg7;
	private String boardImg8;
	private String boardImg9;

	List<MultipartFile> file;

	public String getBoardState() {
		return boardState;
	}

	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardReply() {
		return boardReply;
	}

	public void setBoardReply(String boardReply) {
		this.boardReply = boardReply;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getBoardImg0() {
		return boardImg0;
	}

	public void setBoardImg0(String boardImg0) {
		this.boardImg0 = boardImg0;
	}

	public String getBoardImg1() {
		return boardImg1;
	}

	public void setBoardImg1(String boardImg1) {
		this.boardImg1 = boardImg1;
	}

	public String getBoardImg2() {
		return boardImg2;
	}

	public void setBoardImg2(String boardImg2) {
		this.boardImg2 = boardImg2;
	}

	public String getBoardImg3() {
		return boardImg3;
	}

	public void setBoardImg3(String boardImg3) {
		this.boardImg3 = boardImg3;
	}

	public String getBoardImg4() {
		return boardImg4;
	}

	public void setBoardImg4(String boardImg4) {
		this.boardImg4 = boardImg4;
	}

	public String getBoardImg5() {
		return boardImg5;
	}

	public void setBoardImg5(String boardImg5) {
		this.boardImg5 = boardImg5;
	}

	public String getBoardImg6() {
		return boardImg6;
	}

	public void setBoardImg6(String boardImg6) {
		this.boardImg6 = boardImg6;
	}

	public String getBoardImg7() {
		return boardImg7;
	}

	public void setBoardImg7(String boardImg7) {
		this.boardImg7 = boardImg7;
	}

	public String getBoardImg8() {
		return boardImg8;
	}

	public void setBoardImg8(String boardImg8) {
		this.boardImg8 = boardImg8;
	}

	public String getBoardImg9() {
		return boardImg9;
	}

	public void setBoardImg9(String boardImg9) {
		this.boardImg9 = boardImg9;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
		
}

