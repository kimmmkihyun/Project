package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ProductDetail;
import admin.model.ProductDetailDao;
import cart.model.Cart;
import cart.model.CartDao;

@Controller
public class CartUpdateController {
   final String command = "cartUpdate.cart";
   final String gotoPage = "user_cart";
   
   @Autowired
   private CartDao cartDao;
   
   @Autowired
   private ProductDetailDao productDetailDao;
   
   @RequestMapping(value=command,method=RequestMethod.GET)
   public ModelAndView doAction(
         @RequestParam(value="cartnum") int cartnum,
         @RequestParam(value="pqty") int pqty,
         HttpServletResponse response,
         HttpSession session
   ) throws IOException {
      
      System.out.println("CartUpdateController_cartnum:"+cartnum);
      Cart cart = cartDao.getOneData(cartnum);
      String pname = cart.getPname();
      String pset = cart.getPset();
      String[] psetSlice = pset.split("/");
      String pcolor = psetSlice[0];
      String psize =psetSlice[1];
      System.out.println("CartUpdateController_pname:"+pname);
      System.out.println("CartUpdateController_pcolor:"+pcolor);
      System.out.println("CartUpdateController_psize:"+psize);
      List<ProductDetail> lists = productDetailDao.getStock(pname,pcolor,psize); 
      int stock = Integer.parseInt(lists.get(0).getPstock());
      System.out.println("stock 나와랍:" + stock);
      lists.get(0).getDnum();
      System.out.println("cartDao_pstock:"+lists.get(0).getPstock());
      System.out.println("cartDao_dnum:"+lists.get(0).getDnum());
      String id = (String) session.getAttribute("loginInfo2");
      System.out.println("id 세션 설정한 거: "+id);
      
      
      if(pqty>stock) {
         
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter writer = response.getWriter();  
          writer.println("<script>alert('주문가능한 수량은 "+stock+"개 입니다.'); </script>");
          writer.flush();
          /*
         ModelAndView mav = new ModelAndView();
         mav.setViewName(gotoPage);
         */
          List<Cart> carts = cartDao.getlistCart(id);
         ModelAndView mav = new ModelAndView();
         mav.addObject("carts",carts);
         mav.setViewName(gotoPage);
         return mav; 
 
         
      }
      else {
         
         cartDao.updateData(cartnum,pqty);
         
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter writer = response.getWriter();  
          writer.println("<script>alert('수량변경 완료'); </script>");
          writer.flush();
         
         
         List<Cart> carts = cartDao.getlistCart(id);  
         ModelAndView mav = new ModelAndView();
         mav.addObject("carts",carts);
         mav.setViewName(gotoPage);
         return mav; 
      }
      
   }

}