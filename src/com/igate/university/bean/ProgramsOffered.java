package com.igate.university.bean;

public class ProgramsOffered {
 String program_name;
 String description; 
 String applicant_eligibilty;
 int duration;
 String degree_certificate_offered;
 
 

public ProgramsOffered(String programName, String description,
		String applicantEligibilty, int duration,
		String degreeCertificateOffered) {
	super();
	program_name = programName;
	this.description = description;
	applicant_eligibilty = applicantEligibilty;
	this.duration = duration;
	degree_certificate_offered = degreeCertificateOffered;
}
public ProgramsOffered() {
	super();
	// TODO Auto-generated constructor stub
}
public String getProgram_name() {
	return program_name;
}
public void setProgram_name(String programName) {
	program_name = programName;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getApplicant_eligibilty() {
	return applicant_eligibilty;
}
public void setApplicant_eligibilty(String applicantEligibilty) {
	applicant_eligibilty = applicantEligibilty;
}
public int getDuration() {
	return duration;
}
public void setDuration(int duration) {
	this.duration = duration;
}
public String getDegree_certificate_offered() {
	return degree_certificate_offered;
}
public void setDegree_certificate_offered(String degreeCertificateOffered) {
	degree_certificate_offered = degreeCertificateOffered;
}

 
}
