package search.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.dto.FreeBoard;
import search.service.face.SearchService;
import web.util.SearchPaging;
import main.dto.SubCategory;
import lecture.dto.Class;

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
	public void all(SearchPaging param, Model model, String keyword) {
	
//		SearchPaging paging = searchService.getPaging(param);
//		logger.info("{}", paging);
		
	}
	
	//---------------------------------------------------------------------
	
	//메인카테고리 검색어 입력시 해당 메인카테고리의 서브카테고리 리스트 나열
	@RequestMapping("/main")
	public void main(Model model, String keyword) {
		
		List<SubCategory> list = searchService.mainList(keyword);
		
		model.addAttribute("list", list);
		
	}
	
	//---------------------------------------------------------------------
	
	//서브카테고리 검색어 입력시 해당 서브 카테고리의 강의 리스트 나열
	@RequestMapping("/sub")
	public void sub(SearchPaging param, Model model) {
		logger.info("param : {}", param);
		SearchPaging paging = searchService.getSubPaging(param);
		logger.info("{}", paging);
		
		List<Class> list = searchService.subList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	//닉네임 검색어 입력시 검색어가 포함된 닉네임 유저의 게시글 리스트 나열
	@RequestMapping("/nick")
	public void nick(SearchPaging param, Model model) {
		
		SearchPaging paging = searchService.getNickPaging(param);
		logger.info("{}", paging);
	
		List<FreeBoard> list = searchService.nickList(paging);
		logger.info("FreeBoardList : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	//제목 검색어 입력시 검색어가 게시글의 제목에 포함된 게시글 리스트 나열
	@RequestMapping("/title")
	public void title(SearchPaging param, Model model) {
		
		SearchPaging paging = searchService.getTitlePaging(param);
		logger.info("{}", paging);
	
		List<FreeBoard> list = searchService.titleList(paging);
		logger.info("FreeBoardList : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
}
