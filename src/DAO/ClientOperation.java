package DAO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.City;
import Model.Client;
import Model.ServiceData;
import Model.ServiceRequest;
import util.CreateConnection;

public class ClientOperation
{
	static CreateConnection con=null;
	static Connection cn=null;
	
	static
	{
		con=new CreateConnection();
		cn=con.DoConnection();
	}
	
	public ArrayList<Client> getAllClient()
	{
		ArrayList<Client> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from clientmaster c join servicedetails s join city ct where c.serviceid = s.serviceid and c.cityid=ct.cityid");
				while(rs.next())
				{
						 Client ct = new Client();
						
				
							ct.setCid(rs.getInt(1));
							ct.setClientName(rs.getString(2));
							ct.setAddress(rs.getString(3));
							ct.setCity(rs.getString("cityname"));
							ct.setZip(rs.getString(5));
							ct.setClientPhone(rs.getString(6));
							ct.setClientEmail(rs.getString(7));
							ct.setClientPassword(rs.getString(8));
							ct.setClientCompany(rs.getString(9));
							ct.setServiceName(rs.getString("servicename"));
							ct.setStatus(rs.getInt(11));
							ct.setClientImage(rs.getString(12));
							
							al.add(ct);
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
		return al;
	}
    
	public boolean checkLogin(Client cl)
	{
		boolean b=false;
		try {
			Statement st =cn.createStatement();
			ResultSet rs=st.executeQuery("select * from clientmaster where email='"+cl.getClientEmail()+"' and password='"+cl.getClientPassword()+"' and status = 1 ");
			
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
			System.out.println(b);
			System.out.println("verification under Procces");	
			
	     	} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		return b;
		
	}
	public int updateStatus(int id) 
	{
		int i=0;
		
		try {
			PreparedStatement ps =cn.prepareStatement("update clientmaster set status=? where clientid=?");
			ps.setInt(1, 1);
			ps.setInt(2, id);
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
	}

	public void deleteStatus(int id) 
	{
		try {
			Statement st=cn.createStatement();
			st.executeUpdate("delete from clientmaster where clientid='"+id+"'");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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

	public List<ServiceData> getAllServices()
	{
		ArrayList<ServiceData> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from servicedetails ");
			while(rs.next())
			{
				ServiceData c =new ServiceData();
				c.setSid(rs.getInt(1));
				c.setSname(rs.getString(2));
				
				al.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
		
	}
	
	public List<ServiceRequest> getAllOrders(int i)
	{
		ArrayList<ServiceRequest> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from servicerequest where assignedId='"+i+"'");
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
				
				al.add(ser);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
		
	}
	
	
	public List<ServiceData> getAllServicesById(int sid1)
	{
		ArrayList<ServiceData> al =new ArrayList<>();
		Statement st;
		try {
			st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from servicedetails where serviceid= '"+sid1+"'");
			while(rs.next())
			{
				ServiceData c =new ServiceData();
				c.setSid(rs.getInt(1));
				c.setSname(rs.getString(2));
				
				al.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
		
	}

	public int addClient(Client cl)
	{
		int i=0;
		try {
			PreparedStatement ps = cn.prepareStatement("insert into clientmaster values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, cl.getClientName());
			ps.setString(3, cl.getAddress());
			ps.setInt(4, cl.getCtid());
			ps.setString(5, cl.getZip());
			ps.setString(6,cl.getClientPhone());
			ps.setString(7, cl.getClientEmail());
			ps.setString(8, cl.getClientPassword());
			ps.setString(9, cl.getClientCompany());
			ps.setInt(10, cl.getSid());
			ps.setInt(11, 0);
			ps.setString(12, cl.getClientImage());
			ps.setInt(13, 0);
			
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	public Client getDataById(String email) 
	{
		Client cl= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from clientmaster c join city ct join servicedetails s on c.cityid=ct.cityid and c.serviceid=s.serviceid where c.email='"+email+"'");
			
			while(rs.next())
			{
				cl=new Client();
				cl.setCid(rs.getInt(1));
				cl.setClientName(rs.getString(2));
				cl.setAddress(rs.getString(3));
				cl.setCity(rs.getString("cityname"));
				cl.setZip(rs.getString(5));
				cl.setClientPhone(rs.getString(6));
				cl.setClientEmail(rs.getString(7));
				cl.setClientPassword(rs.getString(8));
				cl.setClientCompany(rs.getString(9));
				cl.setServiceName(rs.getString("servicename"));
				cl.setClientImage(rs.getString(12));
			}
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return cl ;
		
	}

	public List<Client> getClientByServiceId(int id)
	{
		ArrayList<Client> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from clientmaster c join servicedetails s join city ct where c.serviceid = s.serviceid and c.cityid=ct.cityid and c.serviceid='"+id+"' and c.status=1");

			
			
				while(rs.next())
				{
						 Client ct = new Client();
							ct.setCid(rs.getInt(1));
							ct.setClientName(rs.getString(2));
							ct.setAddress(rs.getString(3));
							ct.setCity(rs.getString("cityname"));
							ct.setZip(rs.getString(5));
							ct.setClientPhone(rs.getString(6));
							ct.setClientEmail(rs.getString(7));
							ct.setClientPassword(rs.getString(8));
							ct.setClientCompany(rs.getString(9));
							ct.setServiceName(rs.getString("servicename"));
							ct.setStatus(rs.getInt(11));
							ct.setClientImage(rs.getString(12));
							ct.setBusystatus(rs.getInt(13));
							ct.setServiceassigned(rs.getInt(14));
							al.add(ct);
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return al;
	}

	public int UpdateClientData(Client cu) 
	{
		int j=0;
		
		try {
			
			
			PreparedStatement ps =cn.prepareStatement("update clientmaster set name=?,address=?,cityid=?,zip=?,phoneno=?,password=?,company=?,serviceid=?,status=? where email=?");
			
			ps.setString(1, cu.getClientName());
			ps.setString(2, cu.getAddress());
			ps.setInt(3, cu.getCtid());
			ps.setString(4, cu.getZip());
			ps.setString(5, cu.getClientPhone());
			ps.setString(6, cu.getClientPassword());
			ps.setString(7, cu.getClientCompany());
			ps.setInt(8,cu.getServiceid());
			ps.setInt(9, 0);
			ps.setString(10, cu.getClientEmail());
		
			
			j= ps.executeUpdate();
		    } 
		catch (SQLException e) 
			{
				
				e.printStackTrace();
			}	
		return j;
	 
	}
	
	public int getcityid(String city) 
	{
		Statement st=null;
		int ctid = 0;
		try {
			st = cn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			ResultSet rs = st.executeQuery("select * from city where cityname='"+city+"'");
			
			while(rs.next())
			{
				ctid=rs.getInt(1);
			}
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		
		return ctid;
	}

	public int getserviceid(String serviceName) 
	{
		Statement st=null;
		int servid=0;
		try {
			st=cn.createStatement();
			} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ResultSet rs1=st.executeQuery("select * from servicedetails where servicename='"+serviceName+"'");
			
			while(rs1.next())
			{
				servid=rs1.getInt(1);
			}
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return servid;
		
	}
	
	
	
		public String sendSms(String phno,int otp) 
		{
			try {
				// Construct data
				String apiKey = "apikey=" + "BgZrfSvjHDc-DRrgnU2VPY4ZtyvLd3or1X4lRKtXwC";
				String message = "&message=" + otp;
				String sender = "&sender=" + "TXTLCL";
				String numbers = "&numbers=" + phno;
				
				// Send data
				HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
				String data = apiKey + numbers + message + sender;
				conn.setDoOutput(true);
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
				conn.getOutputStream().write(data.getBytes("UTF-8"));
				final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				final StringBuffer stringBuffer = new StringBuffer();
				String line;
				//System.out.println(line=rd.readLine());
				while ((line = rd.readLine()) != null) {
					stringBuffer.append(line);
					System.out.println(line);
					
				}
				rd.close();
				
				return "send";
			} catch (Exception e) {
				
				System.out.println("Error SMS "+e);
				return "Error "+e;
			}
		}

		public Client getassgnedClient(int srid) 
		{
			
			 Client ct = new Client();
			Statement st;
			try {
					st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from clientmaster c join servicedetails s join city ct where c.serviceid = s.serviceid and c.cityid=ct.cityid and c.serviceid='"+srid+"' and c.status=1");
					while(rs.next())
					{
								if(rs.getInt(13) != 1)
								{
									ct.setCid(rs.getInt(1));
									ct.setClientName(rs.getString(2));
									ct.setAddress(rs.getString(3));
									ct.setCity(rs.getString("cityname"));
									ct.setZip(rs.getString(5));
									ct.setClientPhone(rs.getString(6));
									ct.setClientEmail(rs.getString(7));
									ct.setClientPassword(rs.getString(8));
									ct.setClientCompany(rs.getString(9));
									ct.setServiceName(rs.getString("servicename"));
									ct.setStatus(rs.getInt(11));
									ct.setClientImage(rs.getString(12));
									ct.setBusystatus(rs.getInt(13));
									ct.setServiceassigned(rs.getInt(14));
									
									PreparedStatement ps =cn.prepareStatement("update clientmaster set busystatus=? where clientid=?");
									ps.setInt(1, 1);
									ps.setInt(2, ct.getCid());
									ps.executeUpdate();
									break;
								}
								
								
							}
				     
		    	}	
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
			
				}
			return ct;
		}

		public int serviceDone(int id, int id2) 
		{
			int i=0;
			int j=0;
			try {
				PreparedStatement ps=cn.prepareStatement("update clientmaster set busystatus=? where clientid=?");
				ps.setInt(1, 0);
				ps.setInt(2, id);
				i=ps.executeUpdate();
				PreparedStatement ps1=cn.prepareStatement("update servicerequest set assignedId=? where srid=?");
				ps1.setInt(1, 0);
				ps1.setInt(2, id2);
				j=ps1.executeUpdate();
				//status update of service
				PreparedStatement ps2=cn.prepareStatement("update servicerequest set status=? where srid=?");
				ps2.setBoolean(1, true);
				ps2.setInt(2, id2);
				ps2.executeUpdate();
				
				
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
			return j;
		}

		public String getEmailById(int id) 
		{
			String email = null;
			try {
				PreparedStatement ps=cn.prepareStatement("select * from clientmaster where clientid=?");
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					email=rs.getString(7);
				}
				
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
			return email;
		}

	

		
	}

	

