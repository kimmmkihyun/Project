package admin.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Product;
import admin.model.ProductDao;
import admin.model.ProductDetail;
import admin.model.ProductDetailDao;

@Controller
public class useProductDetailController {         //user페이지에서 상품 클릭시 상품상세보기 화면이동하는 컨트롤러

   final String command = "detail.userdetail";
   final String command2 = "detailsize.userdetail";
   final String getPage = "user_productDetail";
   final String gotoPage = "redirect:/detail.userdetail";


   @Autowired
   private ProductDao productDao;

   @Autowired
   private ProductDetailDao productDetailDao;
   
   
   @RequestMapping(value=command,method=RequestMethod.GET)
   public ModelAndView doAction(@RequestParam(value="pnum",required=true) int pnum) {

      System.out.println("pnum: "+pnum);


      Product product = productDao.getOneProduct(pnum);
      List<ProductDetail> lists = productDetailDao.getProductsByPnum(pnum);
      List<ProductDetail> colorLists = productDetailDao.getDistinctColor(pnum);

      ModelAndView mav = new ModelAndView();
      mav.addObject("product", product); 
      mav.addObject("lists", lists);
      mav.addObject("colorLists", colorLists);

      mav.setViewName(getPage);
      return mav;

   }
   
   @RequestMapping(value=command2,method=RequestMethod.GET)
   @ResponseBody
   public String doAction2(@RequestParam(value="pnum",required=true) int pnum,
         @RequestParam(value="pcolor",required=true) String pcolor){

      System.out.println("pnum : " + pnum);
      System.out.println("pcolor : " + pcolor);

      
      List<ProductDetail> sizeLists = productDetailDao.getProductSize(pnum,pcolor);

      String sizeLists2 = "";
      for(int i = 0; i<sizeLists.size();i++) {
         sizeLists2 += sizeLists.get(i).getPsize()+",";
         
      }
      System.out.println("sizeLists : " + sizeLists2);

      return sizeLists2;

   }





}