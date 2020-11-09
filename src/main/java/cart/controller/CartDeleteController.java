package cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.model.Cart;
import cart.model.CartDao;

@Controller
public class CartDeleteController {
	
	final String command = "cartDel.cart";
	final String gotoPage = "user_cart";

	@Autowired
	private CartDao cartDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="cartnum") int cartnum,
			HttpSession session) {
		
		int cnt = cartDao.deleteData(cartnum);
		System.out.println("CartDeleteController_삭제성공: "+cnt);
		String id = (String) session.getAttribute("loginInfo2");
		List<Cart> carts = cartDao.getlistCart(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("carts",carts);
		mav.setViewName(gotoPage);
		
		return mav;
		
	}
}
