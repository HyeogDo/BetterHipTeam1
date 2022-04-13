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

import com.betterhip.dto.mypage.PurchaseImgListPopupDto;
import com.betterhip.dto.mypage.PurchaseListDto;

public class PurchaseImgListPopupDao {

	
//-------------------field--------------------- 
	
	DataSource dataSource; 	
		
//-------------------constructor----------------
			
	public PurchaseImgListPopupDao() {
				
		try {
					
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
					
		}catch(Exception e) {
			e.printStackTrace();
					
		}	                
	}

//------------------method---------------------
	
	//구매이미지 리스트 가져오는 method 
	
	public PurchaseImgListPopupDto purchaseImgList(int purchase_id){

		PurchaseImgListPopupDto dto = null;
		String purchase_img_fileName = null; 
		String purchase_img_base64Image = null; 
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
	 
		
		
		try {
			connection = dataSource.getConnection();
			
			//주문 조회 리스트에서 쓸 구매 이미 정보 가져오는 쿼리문 
			String queryA = "select purchase_img, purchase_img_fileName";
			String queryB = " from purchase where purchase_id = ? and purchase_status in('3', '101', '102', '103') order by purchase_date";

			//쿼리 실행 
			preparedStatement = connection.prepareStatement(queryA+queryB); 
			preparedStatement.setInt(1, purchase_id);
			resultSet = preparedStatement.executeQuery();
			
			//resultSet 받기   
			while(resultSet.next()) {

				purchase_img_fileName = resultSet.getString("purchase_img_fileName");
				
				//purchase_img 유무에 따라 결과 처리
				if(purchase_img_fileName == null) {
					//없을 경우 "NO IMAGE" 
					purchase_img_base64Image = "NO IMAGE"; 
				}else {
					//있을 경우 blob -> base64
					Blob blob = resultSet.getBlob("purchase_img");
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte [] buffer = new byte[4096];
					int bytesRead = -1; 
					
					while((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					
					byte [] imageBytes = outputStream.toByteArray();
					
					purchase_img_base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					inputStream.close();
					outputStream.close();
				}
				
				dto = new PurchaseImgListPopupDto(purchase_img_fileName, purchase_img_base64Image);
	
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
		
		return dto;
		
		
	}//purchaseImgList() 
	
}

