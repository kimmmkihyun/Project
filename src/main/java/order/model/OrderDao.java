package order.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {
    
    final String namespace = "order.model.Order";
    
    @Autowired
    SqlSessionTemplate sqlsessionTemplate;
    
    
    
    public List<Order> getOrder(String mid) {
	List<Order> lists = new ArrayList<Order>();
	lists = sqlsessionTemplate.selectList(namespace+".GetOrder", mid);
	return lists;
    }
    
    
    public void insertNewPstock(int dnum,String id, String pname, String pimage,
            int price, int pqty) {
	Order od = new Order();
	od.setDnum(dnum);
	od.setMid(id);
	od.setPname(pname);
	od.setPimage(pimage);
	od.setPrice(price);
	od.setOqty(pqty);
	
	sqlsessionTemplate.insert(namespace+".InsertNewPstock", od);
	
	}


	public List<Order> getAll() {
		List<Order> lists = new ArrayList<Order>();
		lists = sqlsessionTemplate.selectList(namespace+".GetAll"); 
		return lists;
	}
    
    
    
    
}
