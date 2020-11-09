package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ProductDetail;
import admin.model.ProductDetailDao;

@Controller
public class ProductDetailUpdateController {
		
	final String command = "update.detail";
	final String getPage="admin_ProductDetailUpdateForm_4";
	final String gotoPage="redirect:/detaillist.detail";
			
	@Autowired
	private ProductDetailDao productDetailDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="dnum",required = true) int dnum,
							Model model) {
	
			
		ProductDetail productDetail = productDetailDao.getOneProductDetail(dnum);
		model.addAttribute("productDetail", productDetail);
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(ProductDetail productDetail) {
			ModelAndView mav = new ModelAndView();
				
		/*System.out.println("productDetail.getDnum() =" +productDetail.getDnum());
		System.out.println("productDetail.getPcode() =" +productDetail.getPcode());
		System.out.println("productDetail.getPcolor() =" +productDetail.getPcolor());
		System.out.println("productDetail.getPname() =" +productDetail.getPname());
		System.out.println("productDetail.getPnum() =" +productDetail.getPnum());
		System.out.println("productDetail.getPsize() =" +productDetail.getPsize());
		System.out.println("productDetail.getPstock() =" +productDetail.getPstock());
		if(result.hasErrors()) {
			System.out.println("update 오류 발생");
			mav.setViewName(getPage);
			return mav;
		}
		*/	
		int cnt = productDetailDao.UpdateProductDetail(productDetail);
	
		if(cnt>0) {
			mav.setViewName(gotoPage);
			//redirect:/list.ab?pageNumber=pageNumber&pageSize=pageSize 이런식으로 넘겨야한다
		}else {
			mav.setViewName(getPage);
		}
		
			System.out.println("detail update post요청입니다.");
		return mav;
		
	}

	
	
	
}
