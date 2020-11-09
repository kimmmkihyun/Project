package cart.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myCart")
public class CartDao {
	
	String namespace = "cart.model.Cart";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertCart(Cart cart) {
		
		 int cnt = sqlSessionTemplate.insert(namespace+".InsertCart", cart);
	     System.out.println("Cart insert cnt : "+cnt);
		
	}

	public List<Cart> getlistCart(String id) {
		List<Cart> lists = new ArrayList<Cart>();
		
		lists = sqlSessionTemplate.selectList(namespace+".GetCartList",id);
		return lists;
		
		
	}

	public int deleteData(int cartnum) {
		
		int cnt= sqlSessionTemplate.delete(namespace+".DeleteCart",cartnum);
		return cnt;
	}


	public int updateCart(Cart cart) {
		int cnt= sqlSessionTemplate.update(namespace+".UpdateData",cart);
		return cnt;
	}

	public void updateData(int cartnum,int pqty) {
	      
	      Cart cart = new Cart();
	      cart.setCartnum(cartnum);
	      cart.setPqty(pqty);
	      
      sqlSessionTemplate.update(namespace+".UdateCart",cart);
   }

	public Cart getOneData(int cartnum) {
		
		Cart cart = sqlSessionTemplate.selectOne(namespace+".GetOneData",cartnum);
		return cart;
		
	}

		
		
		

}
