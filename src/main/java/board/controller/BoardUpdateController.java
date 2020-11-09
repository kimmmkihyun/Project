package board.controller;

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

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardUpdateController {

	final String command = "/update.bd";
	final String getPage = "updateForm";
	final String gotoPage = "redirect:/list.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("num")int num,
							Model model							
			) {
		BoardBean board = boardDao.getOneBoard(num);
		model.addAttribute("board", board);				
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("board") @Valid BoardBean board,
			BindingResult result) {
		 		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			
			return mav;
		}
		
		int cnt = boardDao.updateOneBoard(board);
		
		if(cnt>0) {
			mav.setViewName(gotoPage);
		}else {
			mav.setViewName(getPage);
		}
		
		return mav;
		
	}
	
}
