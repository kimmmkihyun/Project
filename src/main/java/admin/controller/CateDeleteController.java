package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CategoryDao;

@Controller
public class CateDeleteController {

	final String command="delete.cate";
	final String gotoPage="redirect:/list.cate";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(command) 
	public String doAction(@RequestParam(value="cnum") int cnum,
							@RequestParam(value="pageNumber",required = true) int pageNumber) {
		
		categoryDao.deleteCate(cnum);
	
		return gotoPage+"?pageNumber="+pageNumber;
	}
}