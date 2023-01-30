package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.City;
import Model.Client;
import Model.ServiceRequest;
import Model.User;
import util.CreateConnection;

public class UserOperation 
{
	static CreateConnection con=null;
	static Connection cn=null;
	
	static
	{
		con=new CreateConnection();
		cn=con.DoConnection();
	}
	
	public boolean checkUserLogin(User cl)
	{
		boolean b=false;
		try {
			Statement st =cn.createStatement();
			ResultSet rs=st.executeQuery("select * from user where email='"+cl.getEmail()+"' and password='"+cl.getPassword()+"'");
			
			while(rs.next())
				{
					/*int status = rs.getInt("status");
					if(status>0)
					{
						b=true;
					}
					*/
				b=true;
				}
			
			
	     	} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		return b;
		
	}

	public User getUserDataById(String email) 
	{
		User cl= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from user  where email='"+email+"'");
			
			while(rs.next())
			{
				cl=new User();
				cl.setName(rs.getString(2));
				cl.setPassword(rs.getString(3));
				cl.setEmail(rs.getString(8));
				cl.setPhone(rs.getString(6));
				cl.setCtid(rs.getInt(5));
				cl.setZip(rs.getString(7));
				cl.setAddress(rs.getString(4));
				cl.setUimage(rs.getString(9));
			
			}
	}catch (SQLException e) 
		{
		
		e.printStackTrace();
	}
	
	return cl ;
}

	public List<ServiceRequest> getAllOrdersById(String email) 
	{
		ArrayList<ServiceRequest> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from servicerequest where useremail='"+email+"'");
			while(rs.next())
			{
				ServiceRequest ser =new ServiceRequest();
				ser.setSrid(rs.getInt(1));
				ser.setUserName(rs.getString(2));
				ser.setUserAddress(rs.getString(3));
				ser.setUserCity(rs.getString(4));
				ser.setUserZip(rs.getString(5));
				ser.setUserPhone(rs.getString(6));
				ser.setUserEmail(rs.getString(7));
				ser.setServiceDescription(rs.getString(8));
				ser.setServiceRequested(rs.getString(9));
				ser.setAssignedId(rs.getInt(10));
				ser.setSstatus(rs.getBoolean(11));
				ser.setFeedback(rs.getString(12));
				ser.setDate(rs.getString(13));
				
				
				
				al.add(ser);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}

	public int adduser(User u1) 
	{
		int i=0;
		try {
			PreparedStatement ps = cn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, u1.getName());
			ps.setString(3, u1.getPassword());
			ps.setString(4, u1.getAddress());
			ps.setInt(5, u1.getCtid());
			ps.setString(6, u1.getPhone());
			ps.setString(7, u1.getZip());
			ps.setString(8, u1.getEmail());
			ps.setString(9, u1.getUimage());
			
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

	public ArrayList<User> getAllUser() 
	{
		ArrayList<User> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from user u join city ct where u.cityid=ct.cityid");
			while(rs.next())
			{
					 User usr = new User();
					
			
						usr.setUserid(rs.getInt(1));
						usr.setName(rs.getString(2));
						usr.setAddress(rs.getString(4));
						usr.setCity(rs.getString("cityname"));
						usr.setZip(rs.getString(7));
					    usr.setPhone(rs.getString(6));
						usr.setEmail(rs.getString(8));
						usr.setPassword(rs.getString(3));
						usr.setUimage(rs.getString(9));
						
						al.add(usr);
					}
		     
    	}	
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	return al;
}
	public int UpdateUserData(User usr) 
	{
		int j=0;
		
		try {
			
			
			PreparedStatement ps =cn.prepareStatement("update user set username=?,password=?,address=?,cityid=?,phone=?,zip=? where email=?");
			
			ps.setString(1, usr.getName());
			ps.setString(2, usr.getPassword());
			ps.setString(3, usr.getAddress());
			ps.setString(4, usr.getCity());
			ps.setString(5, usr.getPhone());
			ps.setString(6, usr.getZip());
			ps.setString(7, usr.getEmail());
			
			j= ps.executeUpdate();
		    } 
		catch (SQLException e) 
			{
				
				e.printStackTrace();
			}	
		return j;
	 
	}
	
	public List<City> getAllCity() 
	{
		ArrayList<City> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from city");
			while(rs.next())
			{
				City c =new City();
				c.setCid(rs.getInt(1));
				c.setCname(rs.getString(2));
				
				al.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		return al;
	}

	public int deletereq(int id) 
	{
		int i = 0;
		try {
			Statement st=cn.createStatement();
		 i =st.executeUpdate("delete from servicerequest where srid='"+id+"'");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public int feedback(int srid, String fb) {
		
        int i=0;
		try {
			PreparedStatement ps =cn.prepareStatement("update servicerequest set feedback=? where srid=?");
			ps.setString(1, fb);
			ps.setInt(2,srid);
			
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}

