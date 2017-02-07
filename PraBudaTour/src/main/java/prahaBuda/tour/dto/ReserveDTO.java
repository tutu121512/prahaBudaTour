package prahaBuda.tour.dto;

public class ReserveDTO {
	 
	private String reserveQuestion;
	private String reserveAnswer;	
	private String reserveState;	
	private String reserverDate;	
	private String password	;
	private String phone	;
	private String kakaoId	;
	
	public String getReserveQuestion() {
		return reserveQuestion;
	}
	public void setReserveQuestion(String reserveQuestion) {
		this.reserveQuestion = reserveQuestion;
	}
	public String getReserveAnswer() {
		return reserveAnswer;
	}
	public void setReserveAnswer(String reserveAnswer) {
		this.reserveAnswer = reserveAnswer;
	}
	public String getReserveState() {
		return reserveState;
	}
	public void setReserveState(String reserveState) {
		this.reserveState = reserveState;
	}
	public String getReserverDate() {
		return reserverDate;
	}
	public void setReserverDate(String reserverDate) {
		this.reserverDate = reserverDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	

}
