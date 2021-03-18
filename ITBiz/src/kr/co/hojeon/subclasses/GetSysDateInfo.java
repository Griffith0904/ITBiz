package kr.co.hojeon.subclasses;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class GetSysDateInfo {
	SimpleDateFormat snow_date = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	
	public int getTodayWeeklyNum() {
		Date now_date = new Date();
		String now_date_string = snow_date.format(now_date);
		Calendar calendar = Calendar.getInstance();
	    String[] dates = now_date_string.split("-");
	    int year = Integer.parseInt(dates[0]);
	    int month = Integer.parseInt(dates[1]);
	    int day = Integer.parseInt(dates[2]);
	    calendar.set(year, month - 1, day);
	    return calendar.get(Calendar.WEEK_OF_YEAR);
	}
}
