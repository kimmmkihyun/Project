package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.Product;
import admin.model.ProductDao;

@Controller
public class ProductDeleteController {
	
	final String command ="delete.prd";
	final String gotoPage = "redirect:/list.prd";
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command) 
	public String doAction(@RequestParam(value="pnum") int pnum,
			@RequestParam(value="pageNumber",required = true) int pageNumber){
		
	    	Product product = productDao.getOneProduct(pnum);
		System.out.println(product.getPimage());
	    
	    	String uploadPath = servletContext.getRealPath("/resources");
		System.out.println("uploadPath : "+uploadPath);
		//C:\SpringWorkspace_kkh\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_MyBatis_Products\resources\a.jpg

		File deFile = new File(uploadPath+ File.separator +product.getPimage());
		deFile.delete();
	    
		productDao.deleteProduct(pnum);
		
		return gotoPage+"?pageNumber="+pageNumber;
	}

}
