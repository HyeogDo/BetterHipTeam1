package com.betterhip.dao.mypage;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.betterhip.dto.mypage.PurchaseListDto;

public class RefundQueryListDao {

	
//-------------------field--------------------- 
	
	DataSource dataSource; 	
		
//-------------------constructor----------------
			
	public RefundQueryListDao() {
				
		try {
					
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
					
		}catch(Exception e) {
			e.printStackTrace();
					
		}	                
	}

//------------------method---------------------
	
	//주문 상태 '취소'인 주문 정보 가져오는 method 
	public ArrayList<PurchaseListDto> cancelList(String USER_ID, String queryStartDate, String queryEndDate){
		
		ArrayList<PurchaseListDto> dtos = new ArrayList<PurchaseListDto>();
		
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
		
		try {
			connection = dataSource.getConnection();
			
			//주문 정보 가져오는 쿼리문 
			String queryA = "select p.purchase_id, p.purchase_date, p.purchase_quantity, p.purchase_price, p.purchase_status, p.purchase_text, p.purchase_pickup_date,";
			String queryB = " c.cake_name, c.cake_img, cust.customize_taste, cust.customize_size, cust.customize_cream_type, cust.customize_cream_color";
			String queryC = " from purchase p, cake c, customize cust where p.purchase_user_id = ? and p.purchase_date between ? and ? and p.purchase_status = '1001' and";
			String queryD = " p.purchase_cake_id = c.cake_id and p.purchase_customize_id = cust.customize_id order by p.purchase_date";

			//주문 정보 가져오는 쿼리 실행 
			preparedStatement = connection.prepareStatement(queryA+queryB+queryC+queryD); 
			preparedStatement.setString(1, USER_ID);
			preparedStatement.setString(2, queryStartDate);
			preparedStatement.setString(3, queryEndDate);
			resultSet = preparedStatement.executeQuery();
			
			//주문 정보 resultSet 받기   
			while(resultSet.next()) {
				int purchase_id = resultSet.getInt("purchase_id");
				String purchase_date = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getTimestamp("purchase_date")); 
				String cake_name = resultSet.getString("cake_name"); 
				String purchase_text = resultSet.getString("purchase_text");
				int purchase_quantity = resultSet.getInt("purchase_quantity"); 
				int purchase_price = resultSet.getInt("purchase_price");
				String puchase_pickup_date = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getTimestamp("purchase_pickup_date"));
				String cake_option = resultSet.getString("customize_size") + "/" + resultSet.getString("customize_taste") + "/" 
				+ resultSet.getString("customize_cream_type") + "/" + resultSet.getString("customize_cream_color"); 
				Blob blob = resultSet.getBlob("cake_img");
				String purchase_status = resultSet.getString("purchase_status");
				
				//cake_img_blob -> cake_img_base64Image 변환 
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte [] buffer = new byte[4096];
				int bytesRead = -1; 
				
				while((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				
				byte [] imageBytes = outputStream.toByteArray();
				
				String cake_img_base64Image = Base64.getEncoder().encodeToString(imageBytes);
			
				inputStream.close();
				outputStream.close();
				
				PurchaseListDto dto = new PurchaseListDto(purchase_id, purchase_date, cake_name, cake_img_base64Image, cake_option, purchase_text, purchase_quantity, purchase_price, purchase_status, puchase_pickup_date);
				dtos.add(dto);
			}//while() 
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		//메모리 정리 해주는 게 좋기 때문에 finally 필요 
		}finally {
			try {
				//보통 연 순서의 역으로 닫음 
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
		
	}//cancelList()
	
	
	//주문 상태 '환불'인 주문 정보 가져오는 method 
		public ArrayList<PurchaseListDto> refundList(String USER_ID, String queryStartDate, String queryEndDate){
			
			ArrayList<PurchaseListDto> dtos = new ArrayList<PurchaseListDto>();
			
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
			ResultSet resultSet = null; 
			
			try {
				connection = dataSource.getConnection();
				
				//주문 정보 가져오는 쿼리문 
				String queryA = "select p.purchase_id, p.purchase_date, p.purchase_quantity, p.purchase_price, p.purchase_status, p.purchase_text, p.purchase_pickup_date,";
				String queryB = " c.cake_name, c.cake_img, cust.customize_taste, cust.customize_size, cust.customize_cream_type, cust.customize_cream_color";
				String queryC = " from purchase p, cake c, customize cust where p.purchase_user_id = ? and p.purchase_date between ? and ? and p.purchase_status = '1002' and";
				String queryD = " p.purchase_cake_id = c.cake_id and p.purchase_customize_id = cust.customize_id order by p.purchase_date";

				//주문 정보 가져오는 쿼리 실행 
				preparedStatement = connection.prepareStatement(queryA+queryB+queryC+queryD); 
				preparedStatement.setString(1, USER_ID);
				preparedStatement.setString(2, queryStartDate);
				preparedStatement.setString(3, queryEndDate);
				resultSet = preparedStatement.executeQuery();
				
				//주문 정보 resultSet 받기   
				while(resultSet.next()) {
					int purchase_id = resultSet.getInt("purchase_id");
					String purchase_date = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getTimestamp("purchase_date")); 
					String cake_name = resultSet.getString("cake_name"); 
					String purchase_text = resultSet.getString("purchase_text");
					int purchase_quantity = resultSet.getInt("purchase_quantity"); 
					int purchase_price = resultSet.getInt("purchase_price");
					String puchase_pickup_date = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getTimestamp("purchase_pickup_date"));
					String cake_option = resultSet.getString("customize_size") + "/" + resultSet.getString("customize_taste") + "/" 
					+ resultSet.getString("customize_cream_type") + "/" + resultSet.getString("customize_cream_color"); 
					Blob blob = resultSet.getBlob("cake_img");
					String purchase_status = resultSet.getString("purchase_status");
					
					//cake_img_blob -> cake_img_base64Image 변환 
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte [] buffer = new byte[4096];
					int bytesRead = -1; 
					
					while((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					
					byte [] imageBytes = outputStream.toByteArray();
					
					String cake_img_base64Image = Base64.getEncoder().encodeToString(imageBytes);
				
					inputStream.close();
					outputStream.close();
					
					PurchaseListDto dto = new PurchaseListDto(purchase_id, purchase_date, cake_name, cake_img_base64Image, cake_option, purchase_text, purchase_quantity, purchase_price, purchase_status, puchase_pickup_date);
					dtos.add(dto);
				}//while() 
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			//메모리 정리 해주는 게 좋기 때문에 finally 필요 
			}finally {
				try {
					//보통 연 순서의 역으로 닫음 
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			return dtos;
			
		}//refundList()
		
	
}//PurchaseListDao 
