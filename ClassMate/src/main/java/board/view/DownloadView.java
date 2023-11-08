//package board.view;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.OutputStream;
//import java.net.URLEncoder;
//import java.util.Map;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.servlet.view.AbstractView;
//
//import board.dto.FileParam;
//
//public class DownloadView extends AbstractView {
//	
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//	
//	@Autowired ServletContext servletContext;
//
//	@Override
//	protected void renderMergedOutputModel(
//			Map<String, Object> model
//			, HttpServletRequest request
//			,HttpServletResponse response ) throws Exception {
//		
//		logger.info("파일 다운로드 응답확인 {}", model);
//		
//		FileParam fileParam = (FileParam) model.get("fileParam");
//		logger.info("파일 다운로드 응답확인 : {}", fileParam);
//
//		//저장된 파일의 폴더 (upload)
//		String path = servletContext.getRealPath("upload");
//		
//		//실제 업로드된 파일의 이름
//		String filename = fileParam.getStoredName();
//		
//		//실제 파일 객체
//		File src = new File(path, filename);
//		
//		logger.info("서버에 업로드된 파일 {}", src);
//		logger.info("존재 여부 {}", src.exists());
//
//		//** 응답 메세지의 HEADER영역 설정하기
//		//	-> application/octet-stream : 모든 파일의 형식을 대표하는 MIME타입
//		//	-> 브라우저는 해당 형식의 데이터를 파일로 다운받도록 되어있다
//		response.setContentType("application/octet-stream");
//		
//		//응답 데이터의 크기 설정
//		response.setContentLengthLong(src.length());
//		
//		//응답 데이터의 인코딩 설정
//		response.setCharacterEncoding("UTF-8");
//		
//		//브라우저가 다운로드할 파일의 이름 설정
//		String outputName = URLEncoder.encode(fileParam.getOriginName(),"UTF-8");
//		outputName = outputName.replace("+", "%20");	//띄어쓰기 복원
//		response.setHeader("Content-Disposition", "attachment; filename=\""+outputName+"\"");
//		
//		//서버의 파일 입력 스트림
//		FileInputStream in = new FileInputStream(src);
//		
//		//클라이언트의 응답 출력 스트림
//		OutputStream out = response.getOutputStream();
//		
//		//서버 -> 클라이언트의 파일 복사
//		FileCopyUtils.copy(in, out);
//				
//	} 
//	
//	
//}
