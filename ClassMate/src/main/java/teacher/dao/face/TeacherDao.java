package teacher.dao.face;

import java.util.List;

import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import main.dto.MainCategory;
import main.dto.SubCategory;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import user.dto.UserInfo;

public interface TeacherDao {

	/**
	 * 유저 번호로 강사 번호 값을 찾아온다
	 * 
	 * @param userNo 전달된 유저 번호
	 * @return 조회된 강사 번호
	 */
	public int selectByUserNo(int userNo);

	/**
	 * 강사 번호와 동일한 클래스 번호를 가져온다
	 * 
	 * @param teacherNo 전달된 강사 번호
	 * @return 강사 번호가 동일한 모든 클래스 번호
	 */
	public int selectByteacherNo(int teacherNo);

	/**
	 * 강사 번호와 동일한 클래스를 리스트에 담는다
	 * 
	 * @param teacherNo 전달된 강사 번호
	 * @return 클래스 DTO형식의 List 
	 */
	public List<Class> selectPageList(int teacherNo);

	/**
	 * 강사 번호와 동일한 클래스의 수를 확인한다
	 * 
	 * @param teacherNo 전달된 강사 번호
	 * @return 강사 번호와 동일한 모든 클래스의 수
	 */
	public int selectCntAll(int teacherNo);

	
	/**
	 * 입력된 클래스 정보의 데이터를 확인한다
	 * 
	 * @param lecture 입력된 클래스 넘버 객체
	 * @return 입력된 클래스 객체의 상세 정보
	 */
	public Class selectByClassNo(Class lecture);


	/**
	 * 클래스 번호로 등록된 강의의 수
	 * 
	 * @param classNo 전달된 클래스 번호 정보
	 * @return
	 */
	public int selectAnswerCntAll(int classNo);

	/**
	 * 온클래스 강사 한명의 모든 강의명
	 * 
	 * @param teacherNo 전달된 강사 번호
	 * @return
	 */
	public List<Class> selectTeacherClass(int teacherNo);

	/**
	 * 강사 신청 시 들어가는 강사 정보
	 * 
	 * @param teacherParam 전달된 강사 dto
	 */
	/* public void applyTeacherInsert(Teacher teacherParam); */

	/**
	 * 강사 신청 시 들어가는 강사 사진 정보
	 * 
	 * @param teacherParam 전달된 Teacher 객체
	 */
	public void applyTeacherImgFile(Teacher teacherParam);

	/**
	 * 강사 신청 시 들어가는 강사자격증 정보
	 * 
	 * @param teacherLicence 전달된 라이센스 객체
	 */
	public void applyInsertFile(TeacherLicence teacherLicence);

	/**
	 * 강사 신청 시 신청 번호와 합격 여부 정보를 삽입한다
	 * 
	 * @param teacherApply 전달된 강사 신청 객체
	 */
	public void applyPrcInsert(TeacherApply teacherApply);

	/**
	 *  유저번호와 동일한 유저 이름을 조회한다
	 * @param userNo 전달된 유저번호
	 * @return
	 */
	public UserInfo selectNameByUserNo(int userNo);

	
	/**
	 * 메인 카테고리 번호를 조회한다
	 * 
	 * @param mainCategoryParam 전달된 메인 카테고리 값
	 * @return
	 */
	public int selectByCategoryName(MainCategory mainCategoryParam);

	
	/**
	 * 서브 카테고리 번호를 조회한다
	 * 
	 * @param subCategoryParam 전달된 서브 카테고리 값 (메인카테고리넘버, 서브카테고리네임)
	 * @return
	 */
	public int selectBySubCategoryName(SubCategory subCategoryParam);

	/**
	 * 강의 번호를 sequence로 생성한다
	 * 
	 * @return
	 */
	public int selectByInsertClassNo();

	/**
	 * 강의 클래스를 등록한다
	 * 
	 * @param registLecture 전달된 클래스 파라미터 값 (강의 영상, 주소 제외 강의 영상과 주소는 따로 DB가 존재한다)
	 */
	public void registClassInsert(Class registLecture);

	/**
	 * onOff 값이 0일 때 주소 파라미터를 서버 addreddDB에 삽입한다
	 * 
	 * @param addressParam 전달된 주소 파타미터
	 */
	public void insertAddress(Address addressParam);

	
	/**
	 * on클래스 동영상 파일을 저장한다
	 * 
	 * @param classVideo 전달된 classVido 객체 정보
	 */
	public void onClassInsertFile(ClassVideo classVideoParam);


	

	
}
