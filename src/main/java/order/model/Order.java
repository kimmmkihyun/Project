package order.model;

public class Order {
    private int olnum; 
    private int dnum; //productdetail  
    private String mid;  
    private String pname; //productdetail  
    private String pimage; //product  
    private int price; //productdetail
    private int oqty; //productdetail
    public int getOlnum() {
        return olnum;
    }
    public void setOlnum(int olnum) {
        this.olnum = olnum;
    }
    public String getMid() {
        return mid;
    }
    public void setMid(String mid) {
        this.mid = mid;
    }
    public String getPname() {
        return pname;
    }
    public void setPname(String pname) {
        this.pname = pname;
    }
    public String getPimage() {
        return pimage;
    }
    public void setPimage(String pimage) {
        this.pimage = pimage;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public int getOqty() {
        return oqty;
    }
    public void setOqty(int oqty) {
        this.oqty = oqty;
    }
    public int getDnum() {
	return dnum;
    }
    public void setDnum(int dnum) {
	this.dnum = dnum;
    }
}
