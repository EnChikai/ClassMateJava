package teacher.dao.face;

import java.util.HashMap;
import java.util.List;

import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import main.dto.MainCategory;
import main.dto.SubCategory;
import payment.dto.Payment;
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

	/**
	 * classNo가 같은 질문답변 리스트를 가져온다
	 * 
	 * @param classNo2 전달된 classNo(int형)
	 * @return
	 */
	public List<QuestionAnswer> selectQaList(int classNo2);

	
	/**
	 * 
	 * 클래스 번호와 동일한 질문답변의 수를 확인한다
	 * 
	 * @param classNo 전달된 클래스 번호
	 * @return 동일한 클래스번호를 가진 모든 질문답변의 수
	 */
	public int selectCntAll2(int classNo2);
	
	/**
	 * 전달된 qaParam을 이용하여 동일한 질문답변번호의 답변본문을 업데이트한다
	 * 
	 * @param qaParam
	 */
	public void qaUpdate(QuestionAnswer qaParam);



	public List<Class> getClassList(HashMap<String, Object> map);

	public List<Class> getClassList2(HashMap<String, Object> map);

	public List<Payment> getPaymentList(HashMap<String, Object> map);

	public int selectpayDetailCntAll(HashMap<String, Object> map);

	public int selectpayDetailCntAll2(HashMap<String, Object> map);

	/**
	 * 메인 페이지 클래스 총 수를 확인한다
	 * @param map 전달된 클래스 객체 정보
	 * @return
	 */
	public int selectMainCntAll(HashMap<String, Object> map);

	public int selectClassPayDetailCntAll(HashMap<String, Object> map);

	public int selectClassPayDetailCntAll2(HashMap<String, Object> map);

	public List<Class> getOnOffClassList(HashMap<String, Object> map);

	public List<Class> getOnOffClassList2(HashMap<String, Object> map);

	public List<Payment> getOnOffPaymentList(HashMap<String, Object> map);

	
	/**
	 * 유저 번호로 유저 이름을 가져온다
	 * 
	 * @param userNo
	 * @return
	 */
	public String getUserNameByUserNo(int userNo);

	/**
	 * 유저 번호로 강사 정보를 가져온다
	 * 
	 * @param userNo
	 * @return teacher 정보 객체
	 */
	public Teacher getTeacherInfoByUserNoYo(int userNo);

	/**
	 * 전달된 클래스 번호로 클래스 번호가 동일한 강의 정보를 가져온다
	 * 
	 * @param classNo
	 * @return
	 */
	public Class selectpayLectureDetail(int classNo);

	/**
	 * 
	 * 전달된 주소 객체 안 클래스 번호
	 * @param addressParam
	 * @return
	 */
	public Address selectAddressDetail(Address addressParam);

	/**
	 * 전달된 비디오 객체 안 클래스 번호
	 * 
	 * @param videoParam
	 * @return
	 */
	public List<ClassVideo> selectVideoDetail(ClassVideo videoParam);
	/**
	 * 메인 페이지의 클래스 리스트를 불러온다
	 * 
	 * @param 전달된 HashMap 객체
	 * @return 클래스 리스트
	 */
	public List<Class> getMainList(HashMap<String, Object> map);

	/** 
	 * 강사 이미지를 가져온다
	 * 
	 * @param userNo 전달된 유저 번호
	 * @return
	 */
	public String selectByTeacherImg(int userNo);

	

	
}
