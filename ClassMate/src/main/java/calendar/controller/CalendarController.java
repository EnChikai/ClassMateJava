package calendar.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import calendar.dto.Calendar;
import calendar.service.face.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired private CalendarService calendarService;

	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody Calendar dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();

		calendarService.addSchedule(dto);

		return map;
	}
	
	@RequestMapping(value = "/schedule")
	public String schedule(Model model, HttpSession session)throws Exception {

		model.addAttribute("showSchedule" , calendarService.showSchedule(session));
	    
		return "/calendar/schedule";
	}
	
	
}
