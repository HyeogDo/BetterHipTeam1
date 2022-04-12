package com.betterhip.dao.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PurchaseCancelDao {

	
//-------------------field--------------------- 
	
		DataSource dataSource; 	
	
//-------------------constructor----------------
		
		public PurchaseCancelDao() {
			
			try {
				
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}	
		}
		
//------------------method---------------------  
		
		
		//회원 탈퇴 
		public void purchaseCancel(String purchase_id) {
			
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
			
			try {
				//탈퇴 시 user_leave date 현재 시각으로 업데이트 
				connection = dataSource.getConnection();
				String query = "update purchase set purchase_status = '1001' where purchase_id = ?";
				preparedStatement = connection.prepareStatement(query); 
				preparedStatement.setString(1, purchase_id);
				
				preparedStatement.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				try {
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
			
				}
			}		
		}	
	
}//purchaseCancel()
		