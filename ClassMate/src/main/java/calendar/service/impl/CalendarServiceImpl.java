package calendar.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.dao.face.CalendarDao;
import calendar.dto.Calendar;
import calendar.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired private CalendarDao calendarDao;
	
	@Override
	public void addSchedule(Calendar dto) {
		calendarDao.insertSchedule(dto);
	}
	
	@Override
	public List<Calendar> showSchedule(HttpSession session) {
		Calendar calendar = new Calendar();
		calendar.setUserNo((int)session.getAttribute("userNo"));
		return calendarDao.selectSchedule(calendar);
	}
	
}
