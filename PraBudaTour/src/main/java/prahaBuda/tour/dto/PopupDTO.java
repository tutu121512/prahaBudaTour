package prahaBuda.tour.dto;


import org.springframework.web.multipart.MultipartFile;

public class PopupDTO {
	
	private String boardNo;
	private String popupImg;
	private String popupStatus;

	private MultipartFile file;
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getPopupImg() {
		return popupImg;
	}
	public void setPopupImg(String popupImg) {
		this.popupImg = popupImg;
	}
	public String getPopupStatus() {
		return popupStatus;
	}
	public void setPopupStatus(String popupStatus) {
		this.popupStatus = popupStatus;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
