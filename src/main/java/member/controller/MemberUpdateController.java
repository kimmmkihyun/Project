package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import member.model.Member;
import member.model.MemberDao;

@Controller 
public class MemberUpdateController {
	
	final String command="/update.me";
	final String getPage="MemberUpdateForm_4";
	final String gotoPage="redirect:/list.me";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value="mnum") int mnum,
							@RequestParam(value="pageNumber") int pageNumber,
							Model model) {
		
		Member member= memberDao.getOneMember(mnum);
		System.out.println("mnum:"+mnum);
		model.addAttribute("member", member);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@Valid Member member,
								@RequestParam("pageNumber") int pageNumber,
								BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(getPage); //updateForm갈때
			return mav;
		}
		
		int cnt = memberDao.updateMem(member);
		System.out.println("cnt:"+cnt);
		
		if(cnt>0) {
			mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
			//redirect:/list.ab?pageNumber=pageNumber&pageSize=pageSize 이런식으로 넘겨야한다
		}else {
			mav.setViewName(getPage);
		}
		return mav;
	
	}
	
}
