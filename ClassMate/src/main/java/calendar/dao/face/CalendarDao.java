package calendar.dao.face;

import java.util.List;

import calendar.dto.Calendar;

public interface CalendarDao {

	public void insertSchedule(Calendar dto);

	public List<Calendar> selectSchedule(Calendar calendar);

}
