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

public class PurchaseQueryListDao {

	
//-------------------field--------------------- 
	
	DataSource dataSource; 	
		
//-------------------constructor----------------
			
	public PurchaseQueryListDao() {
				
		try {
					
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
					
		}catch(Exception e) {
			e.printStackTrace();
					
		}	                
	}

//------------------method---------------------
	
	//주문 정보 가져오는 method 
	public ArrayList<PurchaseListDto> purchaseList(String USER_ID, String queryStartDate, String queryEndDate){
		
		ArrayList<PurchaseListDto> dtos = new ArrayList<PurchaseListDto>();
		
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
		
		try {
			connection = dataSource.getConnection();
			
			//주문 정보 가져오는 쿼리문 
			String queryA = "select p.purchase_id, p.purchase_date, p.purchase_quantity, p.purchase_price, p.purchase_status, p.purchase_text, p.purchase_pickup_date,";
			String queryB = " c.cake_name, c.cake_img, cust.customize_taste, cust.customize_size, cust.customize_cream_type, cust.customize_cream_color";
			String queryC = " from purchase p, cake c, customize cust where p.purchase_user_id = ? and p.purchase_date between ? and ? and p.purchase_status in('3', '101', '102', '103') and";
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
			
				//주문 상태 문구 지정하기 
				
				switch(purchase_status) {
				
				case("3") : 
					purchase_status = "주문접수";
					break; 
				case("101") :
					purchase_status = "상품준비중";
					break; 
				case("102") :
					purchase_status = "픽업중";
					break; 
				case("103") :
					purchase_status = "픽업완료";
					break; 
				}
				
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
		
	}//purchaseList()
	
	
	
	//주문 상태가 3('주문접수')인 개수 가져오는 method 
	public int purchase_status_count_3(String USER_ID, String queryStartDate, String queryEndDate) {
		
		int purchase_status_count_3 = 0;
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
		
		try {
			connection = dataSource.getConnection();
		
			String query = "select count(*) as purchase_status_count_3 from purchase where purchase_user_id = ? and purchase_date between ? and ? and purchase_status = '3'";
			
			//쿼리 실행 
			preparedStatement = connection.prepareStatement(query); 
			preparedStatement.setString(1, USER_ID);
			preparedStatement.setString(2, queryStartDate);
			preparedStatement.setString(3, queryEndDate);
			resultSet = preparedStatement.executeQuery();
		 
			if(resultSet.next()) {
				purchase_status_count_3 = resultSet.getInt("purchase_status_count_3"); 
			}
			
	
		} catch (Exception e) {
			e.printStackTrace();
			
			
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return purchase_status_count_3;
		
	}//purchase_status_count_3()
	
	
	//주문 상태가 101('상품준비중')인 개수 가져오는 method 
	public int purchase_status_count_101(String USER_ID, String queryStartDate, String queryEndDate) {
			
			int purchase_status_count_101 = 0;
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
			ResultSet resultSet = null; 
			
			try {
				connection = dataSource.getConnection();
			
				String query = "select count(*) as purchase_status_count_101 from purchase where purchase_user_id = ? and purchase_date between ? and ? and purchase_status = '101'";
				
				//쿼리 실행 
				preparedStatement = connection.prepareStatement(query); 
				preparedStatement.setString(1, USER_ID);
				preparedStatement.setString(2, queryStartDate);
				preparedStatement.setString(3, queryEndDate);
				resultSet = preparedStatement.executeQuery();
			 
				if(resultSet.next()) {
					purchase_status_count_101 = resultSet.getInt("purchase_status_count_101"); 
				}
				
		
			} catch (Exception e) {
				e.printStackTrace();
				
				
			}finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			return purchase_status_count_101;
			
		}//purchase_status_count_3()
		
		
	//주문 상태가 103('픽업완료')인 개수 가져오는 method 
	public int purchase_status_count_103(String USER_ID, String queryStartDate, String queryEndDate) {
			
			int purchase_status_count_103 = 0;
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
			ResultSet resultSet = null; 
			
			try {
				connection = dataSource.getConnection();
			
				String query = "select count(*) as purchase_status_count_103 from purchase where purchase_user_id = ? and purchase_date between ? and ? and purchase_status = '103'";
				
				//쿼리 실행 
				preparedStatement = connection.prepareStatement(query); 
				preparedStatement.setString(1, USER_ID);
				preparedStatement.setString(2, queryStartDate);
				preparedStatement.setString(3, queryEndDate);
				resultSet = preparedStatement.executeQuery();
			 
				if(resultSet.next()) {
					purchase_status_count_103 = resultSet.getInt("purchase_status_count_103"); 
				}
				
		
			} catch (Exception e) {
				e.printStackTrace();
				
				
			}finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			return purchase_status_count_103;
			
		}//purchase_status_count_103()
		
	
}//PurchaseListDao 
