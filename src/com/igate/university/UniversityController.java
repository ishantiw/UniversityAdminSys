package com.igate.university;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bsh.ParseException;

import com.igate.university.bean.ApplicForm;
import com.igate.university.bean.ProgramSchedule;
import com.igate.university.bean.ProgramsOffered;
import com.igate.university.dao.AdminLogin;
import com.igate.university.dao.MacDao;
import com.igate.university.dao.UASDao;

/**
 * Servlet implementation class UniversityController
 */
public class UniversityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UniversityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		@SuppressWarnings("unused")
	
		String page= request.getParameter("page");
		System.out.println("hello to controller");
		if(page.equals("adminLogin"))
		{
			HttpSession session= request.getSession();
			session.setAttribute("role", "other");
			String userid=request.getParameter("uid");
			String password=request.getParameter("pwd");
			AdminLogin admlogin=new AdminLogin();
			boolean status=admlogin.validate_admin(userid,password);
			
			if(status)
			{
				System.out.println("In IF");
				RequestDispatcher rd;
				session.setAttribute("role", "admin");
				rd=request.getRequestDispatcher("Admin_Home.jsp");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Wrong password/ID");
				request.getSession().invalidate();
				response.sendRedirect("Error.jsp?msg=you have entered wrong password or ID");
			}
		}
		if(page.equals("AdmAdd"))
		{
			if(request.getSession(false)!=null)
			{
			String program_name= request.getParameter("programName");
			String desc=request.getParameter("desc");
			String eligibilty=request.getParameter("elig");
			int duration=Integer.parseInt(request.getParameter("dur"));
			String cert=request.getParameter("cert");
		
			ProgramsOffered progO= new ProgramsOffered();
			
			progO.setProgram_name(program_name);
			progO.setDescription(desc);
			progO.setDegree_certificate_offered(cert);
			progO.setApplicant_eligibilty(eligibilty);
			progO.setDuration(duration);
			
			AdminLogin admlogin= new AdminLogin();
			boolean status=admlogin.Admin_Add_program(progO);
			
			if(status)
			{
				System.out.println("Program successfully added");
				response.sendRedirect("Success.jsp?msg=All the details have been inserted successfully");
			}
			else
			{
				response.sendRedirect("Error.jsp?msg=Program has not been added due to some error please re-enter all the details");
			}
			}
			else
			{
				response.sendRedirect("Error.jsp?msg=You are not Logged In");
			}
			
		}
		
		if(page.equals("Admsch"))
		{
			if(request.getSession(false)!=null)
			{
			String program_name= request.getParameter("programName");
			System.out.println("haha "+program_name);
			String loc=request.getParameter("loc");
			String sday=request.getParameter("sday");
			String smon= request.getParameter("smon");
			String syear=request.getParameter("syear");
			String sdate=sday+"-"+smon+"-"+syear;
			String eday=request.getParameter("eday");
			String emon= request.getParameter("emon");
			String eyear=request.getParameter("eyear");
			String edate=eday+"-"+emon+"-"+eyear;
			int spw=Integer.parseInt(request.getParameter("spw"));
			
			Date s_date= new Date(sdate);
			Date e_date = new Date(edate);
			
			ProgramSchedule progS=new ProgramSchedule();
			progS.setLocation(loc);
			progS.setSessions_per_week(spw);
			progS.setProgram_name(program_name);
			progS.setStartdate(s_date);
			progS.setEnddate(e_date);
		
			AdminLogin admlogin= new AdminLogin();
			boolean status=admlogin.Admin_schedule_program(progS);
		
			if(status)
			{
				System.out.println("Schedule successfully added");
				response.sendRedirect("Success.jsp?msg=All the details have been inserted successfully");
			}
			else
			{
				response.sendRedirect("Error.jsp?msg=Scheduled Program has not been added due to some error please re-enter all the details");
			}
		}
		}
		if(page.equals("Admget"))
		{
			if(request.getSession(false)!=null)
			{
			String pname= request.getParameter("programName");
			AdminLogin adm= new AdminLogin();
			ProgramsOffered pgf= new ProgramsOffered();
			pgf=adm.get_program_details(pname);
			request.getSession(false).setAttribute("vect", pname);
			request.setAttribute("plist", pgf);
			RequestDispatcher rd;
			rd=request.getRequestDispatcher("Admin_update.jsp");
			rd.forward(request, response);
		
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		}
		if(page.equals("Admupd"))
		{
			if(request.getSession(false)!=null)
			{
			String program_name= (String) request.getSession().getAttribute("vect");
			System.out.println(program_name);
			String desc=request.getParameter("desc");
			String eligibilty=request.getParameter("elig");
			int duration=Integer.parseInt(request.getParameter("dur"));
			String cert=request.getParameter("cert");
			ProgramsOffered pgf1=new ProgramsOffered();
			pgf1.setProgram_name(program_name);
			pgf1.setApplicant_eligibilty(eligibilty);
			pgf1.setDescription(desc);
			pgf1.setDegree_certificate_offered(cert);
			pgf1.setDuration(duration);
			AdminLogin admlog= new AdminLogin();
			boolean status=admlog.upd_program_details(pgf1);
			if(status)
			{
				System.out.println("Successfully Updated");
				response.sendRedirect("Success.jsp?msg=All the details have been updated successfully");
			}
			else
			{
				System.out.println("not Updated");
				response.sendRedirect("Error.jsp?msg=Program is not updated . Some error has ocurred please try again");
			}
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		}
		if(page.equals("Admview"))
		{
			if(request.getSession(false)!=null)
			{
			String pname= request.getParameter("programName");
			AdminLogin adm= new AdminLogin();
			ProgramsOffered pgf= new ProgramsOffered();
			pgf=adm.get_program_details(pname);
			request.getSession(false).setAttribute("vect", pname);
			request.setAttribute("plist", pgf);
			RequestDispatcher rd;
			String sub=request.getParameter("sub");
			if(sub.equals("adm"))
			{
			rd=request.getRequestDispatcher("Admin_view.jsp");
			rd.forward(request, response);
			}
			else
			{
				rd=request.getRequestDispatcher("ViewPrograms.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		
		}
		if(page.equals("Admviewsch"))
		{
			if(request.getSession(false)!=null)
			{
			String sname= request.getParameter("scheduleName");
			AdminLogin adm= new AdminLogin();
			ProgramSchedule ps= new ProgramSchedule();
			ps=adm.get_schedule_details(sname);
			request.getSession(false).setAttribute("vects", sname);
			request.setAttribute("slist", ps);
			RequestDispatcher rd;
			rd=request.getRequestDispatcher("Admin_view_scheduled.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		
		}
		if(page.equals("schdel"))
		{
			if(request.getSession(false)!=null)
			{
			String sname= request.getParameter("sname");
			AdminLogin adm= new AdminLogin();
			boolean status=adm.delete_schedule_details(sname);
			if(status)
			{
				System.out.println("Successfully Deleted");
				response.sendRedirect("Success.jsp?msg=Details have been deleted successfully");
			}
			else
			{
				System.out.println("not Updated");
				response.sendRedirect("Error.jsp?msg=Schedule program not deleted. Some error has ocurred please try again");
			}
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		}
		
		if(page.equals("prodel"))
		{
			if(request.getSession(false)!=null)
			{
			String pname= request.getParameter("pname");
			AdminLogin adm= new AdminLogin();
			boolean status=adm.delete_program_details(pname);
			if(status)
			{
				System.out.println("Successfully Deleted");
				response.sendRedirect("Success.jsp?msg=Details have been deleted successfully");
			}
			else
			{
				System.out.println("not Updated");
				response.sendRedirect("Error.jsp?msg=program not deleted. Some error has ocurred please try again");
			}
		}
		else
		{
			response.sendRedirect("Error.jsp?msg=You are not Logged In");
		}
		}
		
		if(page.equals("applicant"))
		{
			HttpSession ses=request.getSession();
			UASDao udao=new UASDao();
			ProgramSchedule prg;
			int id = 0;
			if(ses!=null)
			{
				String cho=request.getParameter("hide");
				int choice=Integer.parseInt(cho);
				
				switch (choice) 
				{
				case 1:
					
					ApplicForm aform;
					
					System.out.println("hi");
					String fn=request.getParameter("firstname");
					String mn=request.getParameter("middlename");
					String ln=request.getParameter("lastname");
					String dob=request.getParameter("dd")+"-"+request.getParameter("mm")+"-"+request.getParameter("yy");
					System.out.println(dob);
					String high_qua=request.getParameter("high_qua");
					String mar=request.getParameter("markstxt");
			     	String sch=request.getParameter("sp");
					String goal=request.getParameter("goal");
					String email=request.getParameter("email");
					
					Date a_dob=new Date(dob);

						System.out.println(a_dob);
											
					int mark=Integer.parseInt(mar);
					aform=new ApplicForm();
					
					aform.setFirstname(fn);
					aform.setMiddlename(mn);
					aform.setLastname(ln);
					aform.setDob(a_dob);
					aform.setHigh_qua(high_qua);
					aform.setMarks(mark);
			       aform.setSch_prog(sch);
					aform.setGoal(goal);
					aform.setEmail(email);
					
					System.out.println(aform);
															
					try
					{
						id=udao.formSubmission(aform);
					} 
					catch (SQLException e)
					{
						e.printStackTrace();
					} catch (Exception e) 
					{
						e.printStackTrace();
					}
					if(id>0)
					{
					System.out.println("successfully inserted");
					System.out.println(id);
					ses.setAttribute("appid", id);
				    System.out.println("appid");
					RequestDispatcher rd=request.getRequestDispatcher("Successapp.jsp?msg=Your Application has been sent succesfully");
					rd.forward(request, response);
					
					}
					else	
					{
						System.out.println(" Not successfully inserted");
						response.sendRedirect("fail.jsp");
					}
						break;
				case 2:
					System.out.println("in case2");
					String status=null;
					String ap_id=request.getParameter("apid");
					int appid=Integer.parseInt(ap_id);
					
					try {
						status=udao.viewStatus(appid);
					} catch (SQLException e) {
					
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
					
						e.printStackTrace();
					}
					System.out.println(status);
					if(status!=null)
					{
						ses.setAttribute("status", status);
						RequestDispatcher rd=request.getRequestDispatcher("status.jsp");
						rd.forward(request, response);
								
					}
					else
					{
						response.sendRedirect("fail.jsp");
					}
					break;
				case 3:
					List sch_list=new ArrayList();
					try
					{
						sch_list=udao.viewScheduleProgram();
						Iterator sp=sch_list.iterator();
						   
							while(sp.hasNext())
							{
							prg=new ProgramSchedule();
							prg=(ProgramSchedule) sp.next();
							System.out.println(prg.getScheduled_program_id());
							}
					}
					catch (SQLException e)
					{
						e.printStackTrace();
					} 
					catch (ClassNotFoundException e)
					{
						e.printStackTrace();
					}
			      
			
					ses.setAttribute("list", sch_list);
					request.getRequestDispatcher("schDisplay.jsp").forward(request, response);
					}
	
			}
		}
		if(page.equals("mac"))
		{
			String option=request.getParameter("macbtn");
			HttpSession ses=request.getSession();
			ses.setAttribute("message", "valid date");
			if(option.equals("View Applictions"))
			{
				/*MacDao dao=new MacDao();
				String progid=request.getParameter("progid");
				try {
					List<ApplicationBean> list= dao.viewApplications(progid);
					ses.setAttribute("allprog", list);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
				response.sendRedirect("View.jsp");
			}
			if(option.equals("View"))
			{
				MacDao dao=new MacDao();
				String progid=request.getParameter("pgmID");
				try {
					List<ApplicForm> list= dao.viewApplications(progid);
					ses.setAttribute("lis", list);
					response.sendRedirect("GenerateReport.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(option.equals("Update Application"))
			{
				MacDao dao=new MacDao();
				try {
					List<String> programs=dao.retrieveScheduledProgram();
					ses.setAttribute("progs",programs);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("list.jsp");
			}
			else if(option.equals("filter"))
			{
				String progid=request.getParameter("progid");
				MacDao dao=new MacDao();
				ses.setAttribute("proid",progid);
				List<ApplicForm> apps=dao.filterApplications(progid);
				ses.setAttribute("applications",apps);
				response.sendRedirect("filterApps.jsp");
			}
			else if(option.equals("accept"))
			{
				String progid=(String) ses.getAttribute("proid");
				String date=request.getParameter("day")+"-"+request.getParameter("month")+"-"+request.getParameter("year");
				SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
				Date d=new Date();
				Date d1 = null;
				try {
					d1=sdf.parse(date);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(d.before(d1))
				{	
				int elem=Integer.parseInt(request.getParameter("hid"));
				MacDao dao=new MacDao();
				List<ApplicForm> apps=(List<ApplicForm>) ses.getAttribute("applications");
				ApplicForm appbean=apps.get(elem);
				//String date=request.getParameter("day")+"-"+request.getParameter("month")+"-"+request.getParameter("year");
				try {
					dao.acceptApplication(appbean.getApplication_id(), date);
					List<ApplicForm> apps1=dao.filterApplications(progid);
					ses.setAttribute("applications",apps1);
					response.sendRedirect("filterApps.jsp");			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}else
				{
					ses.setAttribute("message","invalid date");
					response.sendRedirect("filterApps.jsp");
				}	
			}
			else if(option.equals("reject"))
			{
				String progid=(String) ses.getAttribute("proid");
				int elem=Integer.parseInt(request.getParameter("hid"));
				MacDao dao=new MacDao();
				List<ApplicForm> apps=(List<ApplicForm>) ses.getAttribute("applications");
				ApplicForm appbean=apps.get(elem);
				try {
					dao.rejectApplication(appbean.getApplication_id());
					List<ApplicForm> apps1=dao.filterApplications(progid);
					ses.setAttribute("applications",apps1);
					response.sendRedirect("filterApps.jsp");			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(option.equals("confirm"))
			{
				String progid=(String) ses.getAttribute("proid");
				int elem=Integer.parseInt(request.getParameter("hid"));
				MacDao dao=new MacDao();
				List<ApplicForm> apps=(List<ApplicForm>) ses.getAttribute("applications");
				ApplicForm appbean=apps.get(elem);
				try {
					dao.confirmApplication(appbean.getApplication_id());
					List<ApplicForm> apps1=dao.filterApplications(progid);
					ses.setAttribute("applications",apps1);
					response.sendRedirect("filterApps.jsp");			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			}
		
		if(page.equals("MACLogin"))
		{
			HttpSession session= request.getSession();
			session.setAttribute("role", "other");
			String userid=request.getParameter("uid");
			String password=request.getParameter("pwd");
			MacDao MAClogin=new MacDao();
			boolean status=MAClogin.validate_mac(userid,password);
			System.out.println("status "+status);
			if(status)
			{
				System.out.println("In IF");
				request.getSession().setAttribute("role", "mac");
				RequestDispatcher rd;
				rd=request.getRequestDispatcher("MACHome.jsp");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Wrong password/ID");
				request.getSession().invalidate();
				response.sendRedirect("Error.jsp?msg=you have entered wrong password or ID");
			}
		}
	}

}

