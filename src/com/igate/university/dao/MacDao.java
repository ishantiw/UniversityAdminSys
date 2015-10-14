package com.igate.university.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.igate.university.bean.ApplicForm;





public class MacDao {
	Connection connection;
	DbConnection dbconnect= new DbConnection();
	PreparedStatement pstatement;
	
	public boolean validate_mac(String userid,String password)
	{
		boolean status=false;
		Connection con= dbconnect.getConnection();
		try {
			PreparedStatement pst=null;
			String query="select count(*) from users where login_id=? and password=? and role='mac'";
			pst= con.prepareStatement(query);
			pst.setString(1, userid);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				if(rs.getInt(1)==1)
				{
					status= true;
				}
				else
					status= false;
			}
			
		}
		catch (SQLException e)
		{
		e.printStackTrace();
		}
		finally
		{
			if(con!=null)
			{
				try {
					con.close();
				} catch (SQLException e) 
				{
			     	e.printStackTrace();
				}
			}
			
		}
		return status;
	}
	
	public List<String> retrieveScheduledProgram() throws SQLException
	{
		List<String> programs=new ArrayList<String>();
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("select SCHEDULED_PROGRAM_ID from programs_scheduled");
		ResultSet progs=pstatement.executeQuery();
		while(progs.next())
		{
			programs.add(progs.getString(1));
		}
		return programs;
	}
		//method to retrieve applications based on scheduled program
	public List<ApplicForm> viewApplications(String programid) throws SQLException 
	{
		List<ApplicForm> applications=new ArrayList<ApplicForm>();
	
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("select * from application where scheduled_program_id=?");
		
		pstatement.setString(1,programid);
		ResultSet applist=pstatement.executeQuery();
		while(applist.next())
		{
			ApplicForm appli=new ApplicForm();
			appli.setApplication_id(applist.getLong(1));
			appli.setFullname(applist.getString(2));
			appli.setDob(applist.getDate(3));
			appli.setHigh_qua(applist.getString(4));
			appli.setMarks(applist.getInt(5));
			appli.setGoal(applist.getString(6));
			appli.setEmail(applist.getString(7));
			appli.setSch_prog(applist.getString(8));
			appli.setStatus(applist.getString(9));
			applications.add(appli);			
		}
		
		return applications;
	}
	//method to filter applicants
	public List<ApplicForm> filterApplications(String programid) 
	{
		List<ApplicForm> applications=new ArrayList<ApplicForm>();
		try
		{
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("select * from application where scheduled_program_id=? and (status='applied' or status='accepted')");
		pstatement.setString(1,programid);
		ResultSet applist=pstatement.executeQuery();
		
		while(applist.next())
		{
			ApplicForm appli=new ApplicForm();
			appli.setApplication_id(applist.getLong(1));
			appli.setFullname(applist.getString(2));
			appli.setDob(applist.getDate(3));
			appli.setHigh_qua(applist.getString(4));
			appli.setMarks(applist.getInt(5));
			appli.setGoal(applist.getString(6));
			appli.setEmail(applist.getString(7));
			appli.setSch_prog(applist.getString(8));
			appli.setStatus(applist.getString(9));
			if(appli.getStatus().equals("accepted"))
			{
				appli.setInterview(applist.getDate(10));
			}
			applications.add(appli);			
		}
		
		
		return applications;
		}catch(SQLException e)
		{
			return applications;
		}
	}
	//method to accept the application
	public boolean acceptApplication(long appid,String date) throws SQLException 
	{
		boolean updated=false;
		
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("update application set date_of_interview=?,status='accepted' where application_id=?");
		pstatement.setString(1, date);
		pstatement.setLong(2,appid);
		int count=pstatement.executeUpdate();
		if(count>0)
		{
			updated=true;
		}
		else 
		{
			updated=false;
		}
		
		return updated;
	}
	//method to reject the application
	public boolean rejectApplication(long appid) throws SQLException  
	{
		boolean rejected=false;
		
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("update application set status='rejected' where application_id=?");
		pstatement.setLong(1, appid);
		
		int count=pstatement.executeUpdate();
		if(count>0)
		{
			rejected=true;
		}
		else 
		{
			rejected=false;
		}
		
		return rejected;
	}
	//method to confirm the application
	public boolean confirmApplication(long appid) throws SQLException 
	{
		boolean confirmed=false;
		
		connection=dbconnect.getConnection();
		pstatement=connection.prepareStatement("update application set status='confirmed' where application_id=?");
		pstatement.setLong(1, appid);
		
		int count=pstatement.executeUpdate();
		if(count>0)
		{
			confirmed=true;
		}
		else 
		{
			confirmed=false;
		}
				return confirmed;
	}
}
