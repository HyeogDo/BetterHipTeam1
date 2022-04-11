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
import com.betterhip.dto.order.CakeReviewListDto;

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
	
	public ArrayList<CakeInfoDto> list(String user_id, int cake_id) {
		
		ArrayList<CakeInfoDto> dtos = new ArrayList<CakeInfoDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select c.cake_name, c.cake_saleprice, c.cake_status, c.cake_img,"
					+ " cust.customize_id, cust.customize_taste, cust.customize_size, cust.customize_cream_type, cust.customize_cream_color, cust.customize_saleprice"
					+ " from cake c, customize cust"
					+ " where c.cake_id = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, cake_id);
			
			preparedStatement.executeUpdate();
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String cake_name = resultSet.getString("c.cake_name");
				int cake_saleprice = resultSet.getInt("c.cake_saleprice");
				String cake_status = resultSet.getString("c.cake_status");
				Blob cake_img = resultSet.getBlob("c.cake_img");
				int customize_id = resultSet.getInt("cust.customize_id");
				String customize_taste = resultSet.getString("cust.customize_taste");
				String customize_size = resultSet.getString("cust.customize_size");
				String customize_cream_type = resultSet.getString("cust.customize_cream_type");
				String customize_cream_color = resultSet.getString("customize_cream_color");
				int customize_saleprice = resultSet.getInt("cust.customize_saleprice");
				
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
				
				CakeInfoDto cakeInfoDto = new CakeInfoDto(cake_name, cake_saleprice, cake_status, base64Image, customize_id, customize_taste, customize_size, customize_cream_type, customize_cream_color, customize_saleprice);
				dtos.add(cakeInfoDto);
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
	
public ArrayList<CakeReviewListDto> reviewList(String user_id, int cake_id) {
		
		ArrayList<CakeReviewListDto> dtos = new ArrayList<CakeReviewListDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = " select r.review_id, r.review_content, r.review_date, r.review_star, p.purchase_user_id  from review r, purchase p where (r.review_purchase_id = p.purchase_id) && (p.purchase_cake_id = ?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, cake_id);
			
			preparedStatement.executeUpdate();
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int review_id = resultSet.getInt("r.review_id");
				String review_content = resultSet.getString("r.review_content");
				String review_date = resultSet.getDate("r.review_date").toString();
				int review_star = resultSet.getInt("r.review_star");
				String purchase_user_id = resultSet.getString("p.purchase_user_id");
				
				CakeReviewListDto cakeReviewListDto = new CakeReviewListDto(review_id, review_content, review_date, review_star, purchase_user_id);
				dtos.add(cakeReviewListDto);
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
	
public ArrayList<String> reviewPermission(String user_id, int cake_id) {
	String result = "RESULT_OK";
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	ArrayList<String> resultArr = new ArrayList<String>();
	
	try {
		connection = dataSource.getConnection();
		String query = "select count(*), purchase_id from purchase where purchase_cake_id = ? && purchase_user_id = ?";
		preparedStatement = connection.prepareStatement(query);
		
		preparedStatement.setInt(1, cake_id);
		preparedStatement.setString(2, user_id);
		
		preparedStatement.executeUpdate();
		
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			String purchase_id = resultSet.getString("purchase_id");
			
			int count = resultSet.getInt("count(*)");
			if (count == 0) {
				result = "RESULT_NOT_OK";
			}
			resultArr.add(result);
			resultArr.add(purchase_id);
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
	return resultArr;
}

//데이터베이스에 입력하는 함수
public String reviewInput(int purchase_id, int cake_id, String review_content, int review_star) {
	String result = "WRITE_OK";
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	try {
		connection = dataSource.getConnection();
		
		//데이터베이스 입력문
		String query = "insert into review(review_content, review_date, review_star, review_purchase_id) values(?, now(), ?, ?)";
		preparedStatement = connection.prepareStatement(query);
		
		//입력문 안에 들어갈 변수 설정
		preparedStatement.setString(1, review_content);
		preparedStatement.setInt(2, review_star);
		preparedStatement.setInt(3, purchase_id);
		
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
	}
	return result;
}
	
}
