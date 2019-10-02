package com.cognizant.trainerpool.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static java.sql.Date convertToDate(java.util.Date date) {
		java.sql.Date newDate = new java.sql.Date(date.getTime());
		return newDate;
	}
	
	public static Date convertToDate(String date) {
		Date dateRes = null;
		try {
			dateRes = new SimpleDateFormat("MM/dd/yyyy").parse(date);
		} catch (ParseException e) {
		}
		return dateRes;

	}
}
