package cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Product;
import admin.model.ProductDao;
import cart.model.Cart;
import cart.model.CartDao;

@Controller
public class CartListController {

	final String command = "cartlist.cart";
	final String command2 = "cartlist2.cart";
	final String getPage = "user_cart";

	@Autowired
	private ProductDao productDao;  

	@Autowired
	private CartDao cartDao;


	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(HttpServletRequest request, Model model,HttpSession session) {
		String pset = request.getParameter("pset");
		String qty	 = request.getParameter("qty");
		String id = (String) session.getAttribute("loginInfo2");
		int pnum = Integer.parseInt(request.getParameter("pnum"));

		System.out.println("-----CartListController :cartlist 요청 들어옴 -----");
		//System.out.println("ProductDao_pset:"+pset);
		//System.out.println("ProductDao_qty:"+qty);
		//System.out.println("ProductDao_pnum:"+pnum);


		String[] psetSlice = pset.split(" ");
		for(int i=0; i<psetSlice.length; i++) {
			System.out.println("psetSlice["+i+"]:"+psetSlice[i]);
		}

		String[] qtySlice = qty.split(",");
		for(int i=0; i<qtySlice.length; i++) {
			System.out.println("qtySlice["+i+"]:"+qtySlice[i]);

		}

		/*
		 * int qtySliceInt ; for(int i=0; i<qtySlice.length; i++) { qtySliceInt =
		 * Integer.parseInt(qtySlice[i]); }
		 */


		Product product = productDao.getOneProduct(pnum);
		model.addAttribute("product", product);


		List<Cart> oldCart = cartDao.getlistCart(id);

		System.out.println("기존의 장바구니:"+oldCart);
		System.out.println("기존 장바구니 크기:"+oldCart.size());

		if(oldCart.size()==0) {

			System.out.println("---기존 장바구니 사이즈0이여서 들어옴---");
			Cart cart = new Cart();
			for(int i=0;i<psetSlice.length;i++) {

				cart.setPimage(product.getPimage());
				cart.setPname(product.getPname());
				cart.setPrice(product.getPrice());
				cart.setPset(psetSlice[i]);
				cart.setPqty( Integer.parseInt(qtySlice[i])	);
				cart.setPoint(product.getPoint());
				cart.setId(	(String)session.getAttribute("loginInfo2"));

				cartDao.insertCart(cart)	;

			}
		}

		
		
		for(int i=0; i<psetSlice.length; i++) {
			System.out.println("--기존 장바구니가 있어서 들어옴 --");
			System.out.println("i:"+i+",");
			
			for(int j=0; j<oldCart.size(); j++) {
				System.out.println("j:"+j+",");
				if(product.getPname().equals(oldCart.get(j).getPname()) && psetSlice[i].equals(oldCart.get(j).getPset())) {
					
					//System.out.println("-----if 들어옴-----");
					//System.out.println("기존장바구니 pname:"+ oldCart.get(j).getPname());
					//System.out.println("새로 추가될 pname:"+product.getPname());
					//System.out.println("기존장바구니 pset:"+ oldCart.get(j).getPset());
					//System.out.println("새로 추가될 pset:"+psetSlice[i]);
					String oldPname = oldCart.get(j).getPname();
					String oldPset = oldCart.get(j).getPset();
					
					int oldPqty = oldCart.get(j).getPqty();
					System.out.println("기존장바구니 검정/s 수량: " +oldPqty);
					int newPqty = Integer.parseInt( qtySlice[i] );
					System.out.println("새로 추가할 검정/s 수량: "+newPqty);
					oldCart.get(j).setPqty(oldPqty + newPqty);
					System.out.println("기존+새로추가한 검정/s수량:" + oldCart.get(j).getPqty());
					
					
					int cnt = cartDao.updateCart(oldCart.get(i));  
					System.out.println("CartListController_update cnt:"+cnt);
					
					break;
					
					
				}else {
					
					System.out.println("-----else들어옴-----");
					Cart cart2 = new Cart();
					cart2.setPimage(product.getPimage());
					cart2.setPname(product.getPname());
					cart2.setPrice(product.getPrice());
					cart2.setPset(psetSlice[i]);
					cart2.setPqty( Integer.parseInt(qtySlice[i]));
					cart2.setPoint(product.getPoint());
					cart2.setId(	(String)session.getAttribute("loginInfo2"));

					cartDao.insertCart(cart2);
					
					break;
					
					
				}
				
			}//작for
			
		}//큰for
		

		List<Cart> carts = cartDao.getlistCart(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("carts",carts);
		mav.setViewName(getPage);

		return mav; 

	}




	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction2(HttpSession session) {
		String id = (String) session.getAttribute("loginInfo2");
		List<Cart> carts = cartDao.getlistCart(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("carts",carts);
		mav.setViewName(getPage);

		return mav;

	}
	
	@RequestMapping(value=command2)
	public ModelAndView doAction3(HttpSession session) {
		String id = (String) session.getAttribute("loginInfo2");
		List<Cart> carts = cartDao.getlistCart(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("carts",carts);
		mav.setViewName(getPage);

		return mav;

	}



}