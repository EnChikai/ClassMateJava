package admin.service.face;

import java.util.List;

import user.dto.UserInfo;
import web.util.Paging;

public interface AdminService {

	/**
	 * 유저 목록을 위한 페이징 객체를 생성
	 * 
	 * 전달파라미터 객체의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 유저 수
	 * 
	 * 두가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 * 
	 * @param param - curPage정보를 담고 있는 객체
	 * @return 페이징 계산이 완료된 객체
	 */
	public Paging getPaging(Paging param);
	
	public List<UserInfo> userInfoList(Paging param);
	
	

}
