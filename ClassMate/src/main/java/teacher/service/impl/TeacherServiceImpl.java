package teacher.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import main.dto.MainCategory;
import main.dto.SubCategory;
import teacher.dao.face.TeacherDao;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import teacher.service.face.TeacherService;
import user.dto.UserInfo;
import web.util.TeacherMainPaging;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private TeacherDao teacherDao;
	
	@Autowired ServletContext context;

	@Override
	public List<Class> pageList(TeacherMainPaging paging, int userNo) {
		
		int teacherNo = teacherDao.selectByUserNo(userNo);
		
		int classNo = teacherDao.selectByteacherNo(teacherNo);
		
		List<Class> list = teacherDao.selectPageList(teacherNo);
					
		return list;
	}

	@Override
	public TeacherMainPaging getPaging(TeacherMainPaging param, int userNo) {

		int teacherNo = teacherDao.selectByUserNo(userNo);
		
		int totalCount = teacherDao.selectCntAll(teacherNo);
		
		TeacherMainPaging paging = new TeacherMainPaging(totalCount, param.getCurPage());
		
		return paging;
	}

	@Override
	public Class teacherClassDetail(Class lecture) {
	
		Class detailLecture = teacherDao.selectByClassNo(lecture);
		
		return detailLecture;
	}


	@Override
	@Transactional
	public void classRegist(Teacher teacherParam, UserInfo userParam, Class registLecture, Address addressParam,
			ClassVideo classVideoParam, MainCategory mainCategoryParam, SubCategory subCategoryParam, MultipartHttpServletRequest request
			, @RequestParam("fileCount") int fileCount, List<MultipartFile> singleFile, HttpSession session) {
		
		//int userNo = (int) session.getAttribute("userNo"); //로그인 시 세션에 저장된 유저넘버
		int userNo = 2; //유저번호가 2번이라는 가정 하에 진행
		
		int teacherNo = teacherDao.selectByUserNo(userNo);
		
		UserInfo userInfo = teacherDao.selectNameByUserNo(userNo);
		
		logger.info("메인카테고리 {}", mainCategoryParam);
		//maincategory 번호를 추출함
		int mainCategoryNo = teacherDao.selectByCategoryName(mainCategoryParam);
		
		//subcategory파라미터에 maincategory번호를 넣어줌 
		subCategoryParam.setMainCategoryNo(mainCategoryNo);
		
		//subcategory 번호를 추출함
		int subCategoryNo = teacherDao.selectBySubCategoryName(subCategoryParam);

		//class 파라미터에 강사 번호를 넣어줌
		registLecture.setTeacherNo(teacherNo);
		
		//class 파라미터에 강사 이름을 넣어줌
		registLecture.setTeacher(userInfo.getUserName());
		
		//class 파라미터에 maincategorynumber를 넣어줌
		registLecture.setMainCategoryNo(mainCategoryNo);

		//class 파라미터에 subcategorynumber를 넣어줌
		registLecture.setSubCategoryNo(subCategoryNo);
		
		//class 파라미터에 deleteboolean을 0으로 넣어줌(강의 유지)
		registLecture.setDeleteBoolean(0);
		
		int classNo = teacherDao.selectByInsertClassNo();
		
		registLecture.setClassNo(classNo);
		
		for(MultipartFile f : singleFile) {
			this.classInsert( f, registLecture );
		}
		
		
		
		if (registLecture.getOnOff() == 0 ) {
			
			addressParam.setClassNo(classNo);
			
			teacherDao.insertAddress(addressParam);
			
		} else {
			
			classVideoParam.setClassNo(classNo);
			
			logger.info("파일 카운트 {}", fileCount);

		    try {
		        List<MultipartFile> files = new ArrayList<>();

		        int[] numberFiles =  new int [fileCount];
		        
		        for (int i = 1; i <= fileCount; i++) {
		            MultipartFile file = request.getFile("fileInput_" + i);
		            // 파일에 대한 처리 수행
		            // files 리스트에 파일 추가 또는 다른 처리 수행
		            
		          //파일이 저장될 경로
					String storedPath = context.getRealPath("upload");
					
					//upload 폴더 생성
					File storedFolder = new File(storedPath);
					storedFolder.mkdir();
					
					//저장될 파일 이름
					String originName = file.getOriginalFilename();
					String storedName = originName + UUID.randomUUID().toString().split("-")[4];
					
					//저장할 파일 객체
					File dest = new File(storedFolder, storedName);
					
					try {
						file.transferTo(dest);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					//여기부터 시작 동영상강의를 회차별로 넣도록 jsp부터 구현해야한다 22일 할일!@
					classVideoParam.setOriginName(originName);
					classVideoParam.setStoredName(storedName);

					
					logger.info("파일 {}", files);
					
					// input type=number에 대한 처리 수행
					String numberInputValue = request.getParameter("numberInput_" + i);
					int numberInput = Integer.parseInt(numberInputValue);
					
					classVideoParam.setVideoLesson(numberInput);
					logger.info("숫자 입력값 {}", numberInput);
					
					numberFiles [i-1] = numberInput;
		            
		            files.add(file);
		     
		            teacherDao.onClassInsertFile(classVideoParam);
		        }
		        // 여기서 files 리스트를 사용하여 파일에 대한 추가적인 처리 수행	       
		    } catch (Exception e) {
		       
		    }
			
						
		}
		
		
		
	}
	

	private void classInsert(MultipartFile singleFile, Class registLecture) {
		
		//파일이 저장될 경로
				String storedPath = context.getRealPath("upload");
				
				//upload 폴더 생성
				File storedFolder = new File(storedPath);
				storedFolder.mkdir();
				
				
				//저장될 파일 이름
				String originName = singleFile.getOriginalFilename();
				String headImg = originName + UUID.randomUUID().toString().split("-")[4];
				
				
				//저장할 파일 객체
				File dest = new File(storedFolder, headImg);
			
				
				try {
					singleFile.transferTo(dest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//---------------------------------------------------------------------------
				
				
				
				registLecture.setHeadImg(headImg);
				
				logger.info("teacherImport {}", registLecture);
				
				teacherDao.registClassInsert(registLecture);
		
	}

//	private void classRegistFile(MultipartFile file, ClassVideo classVideoParam) {
//		
//		//빈 파일 처리
//				if( file.getSize() <= 0 ) {
//					return;
//				}
//				
//				//파일이 저장될 경로
//				String storedPath = context.getRealPath("upload");
//				
//				//upload 폴더 생성
//				File storedFolder = new File(storedPath);
//				storedFolder.mkdir();
//				
//				//저장될 파일 이름
//				String originName = file.getOriginalFilename();
//				String storedName = originName + UUID.randomUUID().toString().split("-")[4];
//				
//				//저장할 파일 객체
//				File dest = new File(storedFolder, storedName);
//				
//				try {
//					file.transferTo(dest);
//				} catch (IllegalStateException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				//여기부터 시작 동영상강의를 회차별로 넣도록 jsp부터 구현해야한다 22일 할일!@
////				ClassVideo classVideo = new ClassVideo();
////				classVideo.setVideoLesson(videoLesson);
////				classVideo.setOriginName(originName);
////				classVideo.setStoredName(storedName);
////				
////				teacherDao.onClassInsertFile(classVideo);
//				
//		
//	}


	@Override
	public TeacherMainPaging getAnswerPaging(TeacherMainPaging param, int userNo) {
		
		int teacherNo = teacherDao.selectByUserNo(userNo);
		
		int classNo = teacherDao.selectByteacherNo(teacherNo);
		
		int totalCount = teacherDao.selectAnswerCntAll(classNo);
		
		TeacherMainPaging paging = new TeacherMainPaging(totalCount, param.getCurPage());
		
		
		return null;
	}


	@Override
	public List<Class> answerDrop(HttpSession session, TeacherMainPaging param) {
		
		//int teacherNo = (int) session.getAttribute("teacherNo"); 세션에 저장된 teacherNo를 가져온다
		int teacherNo = 3;
		
		List<Class> list = teacherDao.selectTeacherClass(teacherNo);
		
		return list;
	}

	@Override
	@Transactional
	public void applyWrite(Teacher teacherParam, TeacherLicence teacherLicenceParam, TeacherApply teacherApply,List<MultipartFile> file, List<MultipartFile> singleFile) {
		
//		if( teacherParam.getTeacherCareer() == null || "".equals(teacherParam.getTeacherCareer()) ) {
//			teacherParam.setTeacherCareer("(자격증 내용 없음)");
//		}
		
		
		//첨부파일이 없을 경우 처리
		if( file.size() == 0 ) {
			return;
		}
		
		for(MultipartFile f : singleFile) {
			this.insertTeacherImgFile( f, teacherParam );
		}
		

		for(MultipartFile f : file) {
			this.insertFile( f, teacherParam.getTeacherNo() );
		}

		
		teacherApply.setTeacherNo(teacherParam.getTeacherNo());
		teacherApply.setPassOrNot("not");
		
		logger.info("TN {}", teacherParam);
		
		teacherDao.applyPrcInsert(teacherApply);
		//---------------------------------------------------------------------------
		
	}
	
	
	
	private void insertTeacherImgFile(MultipartFile singleFile, Teacher teacherParam) {
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//저장될 파일 이름
		String originName = singleFile.getOriginalFilename();
		String teacherImg = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장할 파일 객체
		File dest = new File(storedFolder, teacherImg);
	
		
		try {
			singleFile.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------
		
		
		
		teacherParam.setTeacherImg(teacherImg);
		
		logger.info("teacherImport {}", teacherParam);
		
		teacherDao.applyTeacherImgFile(teacherParam);

		
	}

	private void insertFile( MultipartFile file, int teacherNo ) {
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//저장될 파일 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
	
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------
		
		TeacherLicence teacherLicence = new TeacherLicence();
		
		teacherLicence.setTeacherNo( teacherNo );
		teacherLicence.setStoredName(storedName);
		teacherLicence.setOriginName(originName);
		
		logger.info("simpl {}", teacherLicence);
		
		teacherDao.applyInsertFile( teacherLicence );
	}

	@Override
	public List<QuestionAnswer> qalistPost(HttpSession session, TeacherMainPaging param, String classNo) {
		
		int classNo2 = Integer.parseInt(classNo);
		
		List<QuestionAnswer> list = teacherDao.selectQaList(classNo2);
		
		return list;
	}

	@Override
	public TeacherMainPaging getPaging(TeacherMainPaging param, String classNo) {
		
		int classNo2 = Integer.parseInt(classNo);
		
		int totalCount = teacherDao.selectCntAll2(classNo2);
		
		TeacherMainPaging paging = new TeacherMainPaging(totalCount, param.getCurPage());
		
		return paging;
		
	}

				

}
