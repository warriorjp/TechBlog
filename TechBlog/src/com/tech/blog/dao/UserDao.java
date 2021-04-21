package com.tech.blog.dao;
import java.util.*;


import com.tech.blog.entities.User;

import java.sql.*;
public class UserDao { 

	 private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	 
	public boolean saveUser(User user) {
		boolean f=false;
try {
	
	String query="insert into user(name,email,password,gender) values(?,?,?,?)";
	PreparedStatement pstm=this.con.prepareStatement(query);
	pstm.setString(1, user.getName());
	pstm.setString(2, user.getEmail());
	pstm.setString(3, user.getPassword());
	pstm.setString(4, user.getGender());
	
	pstm.executeUpdate();
	f=true;
}catch (Exception e) {
	e.printStackTrace();
}
return f;
	}
//get User email and Password
	public User getUserByEmailAndPassword(String email, String password) {
		User user=null;
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement pstm=this.con.prepareStatement(query);
			pstm.setString(1,email);
			pstm.setString(2,password);
			ResultSet set=pstm.executeQuery();
			 
			if(set.next()) {
				user=new User();
				//data from db
				String name=set.getString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setGender(set.getString("gender"));
				user.setPassword(set.getString("password"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
		
				
			}
			
		}catch(Exception e) {
			
		}
		return user;
	}

	public boolean updateUser(User user) {
		boolean  f=false;
		try {
			String query="update user set name =?,email=?, password=?, gender=? ,profile=? where id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1,user.getName());
			p.setString(2,user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4,user.getGender());
			p.setString(5, user.getProfile());
			p.setInt(6, user.getId());
			p.executeUpdate() ;
			f=true;
		}catch(Exception e){
		e.printStackTrace();	
		}
		return f;
	}
}
