/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class PravthiDBO {
    public Connection con;
    PreparedStatement ps;
    public PravthiDBO() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pravathidb","root","");
        }catch(ClassNotFoundException | SQLException e){
            //System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public ResultSet checkUser(String email, String password){
        try{
            PreparedStatement ps = con.prepareStatement("SELECT Status,Details FROM pravathitb WHERE Email=? and Password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet generateAllReport(){
        try{
            PreparedStatement ps = con.prepareStatement("select * from reporttb where verified!=? ORDER BY datetime DESC");
            ps.setString(1, "f");
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet generateOneReport(String issue){
        try{
            PreparedStatement ps = con.prepareStatement("select * from reporttb where verified!=? and issuecat=? ORDER BY datetime DESC");
            ps.setString(1, "f");
            ps.setString(2, issue);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet getUserName(String email){
        try{
            PreparedStatement ps = con.prepareStatement("SELECT name FROM pravathitb WHERE Email=?");
            ps.setString(1, email);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet getPassword(String email){
        try{
            PreparedStatement ps = con.prepareStatement("SELECT Password FROM pravathitb WHERE Email=?");
            ps.setString(1, email);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertmessage(String name, String email, String message, String date1){
        try{
            PreparedStatement ps = con.prepareStatement("INSERT INTO contacttb(name,email,message,date,viewstatus) VALUES(?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);
            ps.setString(4, date1);
            ps.setString(5, "0");
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public boolean insertvolunteer(String name, String email, String pass, String dob, String gender, String phone, String address, String state, String status, String doj, String details, String usermail){
        try{
            PreparedStatement ps = con.prepareStatement("INSERT INTO pravathitb VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, dob);
            ps.setString(5, gender);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.setString(8, state);
            ps.setString(9, status);
            ps.setString(10, doj);
            ps.setString(11, details);
            ps.setString(12, usermail);
            ps.setString(13, "");
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public ResultSet getVolDetails(String email)
    {
        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM pravathitb WHERE Email=?");
            ps.setString(1, email);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean updateVolunteer(String phone, String address, String state, String bg, String email){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE pravathitb SET Phone=?, Address=?, State=?, BloodGroup=? WHERE Email=?");
            ps.setString(1, phone);
            ps.setString(2, address);
            ps.setString(3, state);
            ps.setString(4, bg);
            ps.setString(5, email);
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteVolunteer(String email){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE pravathitb SET Details=? WHERE Email=?");
            ps.setString(1, "inactive");
            ps.setString(2, email);
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean changePasswordVolunteer(String pass, String email){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE pravathitb SET Password=? WHERE Email=?");
            ps.setString(1, pass);
            ps.setString(2, email);
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public ResultSet getunreadMessages(){
        try{
           PreparedStatement ps = con.prepareStatement("SELECT * FROM contacttb WHERE viewstatus=? ORDER BY date DESC");
           ps.setString(1, "0");
           return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet getreadMessages(){
        try{
           PreparedStatement ps = con.prepareStatement("SELECT * FROM contacttb WHERE viewstatus=?  ORDER BY date DESC");
           ps.setString(1, "1");
           return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public ResultSet getMessage(int id){
        try{
           PreparedStatement ps = con.prepareStatement("SELECT * FROM contacttb WHERE id=?");
           ps.setInt(1, id);
           return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertBloodDonor(String d_name, String dob, String email, String phone, String pin, String bgroup, String address, String state, String gender, String regdate) {
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO blooddonor(donor_name,donor_dob,donor_email,donor_phone,donor_pin,bloodgroup,address,state,gender,reg_date) VALUES(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, d_name);
            ps.setString(2, dob);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, pin);
            ps.setString(6, bgroup);
            ps.setString(7, address);
            ps.setString(8, state);
            ps.setString(9, gender);
            ps.setString(10, regdate);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean insertBloodSeeker(String name,String bgrp,String email,String phone,int pin,String address,String state,String date){
        try {
            ps = con.prepareStatement("INSERT INTO tblBloodseeker (s_name,s_group,s_email,s_phone,s_pin,s_address,s_state,regdate) VALUES(?,?,?,?,?,?,?,?) ");
            ps.setString(1,name);
            ps.setString(2, bgrp);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setInt(5, pin);
            ps.setString(6, address);
            ps.setString(7,state );
            ps.setString(8, date);
            return ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ResultSet showBloodDonors(String bgroup,String pin){
        try {
            ps = con.prepareStatement("SELECT donor_name,donor_email,donor_pin,donor_phone FROM blooddonor WHERE bloodgroup=? and donor_pin =? ORDER BY reg_date DESC ");        
            ps.setString(1,bgroup);
            ps.setString(2, pin);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;     
    }
    
    public ResultSet showBloodDonorsVol(String bgroup, String state){
        try {
            ps = con.prepareStatement("SELECT Name, Email, Phone FROM pravathitb WHERE BloodGroup=? AND State=?");        
            ps.setString(1,bgroup);
            ps.setString(2,state);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;     
    }
    
    public ResultSet getBloodSeekers(String State, String Group){
        try{
            ps = con.prepareStatement("SELECT * FROM tblbloodseeker WHERE s_state=? AND s_group=? ORDER BY regdate desc");
            ps.setString(1, State);
            ps.setString(2, Group);
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertDonationSeeker(String dtype,String dname,String email,String dnumber,String address,String state,int damount,String bankname,String accno, String regdate){
        try{
            ps=con.prepareStatement("INSERT INTO donationseektb(d_type,d_name,d_email,d_number,d_address,d_state,d_amount,bank_name,acc_no,reg_date,verified,a_approve,verifiedby) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,dtype);
            ps.setString(2,dname);
            ps.setString(3,email);
            ps.setString(4,dnumber);
            ps.setString(5,address);
            ps.setString(6,state);
            ps.setInt(7,damount);
            ps.setString(8,bankname);
            ps.setString(9,accno);
            ps.setString(10, regdate);
            ps.setString(11, "n");
            ps.setString(12, "n");
            ps.setString(13,"");
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public ResultSet getBankNames(){
        try{
            ps = con.prepareStatement("SELECT * FROM banktbl order by bank_name");
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }    
    
    public ResultSet getSeekersList(){
        try{
            ps = con.prepareStatement("SELECT * FROM donationseektb where verified=?");
            ps.setString(1, "n");
            return ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void closeDB(){
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PravthiDBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}