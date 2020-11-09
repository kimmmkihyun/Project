package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Category;
import admin.model.CategoryDao;

@Controller
public class CateUpdateController {
	final String command = "update.cate";
	final String getPage = "admin_CateUpdateForm_4";
	final String gotoPage = "redirect:/list.cate";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(value=command , method = RequestMethod.GET) 
	public String doAction(@RequestParam(value="cnum") int cnum,
							@RequestParam(value="pageNumber",required = true) int pageNumber,
							@RequestParam("pageSize") int  pageSize,
							Model model) {
		
		Category category = categoryDao.getOneCate(cnum);
		
		model.addAttribute("category", category);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize);
		
		return getPage;
	}
	
	@RequestMapping(value=command , method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam("pageNumber") int pageNumber,
								@RequestParam("pageSize") int pageSize,
								@ModelAttribute("category") @Valid Category category,
								BindingResult result) {
		
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.addObject("pageNumber", pageNumber);
			mav.addObject("pageSize", pageSize);
			mav.setViewName(getPage); //updateForm갈때
			return mav;
		}
		
		int cnt = categoryDao.updateCate(category); 
		if(cnt>0) {
			mav.setViewName(gotoPage+"?pageNumber="+pageNumber+"&pageSize="+pageSize);
			//redirect:/list.ab?pageNumber=pageNumber&pageSize=pageSize 이런식으로 넘겨야한다
		}else {
			mav.setViewName(getPage);
		}
		return mav;
	
	}
	
	
	
	
	
}
