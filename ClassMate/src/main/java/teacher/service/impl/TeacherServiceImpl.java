package teacher.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import teacher.dao.face.TeacherDao;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import teacher.service.face.TeacherService;
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
	public void classRegist(Class registLecture, List<MultipartFile> file) {
	
		
		teacherDao.classInsert(registLecture);
			
			
			
		
	}
	
	public void classRegistFile(MultipartFile file, int videoLesson) {
		
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
		
		ClassVideo classVideo = new ClassVideo();
		classVideo.setVideoLesson(videoLesson);
		classVideo.setOriginName(originName);
		classVideo.setStoredName(storedName);
		
		teacherDao.onClassInsertFile(classVideo);
		
	}

	@Override
	public TeacherMainPaging getAnswerPaging(TeacherMainPaging param, int userNo) {
		
		int teacherNo = teacherDao.selectByUserNo(userNo);
		
		int classNo = teacherDao.selectByteacherNo(teacherNo);
		
		int totalCount = teacherDao.selectAnswerCntAll(classNo);
		
		TeacherMainPaging paging = new TeacherMainPaging(totalCount, param.getCurPage());
		
		
		return null;
	}

	@Override
	public List<QuestionAnswer> qaList(TeacherMainPaging paging, int userNo) {
		
		return null;
	}

	@Override
	public List<Class> answerDrop(HttpSession session, TeacherMainPaging param) {
		
		//int teacherNo = (int) session.getAttribute("teacherNo"); 세션에 저장된 teacherNo를 가져온다
		int teacherNo = 2;
		
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
		String licenceImg = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장할 파일 객체
		File dest = new File(storedFolder, licenceImg);
	
		
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
		teacherLicence.setLicenceImg(licenceImg);
		
		logger.info("simpl {}", teacherLicence);
		
		teacherDao.applyInsertFile( teacherLicence );
	}
				

}
