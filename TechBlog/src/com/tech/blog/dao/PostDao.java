package com.tech.blog.dao;
import  java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

import javafx.geometry.Pos;
public class PostDao {
    Connection con;
    
public PostDao(Connection con) {
	super();
	this.con = con;
}

public ArrayList<Category> getAllCategories() {
ArrayList<Category> list=new ArrayList<>();
try {
	String q="select * from categories";
	Statement st=this.con.createStatement();
	ResultSet set=st.executeQuery(q);
	
	while (set.next()) {
		int cid=set.getInt("cid");
		String name=set.getString("name");
		String description = set.getString("description");
		Category c = new Category(cid,name,description);
		list.add(c);
	}
}catch(Exception e) {
		e.printStackTrace();
	}
return list;	
}

public boolean savePost(Post p) {
	boolean f = false;
	try {
		String q="insert into post(pTitle,pContent,pCode,pPic,catid,userId) values(?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(q);
		pstmt.setString(1, p.getpTitle());
		pstmt.setString(2, p.getpContent());
		pstmt.setString(3,p.getpCode());
		pstmt.setString(4,p.getpPic());
		pstmt.setInt(5, p.getCatid());
		pstmt.setInt(6, p.getUserId());
		pstmt.executeUpdate();
		f = true;
	}catch (Exception e) {
		e.printStackTrace();
		
	}

	System.out.println("hii"+f);
	return f;
	}
		
//get all the posts
public List<Post> getAllPosts()
{
	
	List<Post> list = new ArrayList<>();
	try {
		PreparedStatement p=con.prepareStatement("select * from post order by pid desc");
		ResultSet set=p.executeQuery();
		
		while(set.next()) {
			int pid=set.getInt("pid");
			String pTitle=set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode=set.getString("pCode");
			String pPic=set.getString("pPic");
			Timestamp date=set.getTimestamp("pDate");
			int catid=set.getInt("catId");
			int userId=set.getInt("userId");
			Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catid, userId);
			list.add(post);
		}
	}catch (Exception e) {
		System.out.println(e);
	}
	return list;
}

public List<Post> getPostsbyCatId(int catid){
	List<Post> list = new ArrayList<>();
	
	try {
		PreparedStatement p=con.prepareStatement("select * from post where catId=?");
		p.setInt(1,catid);
		ResultSet set=p.executeQuery();
		
		while(set.next()) {
			int pid=set.getInt("pid");
			String pTitle=set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode=set.getString("pCode");
			String pPic=set.getString("pPic");
			Timestamp date=set.getTimestamp("pDate");

			int userId=set.getInt("userId");
			Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catid, userId);
			list.add(post);
		}
	}catch (Exception e) {
	System.out.println(e);
		
	}
	return list;
}

public Post getPostByPostId(int postId){
	Post post=null;
	String q="select * from post where pid=?";
	try {
	PreparedStatement p=this.con.prepareStatement(q);
	p.setInt(1,postId);
	ResultSet set=p.executeQuery();
	if(set.next()) {
		int pid=set.getInt("pid");
		String pTitle=set.getString("pTitle");
		String pContent=set.getString("pContent");
		String pCode=set.getString("pCode");
		String pPic=set.getString("pPic");
		Timestamp date=set.getTimestamp("pDate");
		int catid=set.getInt("catId");
		int userId=set.getInt("userId");
		 post=new Post(pid, pTitle, pContent, pCode, pPic, date, catid, userId);;
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	return post;
}
}
