package search.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.dto.FreeBoard;
import lecture.dto.Class;
import main.dto.SubCategory;
import search.service.face.SearchService;
import web.util.Paging;

@Controller
@RequestMapping("/search")
public class SearchController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired private SearchService searchService;
	
	@RequestMapping("/searchTest")
	public void searchTest (Model model) {
		
	}
	
	
	//전체 검색어 입력시 아래 모든 검색결과의 리스트 나열
	@RequestMapping("/all")
	public void all(Paging param, Model model) {
	
//		SearchPaging paging = searchService.getPaging(param);
		logger.info("keyword : {}", param);
		
		//메인
		List<SubCategory> list = searchService.mainList(param);
		
		logger.info("list : {}", list);
		model.addAttribute("search", param.getSearch());
		model.addAttribute("list", list);
		
		Paging paging = searchService.getSubPaging(param);
		logger.info("{}", paging);
		
		
		
		
		
		//서브
		List<Class> list1 = searchService.subList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list1", list1);
		
		logger.info("list1 : {}", list1);
		paging = searchService.getClassTitlePaging(param);
		logger.info("{}", paging);
		
		
		
		
		
		
		//클래스 제목
		List<Class> list2 = searchService.classTitleList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list2", list2);
		
		paging = searchService.getNickPaging(param);
		logger.info("list2 {}", list2);
		
		
		
		
		
		
		
		//닉네임
		List<FreeBoard> list3 = searchService.nickList(paging);
		logger.info("FreeBoardList : {}", list3);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list3", list3);
		
		paging = searchService.getTitlePaging(param);
		logger.info("list3 {}", list3);
		
		
		
		
		
		
		
		//게시글 제목
		List<FreeBoard> list4 = searchService.titleList(paging);
		logger.info("FreeBoardList : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list4", list4);
		logger.info("list4 {}", list4);
		
		
		
	}
	
	//---------------------------------------------------------------------
	
	//메인카테고리 검색어 입력시 해당 메인카테고리의 서브카테고리 리스트 나열
	@RequestMapping("/main")
	public void main(Model model, Paging param) {
		
		List<SubCategory> list = searchService.mainList(param);
		
		model.addAttribute("list", list);
		
	}
	
	//---------------------------------------------------------------------
	
	//서브카테고리 검색어 입력시 해당 서브 카테고리의 강의 리스트 나열
	@RequestMapping("/sub")
	public void sub(Paging param, Model model) {
		logger.info("param : {}", param);
		Paging paging = searchService.getSubPaging(param);
		logger.info("{}", paging);
		
		List<Class> list = searchService.subList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	//클래스이름 검색어 입력시 강의 리스트 나열
	@RequestMapping("/classTitle")
	public void class_title(Paging param, Model model) {
		logger.info("param : {}", param);
		Paging paging = searchService.getClassTitlePaging(param);
		logger.info("{}", paging);
		
		List<Class> list = searchService.classTitleList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	//닉네임 검색어 입력시 검색어가 포함된 닉네임 유저의 게시글 리스트 나열
	@RequestMapping("/nick")
	public void nick(Paging param, Model model) {
		
		Paging paging = searchService.getNickPaging(param);
		logger.info("{}", paging);
	
		List<FreeBoard> list = searchService.nickList(paging);
		logger.info("FreeBoardList : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	//제목 검색어 입력시 검색어가 게시글의 제목에 포함된 게시글 리스트 나열
	@RequestMapping("/title")
	public void title(Paging param, Model model) {
		
		Paging paging = searchService.getTitlePaging(param);
		logger.info("{}", paging);
	
		List<FreeBoard> list = searchService.titleList(paging);
		logger.info("FreeBoardList : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
}
