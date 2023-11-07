package admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@GetMapping("/admin/main")
	public void adminMainPageGet() {
		logger.info("/admin/main [GET]");
		
		
		
	}
	
}
