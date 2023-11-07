package admin.dao.face;

import java.util.List;

import user.dto.UserInfo;
import web.util.Paging;

public interface AdminDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * 
	 * @return 총 게시글 수
	 */
	public int userInfoCntAll();

	public List<UserInfo> selectAll(Paging paging);
	
}
