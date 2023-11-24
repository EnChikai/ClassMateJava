package calendar.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import calendar.dto.Calendar;

public interface CalendarService {

	public void addSchedule(Calendar dto);

	public List<Calendar> showSchedule(HttpSession session);

}
