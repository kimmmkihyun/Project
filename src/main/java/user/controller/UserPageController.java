package user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Product;
import admin.model.ProductDao;


@Controller
public class UserPageController {
   
		final String command="user.uspage";
	   final String command2 = "best.uspage";
	   final String outer = "outer.uspage";
	   final String top = "top.uspage";
	   final String blouse = "blouse.uspage";
	   final String bottom = "bottom.uspage";
	   final String dress = "dress.uspage";
	   final String skirt = "skirt.uspage";
	   final String shoes = "shoes.uspage";
	   final String bag = "bag.uspage";
	   final String acc = "acc.uspage";
	   final String catePick = "catePick.uspage";
	   final String getPage="user_main_4";
	   final String getPageBest= "user_best_4";
	   final String getPageCate = "user_cate_4";
	   final String getPagePcate = "user_pcate_4";
   
    @Autowired 
    ProductDao productDao;
    
   @RequestMapping(value=command,method=RequestMethod.GET )
   public ModelAndView doAction() {
      
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectNewProduct();
      
      mav.addObject("lists", lists);
      mav.setViewName(getPage);
      return mav; 
   }
   
   @RequestMapping(value=command2,method=RequestMethod.GET )
   public ModelAndView bestAction() {
      
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectBestProduct();
      
      mav.addObject("lists", lists);
      mav.setViewName(getPageBest);
      return mav; 
   }
   
   //카테고리 이름 눌렀을 때 나오는 화면
   @RequestMapping(value=catePick,method = RequestMethod.POST)
   public ModelAndView catePick(@RequestParam(value="pcate",required = true) String pcate,
         @RequestParam(value="pcode",required = true) String pcode
         ) {
      ModelAndView mav = new ModelAndView();
      String pcode1[] = pcode.split(",");
      String pcode2 = (String) pcode1[0];
      List<Product> lists = productDao.selectByPcate(pcate);
      List<Product> lists2 = productDao.selectByPcode(pcode2);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPagePcate);
      return mav;
   }
    
   
   
   @RequestMapping(value=outer,method = RequestMethod.GET)
   public ModelAndView doAction2(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      System.out.println("pcode 컨트롤러 : " + pcode);
      List<Product> lists = productDao.selectByCateOuter();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=top,method = RequestMethod.GET)
   public ModelAndView doAction3(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateTop();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=blouse,method = RequestMethod.GET)
   public ModelAndView doAction4(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateBlouse();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=bottom,method = RequestMethod.GET)
   public ModelAndView doAction5(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateBottom();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=dress,method = RequestMethod.GET)
   public ModelAndView doAction6(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateDress();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=skirt,method = RequestMethod.GET)
   public ModelAndView doAction7(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateSkirt();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=shoes,method = RequestMethod.GET)
   public ModelAndView doAction8(@RequestParam(value="pcode",required = true) String pcode) {
       ModelAndView mav = new ModelAndView();
      List<Product> lists = productDao.selectByCateShoes();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=bag,method = RequestMethod.GET)
   public ModelAndView doAction9(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateBag();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   @RequestMapping(value=acc,method = RequestMethod.GET)
   public ModelAndView doAction10(@RequestParam(value="pcode",required = true) String pcode) {
      ModelAndView mav = new ModelAndView();
      
      List<Product> lists = productDao.selectByCateAcc();
      List<Product> lists2 = productDao.selectByPcode(pcode);
      mav.addObject("lists", lists);
      mav.addObject("lists2", lists2);
      mav.setViewName(getPageCate);
      return mav;
   }
   
   
}
