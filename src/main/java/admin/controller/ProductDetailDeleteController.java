package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import admin.model.ProductDetailDao;

@Controller 
public class ProductDetailDeleteController {
	final String command ="delete.detail";
	final String gotoPage = "redirect:/detaillist.detail";
	
	@Autowired
	private ProductDetailDao productDetailDao;

	@RequestMapping(command) 
	public String doAction(@RequestParam(value="dnum") int dnum,
			@RequestParam(value="pageNumber",required = true) int pageNumber){
		
	    System.out.println("detail delete dnum = " +dnum);
		productDetailDao.deleteProductDetail(dnum);
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
