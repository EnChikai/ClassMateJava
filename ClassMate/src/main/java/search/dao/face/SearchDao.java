package search.dao.face;

import java.util.List;

import board.dto.FreeBoard;
import lecture.dto.Class;
import main.dto.SubCategory;
import web.util.SearchPaging;

public interface SearchDao {

	public List<SubCategory> selectSubListByMain(String keyword);

	public int selectSubCntAll(SearchPaging param);
	
	public List<Class> selectSubAll(SearchPaging paging);

	public int selectNickCntAll(SearchPaging param);
	
	public List<FreeBoard> selectNickAll(SearchPaging paging);

	public int selectTitleCntAll(SearchPaging param);
	
	public List<FreeBoard> selectTitleAll(SearchPaging paging);

}
