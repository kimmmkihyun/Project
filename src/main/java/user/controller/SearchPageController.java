package user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Product;
import admin.model.ProductDao;

   @Controller
   public class SearchPageController {
   final String command = "search.uspage";
   final String getPage = "user_search";
   
   @Autowired
   ProductDao productDao;
   
   
   @RequestMapping(value=command, method=RequestMethod.GET)
   public ModelAndView doAction(@RequestParam(value="keyword", required=false) String keyword) {
      
      Map<String,String> mlist = new HashMap<String,String>();
      mlist.put("keyword", "%"+keyword+"%");
      System.out.println("keyword:"+keyword);
      
      List<Product> lists = productDao.searchProduct(mlist);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("lists", lists);
      mav.addObject("keyword",keyword);
      mav.setViewName(getPage);
      return mav; 
   }
   
}