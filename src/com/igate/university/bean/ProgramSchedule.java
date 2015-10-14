package com.igate.university.bean;

import java.util.Date;

public class ProgramSchedule {
	
	String scheduled_program_id;
	String program_name;
	String location;
	Date startdate;
	Date enddate;
	int sessions_per_week;
	
	
	
	public ProgramSchedule(String scheduledProgramId, String programName,
			String location, Date startdate, Date enddate, int sessionsPerWeek) {
		super();
		scheduled_program_id = scheduledProgramId;
		program_name = programName;
		this.location = location;
		this.startdate = startdate;
		this.enddate = enddate;
		sessions_per_week = sessionsPerWeek;
	}
	
	public ProgramSchedule() {
		super();
		
	}
	public String getScheduled_program_id() {
		return scheduled_program_id;
	}
	public void setScheduled_program_id(String scheduledProgramId) {
		scheduled_program_id = scheduledProgramId;
	}
	public String getProgram_name() {
		return program_name;
	}
	public void setProgram_name(String programName) {
		program_name = programName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getSessions_per_week() {
		return sessions_per_week;
	}
	public void setSessions_per_week(int sessionsPerWeek) {
		sessions_per_week = sessionsPerWeek;
	}
	
	

}
