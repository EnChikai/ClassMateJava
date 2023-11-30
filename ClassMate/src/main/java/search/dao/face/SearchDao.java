package search.dao.face;

import java.util.List;

import board.dto.FreeBoard;
import lecture.dto.Class;
import main.dto.SubCategory;
import web.util.Paging;

public interface SearchDao {

	public List<SubCategory> selectSubListByMain(Paging mainList);

	public int selectSubCntAll(Paging param);
	
	public List<Class> selectSubAll(Paging paging);
	
	public int selectClassTitleCntAll(Paging param);
	
	public List<Class> selectClassTitleAll(Paging paging);

	public int selectNickCntAll(Paging param);
	
	public List<FreeBoard> selectNickAll(Paging paging);

	public int selectTitleCntAll(Paging param);
	
	public List<FreeBoard> selectTitleAll(Paging paging);

}
