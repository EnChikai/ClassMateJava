package search.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dto.FreeBoard;
import lecture.dto.Class;
import main.dto.SubCategory;
import search.dao.face.SearchDao;
import search.service.face.SearchService;
import web.util.SearchPaging;

@Service
public class SearchServiceImpl implements SearchService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired private SearchDao searchDao;
	
	@Override
	public List<SubCategory> mainList(String keyword) {
		return searchDao.selectSubListByMain(keyword);
	}

//-----------------------------------------------------------------------------

	@Override
	public SearchPaging getSubPaging(SearchPaging param) {
		//총 게시글 수 조회
		int totalCount = searchDao.selectSubCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		SearchPaging paging = new SearchPaging( totalCount, param.getCurPage() );
		paging.setSearch( param.getSearch() );
		
		return paging;
	}
	
	@Override
	public List<Class> subList(SearchPaging paging) {
		return searchDao.selectSubAll(paging);
	}

//-----------------------------------------------------------------------------

	@Override
	public SearchPaging getNickPaging(SearchPaging param) {
		logger.info("getNickPaging()");
		//총 게시글 수 조회
		int totalCount = searchDao.selectNickCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		SearchPaging paging = new SearchPaging( totalCount, param.getCurPage() );
		paging.setSearch( param.getSearch() );
		
		return paging;
	}

	@Override
	public List<FreeBoard> nickList(SearchPaging paging) {
		logger.info("nickList()");
		return searchDao.selectNickAll(paging);
	}
	
//-----------------------------------------------------------------------------
	
	@Override
	public SearchPaging getTitlePaging(SearchPaging param) {
		logger.info("getTitlePaging()");
		//총 게시글 수 조회
		int totalCount = searchDao.selectTitleCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		SearchPaging paging = new SearchPaging( totalCount, param.getCurPage() );
		paging.setSearch( param.getSearch() );
		
		return paging;
	}
	
	@Override
	public List<FreeBoard> titleList(SearchPaging paging) {
		logger.info("titleList()");
		return searchDao.selectTitleAll(paging);
	}
	
	
}
