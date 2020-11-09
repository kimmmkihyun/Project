package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class MemberListController {
	final String command = "/list.me";
	final String getPage = "MemberList_4";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="whatColumn",required = false) String whatColumn,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam(value="pageNumber", required = false) String pageNumber,
								@RequestParam(value="pageSize", required = false) String pageSize,
								HttpServletRequest request) {
		
		//입력한 칼럼 혹은 이름관련 회원만 한번에 묶는 코드
		Map<String,String> mlist = new HashMap<String, String>();
		mlist.put("whatColumn", whatColumn);
		mlist.put("keyword", "%"+keyword+"%");
		
		//등록된 회원이 몇명인지 확인하는 코드
		int totalCount = memberDao.getTotalCount(mlist);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		//등록된 회원을 페이지에 맞게 나누어 출력시키는 코드
		List<Member> lists = memberDao.getMemberList(pageInfo,mlist);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		
		return mav;
	}
}
