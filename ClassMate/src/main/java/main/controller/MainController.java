package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import main.service.face.MainService;
import user.dto.UserInfo;
import web.util.MainClassListPaging;

@Controller
@RequestMapping("/main")
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService mainService;
	
	@GetMapping("/main")
	public void main( Model model ) {
		
		List<UserInfo> list = mainService.listAll();
//		System.out.println(list);
		model.addAttribute("list", list);
		
		
	}
	
	@GetMapping("/site")
	public void siteIntroduction() {
		
	}
	
	@GetMapping("/mainCategory")
	public void mainCategory( HttpSession session, Model model ){
		
		List<MainCategory> list = mainService.mainCategoryList();
//		System.out.println(list);
//		logger.info("mainCategory : {}", list);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/subCategory")
	public void subCategory( SubCategory subCategory, Model model ) {
//		System.out.println(subCategory);
		
		List<SubCategory> list = mainService.subCategoryList(subCategory);
		
			
		model.addAttribute("list", list);
		
//		System.out.println(list);
	}
	
	   @GetMapping("/onClassList")
	    public void onClassList(Class cLass, Model model, MainClassListPaging paging) {
//		   logger.info("ONCLASS {}", cLass);
		   
		   Map<String, Object> map = new HashMap<>(); 
		   
	       map = mainService.onClassList(cLass, paging);
	       model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
	       model.addAttribute("onClassList", map.get("list"));
	       logger.info("paging {}", map.get("paging1"));
	       model.addAttribute("paging",map.get("paging1"));
	    }
	   
	   @PostMapping("/onClassList")
	   @ResponseBody
	   public Map<String, Object> onClassListProc(Class cLass, Model model, MainClassListPaging paging) {
		   Map<String, Object> list = mainService.onClassList(cLass, paging);
//		   System.out.println(list);
		   return list;
	   }

	   @GetMapping("/offClassList")
	   @ResponseBody
	   public List<Class> offClassList(Class cLass, Model model) {
	   	   logger.info("offCLASS {}", cLass);
	       List<Class> list = mainService.offClassList(cLass);
	       model.addAttribute("offClassList", list);
	       return list;
	   }

}
