package teacher.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import web.util.Paging;
import web.util.TeacherMainPaging;

public interface TeacherService {


	/**
	 * 강사의 모든 강의 리스트를 불러온다
	 * 
	 * 전달파라미터 객체의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 * 
	 * @param param - curPage정보를 담고 있는 객체
	 * @param userNo 
	 * @param userNo 페이징 계산이 완료된 객체
	 * @return
	 */
	public TeacherMainPaging getPaging(TeacherMainPaging param, int userNo);

	/**
	 * 강의 상세보기
	 * 
	 * @param lecture 상세 조회할 강의 번호 객체
	 * @return 조회된 상세 강의 정보
	 */
	public Class teacherClassDetail(Class lecture);

	
	/**
	 * 강의 등록 처리
	 *  + 강의 파일들을 첨부한다 (on클래스 영상 여러 개 첨부 가능, off 클래스 주소)
	 * @param userParam 
	 * @param teacherParam 
	 *  
	 * @param registLecture 강의 정보 객체
	 * @param subCategoryParam 	전달되는 서브카테고리 객체
	 * @param mainCategoryParam 전달되는 메인카테고리 객체
	 * @param classVideoParam  전달되는 클래스비디오 객체
	 * @param addressParam  전달되는 주소 객체
	 * @param file 전달되는 강의 첨부파일 리스트
	 * @param session 
	 * @param singleFile 전달되는 단일이미지파일 리스트
	 */
	public void classRegist(Teacher teacherParam, UserInfo userParam, Class registLecture, Address addressParam, 
			ClassVideo classVideoParam, MainCategory mainCategoryParam, SubCategory subCategoryParam, MultipartHttpServletRequest request
			, @RequestParam("fileCount") int fileCount, List<MultipartFile> singleFile, HttpSession session);

	
	/**
	 * 강사의 한 강의 클래스의 모든 리스트를 불러온다
	 * 
	 * 전달파라미터 객체의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * 
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 * 
	 * @param param		curPage정보를 담고 있는 객체
	 * @param userNo	페이징 계산이 완료된 객체
	 * @return
	 */
	public TeacherMainPaging getAnswerPaging(TeacherMainPaging param, int userNo);

	
	/**
	 * 온클래스 강사의 강사명을 List로 가져온다 
	 * 
	 * @param session 강사번호가 저장된 session 파라미터
	 * @param param 페이징 계산이 완료된 파라미터
	 * @return
	 */
	public List<Class> answerDrop(HttpSession session, TeacherMainPaging param);

	/**
	 * 강사 신청 시 teacher, teacherLicence 파일을 작성한다
	 * 
	 * @param teacherParam 전달된 teacher 정보
	 * @param teacherLicenceParam 전달된 teacherLicence 정보
	 * @param file 첨부할 파일 리스트
	 */
	public void applyWrite(Teacher teacherParam, TeacherLicence teacherLicenceParam, TeacherApply teacherApply ,List<MultipartFile> file, List<MultipartFile> singleFile);

	/**
	 * qa 목록조회
	 * 
	 * @param session
	 * @param classNo 전달된 QA param 객체
	 * @return
	 */
	public List<QuestionAnswer> qalistPost( String classNo);

	/**
	 * 동일한 클래스 번호의 모든 질문 답변 리스트를 가져온다
	 * 
	 * 전달파라미터 객체의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * @param param curPage정보를 담고 있는 객체
	 * @param classNo 페이징 계산이 완료된 객체
	 * @return
	 */
	public TeacherMainPaging getPaging(TeacherMainPaging param, String classNo);

	/**
	 * 전달된 질문답변번호, 답변 내용을 전달하여 업데이트해준다
	 * 
	 * @param qaParam 전달된 질문답변번호, 답변내용
	 */
	public void qaParamUpdate(QuestionAnswer qaParam);
	
	//강사 정산 내역

	public HashMap<String, Object> getpayDetail(Class lecture, Payment payment, HashMap<String, Object> map, Paging paging, HttpSession session, String onOff);

			//강사 페이징
	public Paging getPaging(Paging param, HttpSession session, HashMap<String, Object> map, String onOff);

	public Paging getPaging2(Paging param, HttpSession session, HashMap<String, Object> map, String onOff);

	public Paging getPaging3(TeacherMainPaging param, HttpSession session, HashMap<String, Object> map);

	public HashMap<String, Object> getClassPayDetail(Class lecture, Payment payment, HashMap<String, Object> map, Paging onPaging, HttpSession session, String onOff);

	/**
	 * 유저 넘버로 이름 가져오기
	 * 
	 * @param userNo
	 * @return
	 */
	public String getNameByUserNo(int userNo);

	/**
	 * 유저 넘버로 강사 정보 가져오기
	 * 
	 * @param userNo
	 * @return
	 */
	public Teacher getTeacherInfoByUserNo(int userNo);

	/**
	 *조회 
	 * 
	 * @param lecture
	 * @param map
	 * @param paging
	 * @param session
	 * @param onOff
	 * @return
	 */
	public HashMap<String, Object> getCheckDetail(Class lecture, HashMap<String, Object> map, Paging paging,
			HttpSession session, String onOff);

	public HashMap<String, Object> getCheckMain(Class lecture, HashMap<String, Object> map, Paging paging,
			HttpSession session);

	
	public HashMap<String, Object> getClassCheckDetail(Class lecture, HashMap<String, Object> map, Paging onPaging,
			HttpSession session, String onOff);

	/**
	 * 전달된 classNo로 classNo 상세 정보를 가져온다
	 * 
	 * @param lecture 조회된 상세정보
	 * @return
	 */
	public Class detailView(Class lecture);

	/**
	 * 전달된 강의 번호로 주소값을 가져온다
	 * @param addressParam
	 * @return
	 */
	
	public Address detailAddressView(Address addressParam);

	
	/**
	 * 
	 * 전달된 강의 번호로 비디오 값을 가져온다
	 * @param videoParam 전달된 비디오 정보
	 * @return
	 */
	public List<ClassVideo> detailVideoView(ClassVideo videoParam);

	/**
	 * 유저 번호로 강사 이름을 가져온다
	 * 
	 * @param userNo
	 * @return
	 */
	public String getTeacherName(int userNo);

	/**
	 * 
	 * 유저 번호로 강사 이미지를 가져온다
	 * @param userNo
	 * @return
	 */
	public String getTeacherImg(int userNo);

	public String getMaincategory(int mainCategoryNo);

	public String getSubcategory(int subCategoryNo);

	



	
	
}
