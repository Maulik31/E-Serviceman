package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import Model.Client;
import Model.ServiceData;
import Model.ServiceRequest;
import util.CreateConnection;

public class Alloprations
{
	
	static CreateConnection con=null;
	static Connection cn=null;
	
	static
	{
		con=new CreateConnection();
		cn=con.DoConnection();
	}
	
	
	public ArrayList<ServiceData> getAllservice()
	{
		ArrayList<ServiceData> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from servicedetails");
				while(rs.next())
				{
						ServiceData sdata = new ServiceData();
						
							sdata.setSid(rs.getInt(1));
							sdata.setSname(rs.getString(2));
							sdata.setSdetails(rs.getString(3));
							sdata.setSimage(rs.getString(4));
							
							al.add(sdata);
	                 
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return al;
	}

	public int addservice(ServiceData s1) 
	{	
		int i = 0;
		int k=0;
		
		try {
			Statement st=cn.createStatement();
			i=st.executeUpdate("insert into servicedetails values(0,'"+s1.getSname()+"','"+s1.getSdetails()+"','"+s1.getSimage()+"')");
			
		} catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int addUserRequest(ServiceRequest sr, Client c) 
	{	
		int i = 0;
		int k=0;
		
		try {
			PreparedStatement ps=cn.prepareStatement("insert into servicerequest values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, sr.getUserName());
			ps.setString(3, sr.getUserAddress());
			ps.setInt(4, sr.getCtid());
			ps.setString(5, sr.getUserZip());
			ps.setString(6, sr.getUserPhone());
			ps.setString(7, sr.getUserEmail());
			ps.setString(8, sr.getServiceDescription());
			ps.setInt(9, sr.getSrid());
			ps.setInt(10, c.getCid());
			ps.setBoolean(11,sr.isSstatus());
			ps.setString(12,sr.getFeedback());
			ps.setString(13,sr.getDate());
			
			i=ps.executeUpdate();
			
		} catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int deleteData(int id)
	{
		int i=0;
		
		Statement st;
		try 
		{
			st = cn.createStatement();
			i = st.executeUpdate("delete from servicedetails where serviceid='"+id+"'");
		} catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		return i;
	
    }
	
	public ServiceData getDataById(int id ) 
	{
		ServiceData sdata= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from servicedetails where serviceid='"+id+"'");
			
			while(rs.next())
			{
				sdata=new ServiceData();
				sdata.setSid(rs.getInt(1));
				sdata.setSname(rs.getString(2));
				sdata.setSdetails(rs.getString(3));
				sdata.setSimage(rs.getString(4));	
			}
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return sdata ;
		
	}
	
	public int updateService(ServiceData sdata)
	{
		int i=0;
		
		try {
			PreparedStatement ps =cn.prepareStatement("update servicedetails set servicename =?,servicedetails=?,serviceimage =? where serviceid =?");
			
			ps.setString(1, sdata.getSname());
			ps.setString(2, sdata.getSdetails());
			ps.setString(3, sdata.getSimage());
			ps.setInt(4, sdata.getSid());
			
			i= ps.executeUpdate();
		    } 
		catch (SQLException e) 
			{
				
				e.printStackTrace();
			}	
		return i;
		
	 }

	public ArrayList<ServiceRequest> getAllorders()
	{
		ArrayList<ServiceRequest> al= new ArrayList<>();
		
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from servicerequest where status=0");
				while(rs.next())
				{
						ServiceRequest sreq = new ServiceRequest();
						
							sreq.setSrid(rs.getInt(1));
							sreq.setUserName(rs.getString(2));
							sreq.setUserAddress(rs.getString(3));
							sreq.setUserCity(rs.getString(4));
							sreq.setUserZip(rs.getString(5));
							sreq.setUserPhone(rs.getString(6));
							sreq.setUserEmail(rs.getString(7));
							sreq.setServiceDescription(rs.getString(8));
							sreq.setServiceRequested(rs.getString(9));
							sreq.setAssignedId(rs.getInt(10));
							
							al.add(sreq);
	                 
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return al;
	}
	
	public ArrayList<ServiceRequest> getAllordersc()
	{
		ArrayList<ServiceRequest> al= new ArrayList<>();
		
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from servicerequest where status=1");
				while(rs.next())
				{
						ServiceRequest sreq = new ServiceRequest();
						
							sreq.setSrid(rs.getInt(1));
							sreq.setUserName(rs.getString(2));
							sreq.setUserAddress(rs.getString(3));
							sreq.setUserCity(rs.getString(4));
							sreq.setUserZip(rs.getString(5));
							sreq.setUserPhone(rs.getString(6));
							sreq.setUserEmail(rs.getString(7));
							sreq.setServiceDescription(rs.getString(8));
							sreq.setServiceRequested(rs.getString(9));
							sreq.setAssignedId(rs.getInt(10));
							sreq.setDate(rs.getString(13));
							sreq.setFeedback(rs.getString(12));
							al.add(sreq);
	                 
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return al;
	}


}
