package com.igate.university.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.igate.university.bean.ProgramSchedule;
import com.igate.university.bean.ProgramsOffered;

public class AdminLogin {
	
	
	DbConnection dbconnect = new DbConnection();
	
	public boolean validate_admin(String userid,String password)
	{
		boolean status=false;
		Connection con= dbconnect.getConnection();
		try {
			PreparedStatement pst=null;
			String query="select count(*) from users where login_id=? and password=? and role='admin'";
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
	
	public boolean Admin_Add_program(ProgramsOffered po)
	{
		Connection con= dbconnect.getConnection();
		boolean status=false;
		try {
			
			
			PreparedStatement pstatement1=null;
			
			String query1="insert into programs_offered values(?,?,?,?,?)";
			pstatement1=con.prepareStatement(query1);
			pstatement1.setString(1, po.getProgram_name());
			pstatement1.setString(2,po.getDescription());
			pstatement1.setString(3,po.getApplicant_eligibilty());
			pstatement1.setInt(4, po.getDuration());
			pstatement1.setString(5, po.getDegree_certificate_offered());
			int i=pstatement1.executeUpdate();
			
			if(i==1)
			{
				status=true;
			}
			else
			{
				status=false;
			}
			
		}
		
		
		catch (SQLException e) {
			
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
	
	public boolean Admin_schedule_program(ProgramSchedule ps)
	{
		Connection con= dbconnect.getConnection();
		boolean status=false;
		try {
			
			
			PreparedStatement pstatement1=null;
			String s= "s";
			String query1="insert into programs_scheduled values(program_id.nextval,?,?,?,?,?)";
			pstatement1=con.prepareStatement(query1);
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
			pstatement1.setString(1, ps.getProgram_name());
			pstatement1.setString(2,ps.getLocation());
			pstatement1.setString(3,formatter.format(ps.getStartdate()));
			pstatement1.setString(4, formatter.format(ps.getEnddate()));
			pstatement1.setInt(5, ps.getSessions_per_week());
			int i=pstatement1.executeUpdate();
			
			if(i==1)
			{
				status=true;
			}
			else
			{
				status=false;
			}
			
		}
		
		
		catch (SQLException e) {
			
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
	
	
	@SuppressWarnings("unchecked")
	public List get_program_name()
	{
	
		Connection con= dbconnect.getConnection();
		List list=new ArrayList();
		try {
			System.out.println("lis function is being called");
			
			
			Statement statement=con.createStatement();
			String query="select program_name from programs_offered";
			ResultSet result=statement.executeQuery(query);
			
			while(result.next())
			{
				System.out.println(result.getString(1));
				list.add(result.getString(1));
			}
		} catch (SQLException e) {
			
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
		return list;
	}
	
	public ProgramsOffered get_program_details(String pname)
	{
		ProgramsOffered ps=new ProgramsOffered();
		
		try {
			System.out.println("lis function is being called");
			Connection con= dbconnect.getConnection();
			Statement statement=con.createStatement();
			String query="select * from programs_offered where program_name='"+pname+"'";
			ResultSet result=statement.executeQuery(query);
			
			while(result.next())
			{
				
				ps.setDescription(result.getString(2));
				ps.setApplicant_eligibilty(result.getString(3));
				ps.setDuration(result.getInt(4));
				ps.setDegree_certificate_offered(result.getString(5));
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return ps;
	}

	
	public boolean upd_program_details(ProgramsOffered po)
	{
	
		Connection con= dbconnect.getConnection();
		boolean status=false;
		try {
			System.out.println("lis function is being called");
			
			
			Statement statement=con.createStatement();
			System.out.println(po.getProgram_name());
			String query="update programs_offered set description='"+po.getDescription()+"',applicant_eligibility='"+po.getApplicant_eligibilty()+"',duration="+po.getDuration()+",degree_certificate_offered='"+po.getDegree_certificate_offered()+"' where program_name='"+po.getProgram_name()+"'";
			int j=statement.executeUpdate(query);
			
			if(j==1)
			{
				status=true;
			}
			else
			{
				status=false;
			}
		} catch (SQLException e) {
			
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
	
	
	public List get_schedule_name()
	{
	
		Connection con= dbconnect.getConnection();
		List list=new ArrayList();
		try {
			System.out.println("lis function is being called");
			
			
			Statement statement=con.createStatement();
			String query="select scheduled_program_id from programs_scheduled";
			ResultSet result=statement.executeQuery(query);
			
			while(result.next())
			{
				System.out.println(result.getString(1));
				list.add(result.getString(1));
			}
		} catch (SQLException e) {
			
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
		return list;
	}

	public ProgramSchedule get_schedule_details(String sname)
	{
		ProgramSchedule prs=new ProgramSchedule();
		Connection con= dbconnect.getConnection();
		try {
			System.out.println("lis function is being called");
			
			
			Statement statement=con.createStatement();
			String query="select * from programs_scheduled where scheduled_program_id='"+sname+"'";
			ResultSet result=statement.executeQuery(query);
			
			while(result.next())
			{
				
				prs.setProgram_name(result.getString(2));
				prs.setLocation(result.getString(3));
				prs.setStartdate(result.getDate(4));
				prs.setEnddate(result.getDate(5));
				prs.setSessions_per_week(result.getInt(6));
				
			}
		} catch (SQLException e) {
			
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
		return prs;
	}
	

	public boolean delete_schedule_details(String sname)
	{
		Connection con= dbconnect.getConnection();
		ProgramSchedule prs=new ProgramSchedule();
		boolean status = false;
		try {
			System.out.println("lis function is being called");
			
			Statement statement=null;
			statement=con.createStatement();
			String query="delete from programs_scheduled where scheduled_program_id='"+sname+"'";
			int i=statement.executeUpdate(query);
	
			if(i==1)
			{
				status=true;
			}
			else
			{
				status=false;
			}
		}catch (SQLException e) {
			
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
	
	public boolean delete_program_details(String pname)
	{
		ProgramsOffered prs=new ProgramsOffered();
		Connection con= dbconnect.getConnection();
		boolean status = false;
		try {
			System.out.println("lis function is being called");
			
			Statement statement=null;
			statement=con.createStatement();
			String query="delete from programs_offered where program_name='"+pname+"'";
			int i=statement.executeUpdate(query);
	
			if(i==1)
			{
				status=true;
			}
			else
			{
				status=false;
			}
		}catch (SQLException e) {
			
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
		
}
