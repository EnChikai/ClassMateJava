package teacher.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lecture.dto.Class;
import lecture.dto.ClassVideo;
import lecture.dto.QuestionAnswer;
import teacher.dao.face.TeacherDao;
import teacher.service.face.TeacherService;
import web.util.TeacherMainPaging;

@Service
public class TeacherServiceImpl implements TeacherService {
	
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
		// TODO Auto-generated method stub
		return null;
	}
	

}
