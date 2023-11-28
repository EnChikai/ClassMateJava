package user.service.face;

import teacher.dto.Teacher;
import user.dto.UserInfo;

public interface UserService {

	public void join(UserInfo userInfo); //회원가입
	
	public UserInfo loginPost(UserInfo userInfo); //로그인

	public Teacher getTeacherNo(Teacher teacher); //강사 번호 조회

	public boolean checkDuplicateId(String userId); //중복 ID확인

	/**
	 * 기존 회원정보 가져오기
	 * 
	 * @param userInfo (userNo만 포함)
	 * @return userInfo (모든 데이터 포함)
	 */
	public UserInfo updateInfo(UserInfo userInfo);

	public int updateOutUser(UserInfo userInfo);

	public int updateUserData(UserInfo userInfo);

	public String searchInfo(UserInfo userInfo); //아이디 찾기

	/**
	 * 아이디와 이름을 기반으로 사용자 정보를 확인합니다.
	 * @param userInfo - 아이디와 이름이 포함된 사용자 정보
	 * @return true: 사용자 정보가 일치, false: 사용자 정보 불일치
	 */
	public boolean checkUserInfo(UserInfo userInfo);

	public int updatePw(UserInfo userInfo);
	
    /**
     * 비밀번호 업데이트
     * @param userInfo - 비밀번호 업데이트에 필요한 정보를 가진 객체
     * @return true: 업데이트 성공, false: 업데이트 실패
     */
	public boolean updatePassword(UserInfo userInfo);

	public boolean findPassword(UserInfo userInfo);

	public boolean checkPassword(String userId, String userPw);

}
