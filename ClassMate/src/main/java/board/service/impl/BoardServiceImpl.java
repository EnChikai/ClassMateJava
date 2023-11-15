
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
import board.dto.EventBoard;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.service.face.BoardService;
import user.dto.UserInfo;
import web.util.Paging;

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
		String storedPath = context.getRealPath("freeupload");
		
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


}

