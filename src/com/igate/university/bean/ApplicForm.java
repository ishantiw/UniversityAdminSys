package com.igate.university.bean;

import java.util.Date;

public class ApplicForm
{
String fullname;
public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
String firstname;
String middlename;
String lastname;
Date dob=new Date();
String high_qua;
int marks;
long application_id;
String status;
Date interview;

public Date getInterview() {
	return interview;
}
public void setInterview(Date interview) {
	this.interview = interview;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public long getApplication_id() {
	return application_id;
}
public void setApplication_id(long applicationId) {
	application_id = applicationId;
}
String goal;
String email;
String sch_prog;
public ApplicForm() {
	super();
	// TODO Auto-generated constructor stub
}
public ApplicForm(String firstname, String middlename, String lastname,
		Date dob, String highQua, int marks, String goal,
		String email, String schProg) {
	super();
	this.firstname = firstname;
	this.middlename = middlename;
	this.lastname = lastname;
	this.dob = dob;
	high_qua = highQua;
	this.marks = marks;
	
	this.goal = goal;
	this.email = email;
	sch_prog = schProg;
}
public String getFirstname() {
	return firstname;
}
public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public String getMiddlename() {
	return middlename;
}
public void setMiddlename(String middlename) {
	this.middlename = middlename;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public String getHigh_qua() {
	return high_qua;
}
public void setHigh_qua(String highQua) {
	high_qua = highQua;
}
public int getMarks() {
	return marks;
}
public void setMarks(int marks) {
	this.marks = marks;
}


public String getGoal() {
	return goal;
}
public void setGoal(String goal) {
	this.goal = goal;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getSch_prog() {
	return sch_prog;
}
public void setSch_prog(String schProg) {
	sch_prog = schProg;
}
@Override
public String toString() {
	return "ApplicForm [dob=" + dob + ", email=" + email + ", firstname="
			+ firstname + ", goal=" + goal + ", high_qua=" + high_qua
			+ ", lastname=" + lastname + ", marks=" + marks + ", middlename="
			+ middlename + ",  sch_prog=" + sch_prog
			+ "]";
}
 

}



