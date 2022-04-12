package com.betterhip.dao.login;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.betterhip.dto.order.CakeListDto;

public class FindIdDao {
	DataSource dataSource;
	
	//생성자
	public FindIdDao() {
		// TODO Auto-generated constructor stub
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String findId(String user_name, String user_email) {
		
		String user_id = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select user_id from user where user_name=? && user_email=?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, user_name);
			preparedStatement.setString(2, user_email);
			
			preparedStatement.executeUpdate();
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user_id = resultSet.getString("user_id");
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
		
		return user_id;
	}
	
}
