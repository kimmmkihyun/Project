package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	final String command = "/delete.me";
	final String gotoPage = "redirect:/list.me";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="mnum") int mnum,
							@RequestParam(value="pageNumber") int pageNumber,
							Model model) {
		memberDao.deleteData(mnum);
		
		model.addAttribute("pageNumber");
		
		return gotoPage+"?mnum="+mnum+"&pageNumber="+pageNumber;
	}
	
}
