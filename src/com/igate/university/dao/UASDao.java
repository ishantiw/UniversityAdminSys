package com.igate.university.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.igate.university.bean.ApplicForm;
import com.igate.university.bean.ProgramSchedule;

public class UASDao
{


	public UASDao()
	{
		super();

	}
	Connection connection=null;
	ResultSet rs=null;
	Statement st=null;
	PreparedStatement pstmt=null;
	public int formSubmission(ApplicForm aform) throws SQLException, Exception 
	{

		int id=0; 
		int count=0;
		connection= new DbConnection().getConnection();
		String query="select application_id.nextval from dual";

		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(query);
		if(rs.next())
		{
			id=rs.getInt(1);
		}
		String name=aform.getFirstname()+" "+aform.getMiddlename()+" "+aform.getLastname();

		Date dob=aform.getDob();
		SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy");
		String dob_date=formatter.format(dob) ;

		String query1="insert into application values(?,?,?,?,?,?,?,?,'applied',null)";
		PreparedStatement ptst1=connection.prepareStatement(query1);
		ptst1.setInt(1, id);
		ptst1.setString(2, name);
		ptst1.setString(3, dob_date);
		ptst1.setString(4, aform.getHigh_qua());
		ptst1.setInt(5, aform.getMarks());
		ptst1.setString(6, aform.getGoal());
		ptst1.setString(7,aform.getEmail());
		ptst1.setString(8,aform.getSch_prog());
		count=ptst1.executeUpdate();

		return id;
	}
	public String viewStatus(int appid) throws SQLException, ClassNotFoundException 
	{
		String state=null;
		connection= new DbConnection().getConnection();
		String query="Select status from application where application_id=?";
		PreparedStatement ptst=connection.prepareStatement(query);
		ptst.setInt(1, appid);
		ResultSet rs=ptst.executeQuery();
		while(rs.next())
			state=rs.getString(1);
		System.out.println(state);
		return state;
	}
	public List viewScheduleProgram() throws SQLException, ClassNotFoundException
	{
		System.out.println("in dao");

		List sch_list=new ArrayList();
		connection= new DbConnection().getConnection();

		if(connection!=null)
		{
			PreparedStatement pst=connection.prepareStatement("select * from  programs_scheduled");
			System.out.println("in while");
			rs=pst.executeQuery();
			//System.out.println(rs.next());


			while(rs.next())
			{

				ProgramSchedule prg=new ProgramSchedule();

				prg.setScheduled_program_id(rs.getString(1));
				System.out.println("this is id"+rs.getString(1));

				prg.setProgram_name(rs.getString(2));
				prg.setLocation(rs.getString(3));

				prg.setStartdate(rs.getDate(4));
				System.out.println(rs.getDate(4));

				prg.setEnddate(rs.getDate(5));

				prg.setSessions_per_week(rs.getInt(6));

				System.out.println(rs.getInt(6));

				sch_list.add(prg);
			}}
		return sch_list;
	}
}
