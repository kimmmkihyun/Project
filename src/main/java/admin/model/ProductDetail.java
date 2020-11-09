package admin.model;

import javax.validation.constraints.NotNull;

public class ProductDetail {
	private int dnum;
	private int pnum;
	private String pcode;
	private String pname;
	@NotNull(message = "사이즈입력은 필수입니다.")
	private String psize;
	@NotNull(message = "색상입력은 필수입니다.")
	private String pcolor;
	@NotNull(message = "재고입력은 필수입니다.")
	private String pstock;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public String getPstock() {
		return pstock;
	}
	public void setPstock(String pstock) {
		this.pstock = pstock;
	}
	public ProductDetail(int dnum, int pnum, String pcode, String pname, String psize, String pcolor, String pstock) {
		super();
		this.dnum = dnum;
		this.pnum = pnum;
		this.pcode = pcode;
		this.pname = pname;
		this.psize = psize;
		this.pcolor = pcolor;
		this.pstock = pstock;
	}
	public ProductDetail() {
		super();
	}
	
	
}
