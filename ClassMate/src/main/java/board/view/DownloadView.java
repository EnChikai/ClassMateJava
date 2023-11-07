package board.view;

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

import board.dto.Boardfile;

public class DownloadView extends AbstractView {

	@Autowired private ServletContext context;
	
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		//모델값 가져오기 - 파일 정보
		Boardfile file = (Boardfile) model.get("downFile");
		
		//파일 객체
		File src = new File( context.getRealPath("upload"), file.getStoredName() );
	    FileInputStream in = new FileInputStream(src);
	    
		
		//응답 헤더 설정		
		response.setContentType("application/octet-stream");		
		response.setContentLengthLong(src.length());		
		response.setCharacterEncoding("UTF-8");		
				
		String outputName = URLEncoder.encode(file.getOriginName(), "UTF-8");
		outputName = outputName.replace("+", "%20");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		//응답
	    OutputStream out = response.getOutputStream();
	    FileCopyUtils.copy(in, out);

	}
}
