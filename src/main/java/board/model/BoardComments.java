package board.model;

import java.util.Date;

public class BoardComments {
    private int cnum;
    private int ccnum;
    private String crecom;
    private String cname;
    private Date cdate;
    public int getCnum() {
        return cnum;
    }
    public void setCnum(int cnum) {
        this.cnum = cnum;
    }
    public String getCrecom() {
        return crecom;
    }
    public void setCrecom(String crecom) {
        this.crecom = crecom;
    }
    public String getCname() {
        return cname;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public Date getCdate() {
        return cdate;
    }
    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
    public int getCcnum() {
	return ccnum;
    }
    public void setCcnum(int ccnum) { 
	this.ccnum = ccnum;
    }
    
    
}
