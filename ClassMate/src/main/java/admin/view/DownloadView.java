package admin.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoardFile;

public class DownloadView extends AbstractView {
   
   @Autowired private ServletContext context;

   @Override
   protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
	   
      //모델값 가져오기 - 파일 정보
	  File src = null;
	  FileInputStream in = null;
	  
	  if(model.get("announceBoardFile") != null) {
		  
		  AnnounceBoardFile file = new AnnounceBoardFile();
		  
		  file =  (AnnounceBoardFile) model.get("announceBoardFile");
		  
		  //파일 객체
		  src = new File( context.getRealPath("upload"), file.getStoredName() );
		  in = new FileInputStream(src);
	      
		  //응답 헤더 설정
	      response.setContentType("application/octet-stream");
	      response.setContentLengthLong(src.length());
	      response.setCharacterEncoding("UTF-8");
	      
	      String outputName = URLEncoder.encode(file.getOriginName(), "UTF-8");
	      outputName = outputName.replace("+", "%20");
	      response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
	      
	  }else if(model.get("eventBoardFile") != null) {
		  
		  EventBoardFile file = new EventBoardFile();
		  
		  file =  (EventBoardFile) model.get("eventBoardFile");
		  
		  //파일 객체
		  src = new File( context.getRealPath("upload"), file.getStoredName() );
		  in = new FileInputStream(src);
	      
		  //응답 헤더 설정
	      response.setContentType("application/octet-stream");
	      response.setContentLengthLong(src.length());
	      response.setCharacterEncoding("UTF-8");
	      
	      String outputName = URLEncoder.encode(file.getOriginName(), "UTF-8");
	      outputName = outputName.replace("+", "%20");
	      response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
	      
	  }else if(model.get("eventBoard") != null) {
		  
		  EventBoard file = new EventBoard();
		  
		  file =  (EventBoard) model.get("eventBoard");
		  
		  //파일 객체
		  src = new File( context.getRealPath("upload"), file.getHeadImg() );
		  in = new FileInputStream(src);
	      
		  //응답 헤더 설정
	      response.setContentType("application/octet-stream");
	      response.setContentLengthLong(src.length());
	      response.setCharacterEncoding("UTF-8");
	      
	      String fileName = file.getHeadImg().substring(0, file.getHeadImg().length() - 12);
	      
	      String outputName = URLEncoder.encode(fileName, "UTF-8");
	      outputName = outputName.replace("+", "%20");
	      response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		  
	  }
      
      //응답
      OutputStream out = response.getOutputStream();
      FileCopyUtils.copy(in, out);
	  
   }

}


