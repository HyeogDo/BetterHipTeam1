package com.betterhip.dao.order;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
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

public class CakeListDao {
	//datasource 불러오기
		DataSource dataSource;
		
		//생성자
		public CakeListDao() {
			// TODO Auto-generated constructor stub
			try {
				
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		public ArrayList<CakeListDto> list(int start, int len, String order) {
			
			ArrayList<CakeListDto> dtos = new ArrayList<CakeListDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			
			try {
				connection = dataSource.getConnection();
				String query = "select cake_id, cake_name, cake_saleprice, cake_status, cake_img from cake order by ? limit ?, ?";
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, order);
				preparedStatement.setInt(2, start);
				preparedStatement.setInt(3, len);
				
				preparedStatement.executeUpdate();
				
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					int cake_id = resultSet.getInt("cake_id");
					String cake_name = resultSet.getString("cake_name");
					int cake_saleprice = resultSet.getInt("cake_saleprice");
					String cake_status = resultSet.getString("cake_status");
					Blob cake_img = resultSet.getBlob("cake_img");
					
					// blob 파일 내용 -> bytes
					InputStream inputStream = cake_img.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					
					while((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					
					byte[] imageBytes = outputStream.toByteArray();
					
					//바이트 -> 문자열
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					inputStream.close();
					outputStream.close();
					
					CakeListDto cakeListDto = new CakeListDto(cake_id, cake_name, cake_saleprice, cake_status, base64Image);
					dtos.add(cakeListDto);
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
			
			return dtos;
		}
		
		//데이터 row 개수 구하는 함수
		public int getTotalRows() {
			int count = 0;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			
			try {
				connection = dataSource.getConnection();
				String query = "select count(cake_id) from cake";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					count = resultSet.getInt("count(cake_id)");
					
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
			
			return count;
			
		}
		
		public String purchase(String purchase_user_id, int purchase_cake_id, int purchase_customize_id, int purchase_quantity, int purchase_price, String purchase_text, int purchase_status, String purchase_img) {
			String result = "RESULT_NOT_OK";
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			FileInputStream fis;
			try {
				connection = dataSource.getConnection();
				
				//데이터베이스 입력문
				String query = "insert into purchase(purchase_user_id, purchase_cake_id, purchase_customize_id, purchase_quantity, purchase_price, purchase_text, purchase_status, purchase_img) values(?,?,?,?,?,?,?,?)";
				preparedStatement = connection.prepareStatement(query);
				
				File file = new File("image/" + purchase_img);
				FileInputStream inputStream = new FileInputStream(file);
			
				
				//입력문 안에 들어갈 변수 설정
				preparedStatement.setString(1, purchase_user_id);
				preparedStatement.setInt(2, purchase_cake_id);
				preparedStatement.setInt(3, purchase_customize_id);
				preparedStatement.setInt(4, purchase_quantity);
				preparedStatement.setInt(5, purchase_price);
				preparedStatement.setString(6, purchase_text);
				preparedStatement.setInt(7, purchase_status);
			
				
				//입력 업데이트
				preparedStatement.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				// 닫아주기
				try {
					if (preparedStatement != null) preparedStatement.close();
					if (connection != null) connection.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				result = "RESULT_OK";
			}
			
			
			return result;
		}
}
