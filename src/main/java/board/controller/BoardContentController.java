package board.controller;



import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardComments;
import board.model.BoardCommentsDao;
import board.model.BoardDao;

@Controller
public class BoardContentController {

    final String command = "content.bd";
    final String getPage = "contentForm";

    @Autowired
    private BoardDao boardDao;

    @Autowired
    BoardCommentsDao boardCommentsDao;

    @RequestMapping(value=command,method=RequestMethod.GET)
    public ModelAndView doAction(@RequestParam(value = "num") int num) {
   System.out.println("get 방식");
   System.out.println("num : " +num);
   BoardBean bean = boardDao.getOneBoard(num);
   
   List<BoardComments> lists = boardCommentsDao.selectComments(num);
   ModelAndView mav = new ModelAndView();
   
   
   if(lists.size() == 0) {
       mav.addObject("bean", bean);
       mav.setViewName(getPage);
       return mav;
   }else {
   mav.addObject("boardComments", lists);
   mav.addObject("bean", bean);
   mav.setViewName(getPage);
   }
   return mav;
    }
   
    @RequestMapping(value=command,method=RequestMethod.POST)
    public ModelAndView doAction(HttpServletRequest request,BoardComments boardComments) {
   
   ModelAndView mav = new ModelAndView();
   int cnum = Integer.parseInt(request.getParameter("cnum"));

   BoardBean bean = boardDao.getOneBoard(cnum);
   List<BoardComments> lists = boardCommentsDao.selectComments(cnum);  
   
   System.out.println("lists.size() : "+lists.size());
   
   for(int i=0;i<lists.size()+1;i++) {
           if(lists.size() != 0) {
               if(lists.get(i).getCcnum() == cnum) {
              System.out.println("update");
              boardCommentsDao.updateCom(boardComments);
              break;
               }
           }else {
               System.out.println("insert");
               System.out.println(boardComments.getCname());
               System.out.println(boardComments.getCnum());
               boardCommentsDao.insertComments(boardComments);
               System.out.println("나간다");
           }    
           System.out.println("for나간다");
   }

   lists = boardCommentsDao.selectComments(cnum);

   mav.addObject("bean", bean);
   mav.addObject("boardComments", lists);
   mav.setViewName(getPage);

   return mav;
    }

}



