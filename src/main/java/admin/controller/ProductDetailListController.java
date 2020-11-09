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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Category;
import admin.model.ProductDetail;
import admin.model.ProductDetailDao;
import utility.Paging;

@Controller
public class ProductDetailListController {
	final String command="detaillist.detail";
	final String command2="popuplist.detail";
	final String getPage="admin_ProductDetailList_4";
	final String getPage2="popupStock";
	
	@Autowired
	private ProductDetailDao productDetailDao;
	
	@RequestMapping(command) 
	public ModelAndView doAction(@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize,
			HttpServletRequest request) {		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn",whatColumn); //whatColumn=title
		map.put("keyword", "%"+keyword+"%"); //keyword=%³¯%
		System.out.println("controller whatColumn/keyword ="+whatColumn+"/"+keyword);
		
		int totalCount = productDetailDao.getTotalCount(map); 
		System.out.println("totalCount : " + totalCount);
		
		String url = request.getContextPath() +"/" +command ;
		System.out.println("url : " + url);// /ex/list.tv
		  
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		System.out.println("offset : " + pageInfo.getOffset()); // 0
		System.out.println("limit : " + pageInfo.getLimit()); // 5	
		
		List<ProductDetail> lists =productDetailDao.selectDetailAll(pageInfo,map);
		
		ModelAndView mav = new ModelAndView();  
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount); 
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		return mav;
	
	}	
	
	
	@RequestMapping(value=command2,method=RequestMethod.GET, produces = "application/text; charset=utf8")  
	@ResponseBody
	public String doAction2(@RequestParam(value="pnum",required=true) int pnum) {
		System.out.println("------도착------");
		System.out.println("pnum: "+pnum);
		String str = "이설아";
		List<ProductDetail> lists = productDetailDao.getProductsByPnum(pnum);
		String stock = "";
		for(int i=0; i<lists.size(); i++) {
			stock += lists.get(i).getPsize() +"/" + lists.get(i).getPcolor() +"," + lists.get(i).getPstock() +",";
		}
		System.out.println(stock);
		return stock;
		
	}

	
	
	
	
}
