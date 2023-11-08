package main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import main.service.face.MainService;
import user.dto.UserInfo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired MainService mainService;
	
	@GetMapping("/main")
	public void main( Model model ) {
		
		List<UserInfo> list = mainService.listAll();
		System.out.println(list);
		model.addAttribute("list", list);
		
		
	}
	
	@GetMapping("/site")
	public void siteIntroduction() {
		
	}

}
