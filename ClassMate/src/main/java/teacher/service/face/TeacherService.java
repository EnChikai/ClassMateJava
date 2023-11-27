package teacher.service.face;

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
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import user.dto.UserInfo;
import web.util.TeacherMainPaging;

public interface TeacherService {

	/**
	 * 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체 
	 * @return 게시글 목록
	 */
	public List<Class> pageList(TeacherMainPaging paging, int userNo);

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
	 * qa 목록 조회
	 * 
	 * @param paging 페이징 정보 객체 
	 * @param userNo qa 목록
	 * @return
	 */
	public List<QuestionAnswer> qaList(TeacherMainPaging paging, int userNo);

	
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

	
	
}
