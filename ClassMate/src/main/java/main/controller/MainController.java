package main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import main.service.face.MainService;
import user.dto.UserInfo;

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
	    public void onClassList(Class cLass, Model model) {
	        List<Class> list = mainService.onClassList(cLass);
	        model.addAttribute("onClassList", list);
	    }

	    @GetMapping("/offClassList")
	    public void offClassList(Class cLass, Model model) {
	        List<Class> list = mainService.offClassList(cLass);
	        model.addAttribute("offClassList", list);
	    }

}
