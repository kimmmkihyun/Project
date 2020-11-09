package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {
	
	final String command = "/list.bd";
	final String getPage ="list";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(HttpServletRequest request,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="pageSize", required = false) String pageSize) {
		   
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn",whatColumn); 
		map.put("keyword", "%"+keyword+"%"); 
		
		int totalCount =boardDao.getTotalCount(map);
		String url = request.getContextPath() +  command; 
		
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		 List<BoardBean> lists = boardDao.getBoardList(pageInfo,map);
		 
		 ModelAndView mav = new ModelAndView();      
		 mav.addObject("lists", lists);
		 mav.addObject("pageInfo",pageInfo);
		 mav.setViewName(getPage);
		return mav;
	} 
}