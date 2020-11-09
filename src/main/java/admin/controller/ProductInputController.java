	package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Category;
import admin.model.CategoryDao;
import admin.model.Product;
import admin.model.ProductDao;
import net.sf.json.JSONArray;

@Controller
public class ProductInputController {  //admin에서 상품등록 요청시

		final String command ="/input.prd";
		final String getPage ="admin_ProductInputForm_4";
		final String gotoPage = "redirect:/list.prd";
		
		@Autowired
		private CategoryDao categoryDao;
		
		@Autowired
		private ProductDao productDao;
		
		@Autowired
		ServletContext servletContext; 
		
		@RequestMapping(value=command,method = RequestMethod.GET)
		public String doAction(Category category,Model model) {
			
			//List<Category> lists = categoryDao.selectAll(); 
			//model.addAttribute("lists", lists);
			return getPage;
		}
	
	  @RequestMapping(value=command,method = RequestMethod.POST) 
	  public ModelAndView doAction(@Valid Product product, BindingResult result,HttpServletRequest request) {
		  
		  String pspec = request.getParameter("pspec");
		  System.out.println("pspec: " +pspec);
		  
		  ModelAndView mav = new ModelAndView();
		  
		  
			if(result.hasErrors()) {
				System.out.println("유효성 검사 오류입니다.");
				mav.setViewName(getPage);
				return mav;
				//return new ModelAndView(getPage);
			}
			
			
			MultipartFile multi = product.getUpload();  //interface 이기 때문에 객체는 생성하지 못한다.
			
			// request.getContextPath();  ex/ 
			System.out.println("servletContext.getRealPath('/') : " + servletContext.getRealPath("/"));
			//C:\SpringWorkspace_kkh\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_MyBatis_Products\
		
			String uploadPath = servletContext.getRealPath("/resources");
			System.out.println("uploadPath : "+uploadPath);
			//C:\SpringWorkspace_kkh\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_MyBatis_Products\resources\a.jpg
			
			System.out.println("선택한 화일명 : " +product.getPimage() );
			File file = new File(uploadPath+ File.separator +product.getPimage()); //resources 안에 들어가진다.
			
			try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
			
			productDao.insertProduct(product);
			
			mav.setViewName(gotoPage);
			return mav;
		}
		
	 
	
}
