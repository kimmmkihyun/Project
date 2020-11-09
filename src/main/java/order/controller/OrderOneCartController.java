package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.ProductDetail;
import admin.model.ProductDetailDao;
import cart.model.Cart;
import cart.model.CartDao;
import order.model.OrderDao;

@Controller
public class OrderOneCartController {
   final String command = "orderone.od";
   final String command2 = "orderAll.od";
   final String getPage = "order_oneCart";
   
   @Autowired
   ProductDetailDao productdetailDao;
   
   @Autowired
   OrderDao orderDao;
   
   @Autowired
   CartDao cartDao;
   
   @RequestMapping(command)
   public String doAction(@RequestParam("cartnum") int cartnum,
                     @RequestParam("pimage") String pimage,
                     @RequestParam("pname") String pname,
                     @RequestParam("pset") String pset,
                     @RequestParam("price") int price,
                     @RequestParam("pqty") int pqty,
                     @RequestParam("id") String id) {
      
      String[] psetSlice=pset.split("/");
      String pcolor = psetSlice[0];
      String psize = psetSlice[1];
      
      System.out.println("price: "+price);
      System.out.println("pqty: "+pqty);
      System.out.println("id: "+id);
      
      List<ProductDetail> list = productdetailDao.getOneCart(pname,pcolor,psize);
      int dnum = list.get(0).getDnum();
      
      System.out.println("dnum"+list.get(0).getDnum());
      
      
      List<ProductDetail> list2 = productdetailDao.getOneDnum(dnum);
      System.out.println("pstock:"+list2.get(0).getPstock());
      
      String minuspstock = String.valueOf((Integer.parseInt(list2.get(0).getPstock())-pqty));
      System.out.println("minusstock"+minuspstock);
      
      productdetailDao.updatePstock(minuspstock,dnum);
      
      cartDao.deleteData(cartnum);
      
      orderDao.insertNewPstock(dnum, id, pname, pimage, price, pqty);
      
      
      
      return getPage;
   }
   
   @RequestMapping(command2)
   public String doAction2(HttpSession session) {
	   
	   System.out.println("------OrderOneCartController 들어옴 -------");
	   String id = (String) session.getAttribute("loginInfo2");
	   List<Cart> lists = cartDao.getlistCart(id);
	   System.out.println("장바구니 내 상품 갯수:" +lists.size());
	   for(int i=0; i<lists.size(); i++) {
		   
		   System.out.println(lists.get(i).getPname()+" ");
		   System.out.println(lists.get(i).getPset()+" ");
		   String pname = lists.get(i).getPname();
		   int cartnum = lists.get(i).getCartnum();
		   String pimage = lists.get(i).getPimage();
		   int price = lists.get(i).getPrice();
		   
		   int pqty = lists.get(i).getPqty();	//구매수량
		   String pset = lists.get(i).getPset();
		   String[] ptoken = pset.split("/");
		   String pcolor = ptoken[0];
		   String psize = ptoken[1];
		   System.out.println("pcolor:"+pcolor);
		   System.out.println("psize:"+psize);
		   
		   List<ProductDetail> detailList = productdetailDao.getOneCart(pname, pcolor, psize);
		   int dnum = detailList.get(0).getDnum();
		   System.out.println("Dnum: "+ dnum);
		   
		   List<ProductDetail> list2 = productdetailDao.getOneDnum(dnum);
		   System.out.println("pstock:"+list2.get(0).getPstock());
		    
		    String minuspstock = String.valueOf((Integer.parseInt(list2.get(0).getPstock())-pqty));
		    System.out.println("minusstock"+minuspstock);
		    
		    productdetailDao.updatePstock(minuspstock,dnum);
		    
		    cartDao.deleteData(cartnum);
		      
		     orderDao.insertNewPstock(dnum, id, pname, pimage, price, pqty);
		    
		   
	   }
	   
	   
	   return getPage;
   }
   
   
   
   
   
   
}