package com.betterhip.dao.main;

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

import com.betterhip.dto.main.CakeAdDto;

public class CakeAdDao {

	DataSource dataSource;
	
	public CakeAdDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CakeAdDto> cakead() {
		ArrayList<CakeAdDto> dtos = new ArrayList<CakeAdDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select curate.curate_title, cake.cake_id, cake.cake_img, cake.cake_name, cake.cake_saleprice from cake, curate where curate.curate_cake_id = cake.cake_id";
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String curate_title = resultSet.getString("curate.curate_title");
				int cake_id = resultSet.getInt("cake.cake_id");
				Blob cake_img = resultSet.getBlob("cake.cake_img");
				String cake_name = resultSet.getString("cake_name");
				int cake_saleprice = resultSet.getInt("cake_saleprice");
				
				// Bite 로 바꾸기 
				InputStream inputStream = cake_img.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				
				while((bytesRead = inputStream.read(buffer)) !=-1) {
					outputStream.write(buffer, 0 ,bytesRead);
				}
				byte[] imageBytes = outputStream.toByteArray();
				
				// 바이트 > 문자열
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
				
				inputStream.close();
				outputStream.close();
				
				CakeAdDto cakeAdDto = new CakeAdDto(curate_title, cake_id, base64Image, cake_name, cake_saleprice);
				dtos.add(cakeAdDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	
}
