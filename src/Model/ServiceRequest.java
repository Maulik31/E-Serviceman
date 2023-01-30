package Model;

import java.awt.List;
import java.sql.Date;
import java.util.ArrayList;

import DAO.ClientOperation;

public class ServiceRequest 
{
	int srid;
	int ctid;
	int assignedId;
	int servicemanid;
	String date;
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getServicemanid() {
		return servicemanid;
	}

	public void setServicemanid(int servicemanid) {
		this.servicemanid = servicemanid;
	}

	public boolean isSstatus() {
		return sstatus;
	}

	public void setSstatus(boolean sstatus) {
		this.sstatus = sstatus;
	}

	boolean sstatus;
	
	public int getAssignedId() {
		return assignedId;
	}

	public void setAssignedId(int assignedId) {
		this.assignedId = assignedId;
	}

	public int getCtid() {
		return ctid;
	}

	public void setCtid(int ctid) {
		this.ctid = ctid;
	}

	String serviceRequested,userName,userAddress,userCity,userZip,userPhone,userEmail,serviceDescription,feedback;

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getServiceRequested() {
		return serviceRequested;
	}

	public void setServiceRequested(String serviceRequested) {
		this.serviceRequested = serviceRequested;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserCity() {
		return userCity;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserZip() {
		return userZip;
	}

	public void setUserZip(String userZip) {
		this.userZip = userZip;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getServiceDescription() {
		return serviceDescription;
	}

	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}

	public int getSrid() {
		return srid;
	}

	public void setSrid(int srid) {
		this.srid = srid;
	}

	

	
}
