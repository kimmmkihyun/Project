package board.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardInsertController {
	
	final String command = "/write.bd";
	final String getPage = "writeForm";
	final String gotoPage = "redirect:/list.bd";
	
	@Autowired    
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	  
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("board") @Valid BoardBean board,
								HttpServletRequest request) {
		 
		board.setIp(request.getRemoteAddr());
		
		
		ModelAndView mav = new ModelAndView();
		boardDao.insertBoard(board);
		mav.setViewName(gotoPage);
		return mav;
		
	}
	
}
