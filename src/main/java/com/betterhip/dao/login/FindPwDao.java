package com.betterhip.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FindPwDao {
DataSource dataSource;
	
	//생성자
	public FindPwDao() {
		// TODO Auto-generated constructor stub
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String findPw(String user_id, String user_name, String user_email) {
		
		String user_pw  = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select user_pw from user where user_id=? && user_name=? && user_email=?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, user_id);
			preparedStatement.setString(2, user_name);
			preparedStatement.setString(3, user_email);
			
			preparedStatement.executeUpdate();
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user_pw = resultSet.getString("user_pw");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		return user_pw;
	}
}
