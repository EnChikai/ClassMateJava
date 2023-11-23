package search.service.face;

import java.util.List;

import board.dto.FreeBoard;
import lecture.dto.Class;
import main.dto.SubCategory;
import web.util.SearchPaging;

public interface SearchService {
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	전달파라미터 객체의 curPage - 현재 페이지
	 *  DB에서 조회한 totalCount - 총 게시글 수
	 *  
	 *  두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 * 
	 * @param param - curPage정보를 담고 있는 객체
	 * @return 페이징 계산이 완료된 객체
	 */
//	public SearchPaging getPaging(SearchPaging param);

	/**
	 * 메인카테고리를 입력했을때 나오는 서브카테고리 검색결과
	 * 
	 * @param keyword
	 * @return 
	 */
	public List<SubCategory> mainList(String keyword);

	/**
	 * 서브카테고리를 입력했을때 나오는 클래스 검색결과
	 * 
	 * @param paging
	 * @return
	 */
	public List<Class> subList(SearchPaging paging);
	public SearchPaging getSubPaging(SearchPaging param);
	
	

	/**
	 * 닉네임을 입력했을때 나오는 게시글 검색결과
	 * 
	 * @param paging
	 * @return
	 */
	public List<FreeBoard> nickList(SearchPaging paging);
	public SearchPaging getNickPaging(SearchPaging param);

	
	/**
	 * 제목을 입력했을때 나오는 게시글 검색결과
	 * 
	 * @param paging
	 * @return
	 */
	public List<FreeBoard> titleList(SearchPaging paging);
	public SearchPaging getTitlePaging(SearchPaging param);




	
	
}
