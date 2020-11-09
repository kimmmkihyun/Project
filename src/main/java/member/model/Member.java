package member.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	private int mnum;
	
	@Length(min=3,max=6,message="ID는 3~6 글자를 입력해주세요.")
	private String mid;
	
	@Length(min=4,max=8,message="비밀번호는 4~8자 입력해주세요.")
	private String mpw;
	
	@Length(min=4,max=8,message="비밀번호 확인해주세요.")
	private String rempw;
	
	@NotEmpty(message="이름을 입력해주세요.")
	private String mname;
	
	/* @NotEmpty(message="주소를 입력해주세요.") */
	private String addr1;
	
	@NotEmpty(message="상세 주소를 입력해주세요.")
	private String addr2;
	
	@NotEmpty(message="휴대폰 번호를 입력해주세요.")
	private String hp1;
	
	@Length(min=1,max=4, message="앞자리는 4글자까지 입력하세요.")
	private String hp2;
	
	@Length(min=1,max=4, message="뒷자리는 4글자까지 입력하세요.")
	private String hp3;
	
	@NotEmpty(message="이메일 아이디를 입력해주세요.")
	private String email1;
	
	/* @NotNull(message="이메일 주소를 입력해주세요.") */
	private String email2;
	
	@Length(min=2,max=4,message="태어난 연도 4자리로 입력해주세요.")
	private String birth1;
	
	@Length(min=1,max=2,message="태어난 월을 2자리 형식으로 입력해주세요 ex) 1월 01")
	private String birth2;
	
	@Length(min=1,max=2,message="태어난 일을 2자리 형식으로 입력해주세요.")
	private String birth3;
	
	private String mpoint;
	private String coupon;
	private String regdate;
	
	
	public Member() {
		super();
	}
	

	public Member(int mnum, String mid, String mpw, String rempw, String mname, String addr1, String addr2, String hp1,
			String hp2, String hp3, String email1, String email2, String birth1, String birth2, String birth3,
			String mpoint, String coupon, String regdate) {
		super();
		this.mnum = mnum;
		this.mid = mid;
		this.mpw = mpw;
		this.rempw = rempw;
		this.mname = mname;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.email1 = email1;
		this.email2 = email2;
		this.birth1 = birth1;
		this.birth2 = birth2;
		this.birth3 = birth3;
		this.mpoint = mpoint;
		this.coupon = coupon;
		this.regdate = regdate;
	}


	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getRempw() {
		return rempw;
	}

	public void setRempw(String rempw) {
		this.rempw = rempw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}
	public String getMpoint() {
		return mpoint;
	}
	public void setMpoint(String mpoint) {
		this.mpoint = mpoint;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	
	
}
