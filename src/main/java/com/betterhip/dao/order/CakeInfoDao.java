package com.betterhip.dao.order;

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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.betterhip.dto.order.CakeInfoDto;
import com.betterhip.dto.order.CakeListDto;
import com.mysql.cj.Session;

public class CakeInfoDao {
	
	//datasource 불러오기
	DataSource dataSource;
	
	public CakeInfoDao() {
		// TODO Auto-generated constructor stub
	
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public ArrayList<CakeInfoDto> list(String user_id) {
		
		ArrayList<CakeInfoDto> dtos = new ArrayList<CakeInfoDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		
		
		
		return dtos;
	}

}
