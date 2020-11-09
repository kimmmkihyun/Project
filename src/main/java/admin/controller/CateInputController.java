package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Category;
import admin.model.CategoryDao;

@Controller
public class CateInputController {   //admin에서 카테등록 요청시

	final String command ="input.cate";
	final String getPage ="admin_CateInputForm_4";
	final String gotoPage = "redirect:/list.cate";
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
 	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
 	public ModelAndView doAction(@Valid Category category, BindingResult result,
 								HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			System.out.println("카테고리 입력 오류 발생");
			mav.setViewName(getPage);
			return mav;
			//return new ModelAndView(getPage);
		}
		/*
		 * String a = request.getParameter("code"); String b =
		 * request.getParameter("cname"); String csum = a+b;
		 * System.out.println("csum : "+csum);
		 */
		categoryDao.insertCate(category);
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
	
}
