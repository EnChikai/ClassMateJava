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
import org.springframework.web.bind.annotation.RequestMapping;

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
	   public void onClassList(Class cLass, Model model, MainClassListPaging paging, String sort) {
//		   logger.info("ONCLASS {}", cLass);
		   
		   Map<String, Object> map = new HashMap<>(); 
		  
	       map = mainService.onClassList(cLass, paging);
	       model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
	       model.addAttribute("onClassList", map.get("list"));
	       model.addAttribute("paging",map.get("paging1"));
	       if (sort != null) {
			   if( sort.equals("expense") ) {
					logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseNo",1);
				   
			   } else if( sort.equals("class_no desc") ) {
					logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("classDescNo",2);
				   
				   
			   } else if( sort.equals("expense desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseDescNo",3);
				   
			   } else if(sort.equals("order_no desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("orderNoDesc",4);
				   
			   }
		   }
	   }
	   

	   @GetMapping("/offClassList")
	   public void offClassList(Class cLass, Model model, MainClassListPaging paging, String sort) {
//	   	   logger.info("offCLASS {}", cLass);
	   	   
	   	   Map<String, Object> map = new HashMap<>();
	   	   map = mainService.offClassList(cLass, paging);
	       model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
	       model.addAttribute("offClassList", map.get("list"));
	       model.addAttribute("paging",map.get("paging1"));
	       
	       if (sort != null) {
			   if( sort.equals("expense") ) {
					logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseNo",1);
				   
			   } else if( sort.equals("class_no desc") ) {
					logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("classDescNo",null);
				   
				   
			   } else if( sort.equals("expense desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseDescNo",3);
				   
			   } else if(sort.equals("order_no desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("orderNoDesc",4);
				   
			   }
		   }
	       
	   }
	   
	   @GetMapping("/onClassView")
	   public void onClassView( Class cLass, Model model) {
		   List<Class> list = mainService.onClassViewList(cLass);
//		   logger.info("list : {}", list);
		   model.addAttribute("list",list);
		   
	   }

}
