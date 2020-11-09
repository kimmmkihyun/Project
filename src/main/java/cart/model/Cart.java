package cart.model;

public class Cart {
	
	private int cartnum;
	private String pimage; 
	private String pname; 
	private String pset; 
	//private String psize; 
	//private String pcolor; 
	private int price; 
	private int pqty;
	private int point; 
	private String id ;
	public Cart() {
		
	}
	public int getCartnum() {
		return cartnum;
	}
	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPset() {
		return pset;
	}
	public void setPset(String pset) {
		this.pset = pset;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Cart(int cartnum, String pimage, String pname, String pset, int price, int pqty, int point, String id) {
		super();
		this.cartnum = cartnum;
		this.pimage = pimage;
		this.pname = pname;
		this.pset = pset;
		this.price = price;
		this.pqty = pqty;
		this.point = point;
		this.id = id;
	}
	
	
	
	
	
	}
