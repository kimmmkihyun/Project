package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardDeleteController {
	final String command ="/delete.bd";
	final String gotoPage ="redirect:/list.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET )
	public String doAction(@RequestParam(value="num") int num) {
		
		boardDao.deleteBoard(num);
		
		
		return gotoPage;
	}
}
