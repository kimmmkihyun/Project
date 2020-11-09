package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardReadcountUpdateController {

    final String command="read.bd";
    final String gotoPage="redirect:/list.bd";
    
    @Autowired
    BoardDao boardDao;

    @RequestMapping(command) 
    public String doAction(@RequestParam(value = "num") int num) {
	
	
	boardDao.readcountboard(num);
	
	//bean.setReadcount(readcount);
	
	return gotoPage;
    }
    
}
