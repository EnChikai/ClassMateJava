
package board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import board.dao.face.BoardDao;
import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.dto.FreeComment;
import board.dto.Question;
import board.dto.QuestionFile;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;
import web.util.PagingQuestion;

@Service
public class BoardServiceImpl implements BoardService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired BoardDao boardDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getBoardPaging(Paging paging1) {
	      logger.info("getPaging(Paging param)");
	      
	      //총 게시글 수 조회
	      int totalCount = boardDao.freeCntAll();
	      logger.info("totalCount : {}",totalCount);
	      
	      //페이징 객체 생성(페이징 계산)
	      Paging paging2 = new Paging(totalCount, paging1.getCurPage());
	      
		return paging2;
	}
	
	@Override
	public Map<String, Object> listBoard(Paging paging) {

		List<FreeBoard> freeList = boardDao.selectFreeAll(paging);
		List<AnnounceBoard> announceList = boardDao.selectAnnounceAll();
		List<EventBoard> eventList = boardDao.selectEventAll();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("freeList", freeList);
		map.put("announceList", announceList);
		map.put("eventList", eventList);
		
		return map;
	}

	@Override
	public UserInfo writeUserId(String userId) {
		System.out.println(userId);
		return boardDao.writeUserId(userId);
	}

	@Override
	@Transactional
	public void write(FreeBoard freeBoard, List<MultipartFile> mfile) {
		
//		int freeNo =  boardDao.insert(freeBoard); // insert라 1이 반환
		boardDao.insert(freeBoard);
//		freeBoard.getFreeNo(); // DTO에 저장된 값
		
		//---------------------------------------------------------
		
		//첨부파일이 없을 경우 처리
	    if( mfile.size() == 0 ) {
	       return;
	    }

	    for(MultipartFile f : mfile) {
	         this.fileinsert( f, freeBoard.getFreeNo() );
	    }
	    
	 }
                    	
	private void fileinsert( MultipartFile file, int freeNo ) {
		
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일을 저장할 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFoder = new File(storedPath);
		storedFoder.mkdir();
		
		//저장될 파일 이름
		String orignName = file.getOriginalFilename();
		String storedName = orignName + UUID.randomUUID().toString().split("-")[4];

		//저장할 파일 객체
		File dest = new File(storedFoder, storedName);
	
		
        try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	   
        //---------------------------------------------------------------------------   

        FreeBoardFile freeBoardFile = new FreeBoardFile();
        freeBoardFile.setFreeNo( freeNo );
        freeBoardFile.setOriginName( orignName );
        freeBoardFile.setStoredName( storedName );
        
        boardDao.insertFile( freeBoardFile );
		
	}

	@Override
	public FreeBoard freeView(FreeBoard viewFree) {
		
		//조회수 증가
		boardDao.updateHit(viewFree);
			
		return boardDao.selectFreeBoardNo(viewFree);
	}

	@Override
	public List<FreeBoardFile> getAttachFreeFile(FreeBoard viewFree) {
		return boardDao.AttachFreeFile(viewFree);
	}

	@Override
	public FreeBoardFile getFreeFile(FreeBoardFile freeBoardFile) {
		return boardDao.downFreeFileNo(freeBoardFile);
	}

	@Override
	public UserInfo getUserInfo(UserInfo user) {
		return boardDao.selectByuserId(user);
	}
	
	@Override
	public FreeComment freeCommentInsert(FreeComment freeComment) {
		boardDao.freeCommentInsert(freeComment);
		freeComment = boardDao.selectByFreeNo(freeComment);
		return freeComment;
	}
	
	@Override
	public List<FreeComment> freeCommentList(FreeComment freeComment) {
		List<FreeComment> list = boardDao.freeCommentList(freeComment);
		logger.info("list {}",  list);
		return list;
	}
	
	@Override
	   public void freeViewCommentDelete(FreeComment freeCommentDelete) {
	      boardDao.freeViewCommentDelete(freeCommentDelete);
	      logger.info("impl에서 삭제넘어감");
	   }
	
	@Override
	public void deleteFreeBoard(FreeBoard deleteFree) {
		
		boardDao.deleteFreeFileBoardNo( deleteFree );	//첨부파일 삭제
		boardDao.deleteFreeBoardNo( deleteFree );		//자유게시글 삭제
	}

	//------------------------------------------------------------------
	
	@Override
	public AnnounceBoard announceView(AnnounceBoard viewAnnounce) {

		//조회수 증가
		boardDao.announceUpdateHit(viewAnnounce);
			
		return boardDao.selectAnnounceBoardNo(viewAnnounce);
	}

	@Override
	public List<AnnounceBoardFile> getAttachAnnounceFile(AnnounceBoard viewAnnounce) {
		return boardDao.AttachAnnounceFile(viewAnnounce);
	}

	@Override
	public EventBoard EventView(EventBoard viewEvent) {
		
		//조회수 증가
		boardDao.eventUpdateHit(viewEvent);
		
		return boardDao.selectEventBoardNo(viewEvent);
	}

	@Override
	public List<EventBoardFile> getAttachEventFile(EventBoard viewEvent) {
		return boardDao.AttachEventFile(viewEvent);
	}

	@Override
	@Transactional
	public void update(FreeBoard updateParam, List<MultipartFile> file, int[] delFileno) {
	      
	       
			boardDao.update( updateParam );
	       //첨부파일이 없을 경우 처리
	       if( file.size() == 0 ) {
	          return;
	       }

	       for(MultipartFile f : file) {
	          this.fileinsert( f, updateParam.getFreeNo() );
	          System.out.println(f);
	       }
	       
	       //삭제할 첨부 파일 처리
	       if( delFileno != null ) {
	          boardDao.deleteFiles( delFileno );
	       }
		
	}

	@Override
	public PagingQuestion getQuestionBoardPaging(PagingQuestion pagingQuestion, UserInfo userInfo) {
	      int totalCount = boardDao.questionCntAll(userInfo);
	      
	      //페이징 객체 생성(페이징 계산)
	      PagingQuestion questionPaging = new PagingQuestion(totalCount, pagingQuestion.getCurPage());
	      
		return questionPaging;
	}

	@Override
	public HashMap<String,Object> questionList(PagingQuestion pagingQuestion, UserInfo userInfo, HashMap<String,Object> map) {
		
		map.put("pagingQuestion", pagingQuestion);
		map.put("userInfo", userInfo);
		
		List<Question> questionList = boardDao.selectQuestionAll(map);
		
		map.put("questionList", questionList);
		
		return map;
	}

	@Override
	@Transactional
	public void questionWrite(Question question, List<MultipartFile> qfile) {
		
		logger.info("또안돼{}", question);
//		int freeNo =  boardDao.insert(question); // insert라 1이 반환
		boardDao.questionInsert(question);
//		freeBoard.getquestionNo(); // DTO에 저장된 값
		
		//---------------------------------------------------------
		
		//첨부파일이 없을 경우 처리
	    if( qfile.size() == 0 ) {
	       return;
	    }

	    for(MultipartFile f : qfile) {
	         this.fileinsertQuestion( f, question.getQuestionNo() );
	    }
	    
	 }
                    	
	private void fileinsertQuestion( MultipartFile file, int questionNo ) {
		
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일을 저장할 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFoder = new File(storedPath);
		storedFoder.mkdir();
		
		//저장될 파일 이름
		String orignName = file.getOriginalFilename();
		String storedName = orignName + UUID.randomUUID().toString().split("-")[4];

		//저장할 파일 객체
		File dest = new File(storedFoder, storedName);
	
		
        try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	   
        //---------------------------------------------------------------------------   

        QuestionFile questionFile = new QuestionFile();
        questionFile.setQuestionNo( questionNo );
        questionFile.setOriginName( orignName );
        questionFile.setStoredName( storedName );
        
        boardDao.insertFileQuestion( questionFile );
		
	}

	@Override
	public Question questionView(Question viewQuestion) {
		return boardDao.selectQuestionNo(viewQuestion);
	}

	@Override
	public List<QuestionFile> getAttachQuestionFile(Question viewQuestion) {
		return boardDao.AttachQuestionFile(viewQuestion);
	}



}

