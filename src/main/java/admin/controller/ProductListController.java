package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Product;
import admin.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListController {

	final String command ="list.prd";
	final String getPage ="admin_ProductList_4";
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			HttpServletRequest request) {		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn",whatColumn); //whatColumn=title
		map.put("keyword", "%"+keyword+"%"); //keyword=%³¯%
		
		int totalCount = productDao.getTotalCount(map);
		System.out.println("totalCount : " + totalCount);
		
		String url = request.getContextPath() +"/" +command ;
		System.out.println("url : " + url);// /ex/list.tv
		  
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		System.out.println("offset : " + pageInfo.getOffset()); // 0
		System.out.println("limit : " + pageInfo.getLimit()); // 5	
		
		List<Product> list = productDao.selectProductAll(pageInfo,map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("list", list);
		mav.setViewName(getPage);
		return mav;
	}
	
}
