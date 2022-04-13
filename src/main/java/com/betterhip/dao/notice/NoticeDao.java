package com.betterhip.dao.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.betterhip.dto.notice.NoticeDto;



public class NoticeDao {

	//datasource javax.sql 꺼로 불러와야 함. 아까 설정 여기로 했으니까. 아무거나 하지말고. 
	DataSource dataSource; 
	
	public NoticeDao() {
		// TODO Auto-generated constructor stub
		
		try {
			//servers - context에서 정보 가져와서 db 연결 해라. 오류 나면 알려주고. 
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	//전체 검색 메소드 
	
	public ArrayList<NoticeDto> list(){
		
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
		
		try {
			connection = dataSource.getConnection();
			String query = "select notice_id, notice_title, notice_content, notice_date, notice_user_id from notice";
			preparedStatement = connection.prepareStatement(query); 
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int notice_id = resultSet.getInt("notice_id");
				String notice_title = resultSet.getString("notice_title"); 
				String notice_content = resultSet.getString("notice_content"); 
				Timestamp notice_date = resultSet.getTimestamp("notice_date");
				String notice_user_id = resultSet.getString("notice_user_id");
				
				NoticeDto dto = new NoticeDto(notice_id, notice_title, notice_date, notice_content, notice_user_id);
				dtos.add(dto);
				System.out.println("dao");
			}
			
			
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
		
		
	}//list
	
	
	public void noticeForm(String notice_title, String notice_content) {
	
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
			
			
			try {
				connection = dataSource.getConnection();
				String query = "insert into betterhip (notice_title, notice_content, notice_date) values (?,?,now())";
				preparedStatement = connection.prepareStatement(query); 
				preparedStatement.setString(1, notice_title);
				preparedStatement.setString(2, notice_content);
				
				preparedStatement.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			//메모리 정리 해주는 게 좋기 때문에 finally 필요 
			}finally {
				try {
					//보통 연 순서의 역으로 닫음 
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		
	}//noticeForm 작성
	
	
	public NoticeDto noticeContent(String snotice_id) {
		NoticeDto dto = null;
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
		ResultSet resultSet = null; 
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from notice where notice_id = ?";
			preparedStatement = connection.prepareStatement(query); 
			preparedStatement.setInt(1, Integer.parseInt(snotice_id));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int notice_id = resultSet.getInt("notice_id");
				String notice_user_id = resultSet.getString("notice_user_id"); 
				String notice_title = resultSet.getString("notice_title"); 
				String notice_content = resultSet.getString("notice_content"); 
				Timestamp notice_date = resultSet.getTimestamp("notice_date");
				int notice_count = resultSet.getInt("notice_count");
				System.out.println(notice_id+notice_user_id+notice_title);
				
				dto = new NoticeDto(notice_id, notice_title, notice_date, notice_content, notice_count, notice_user_id);
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
		
		return dto;

	}//noticeContent

	
	public void update(int notice_id, String notice_title, String notice_content) {
		
		Connection connection = null; 
		PreparedStatement preparedStatement = null; 
	
		
		try {
			connection = dataSource.getConnection();
			String query = "update notice set notice_title = ?, notice_content = ? where notice_id = ?";
			preparedStatement = connection.prepareStatement(query); 
			preparedStatement.setString(1, notice_title);
			preparedStatement.setString(2, notice_content);
			preparedStatement.setInt(3, notice_id);
			
			System.out.println("update dao!!!");
			preparedStatement.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		//메모리 정리 해주는 게 좋기 때문에 finally 필요 
		}finally {
			try {
				//보통 연 순서의 역으로 닫음 
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	 }//update
	
		
		public void delete(String notice_id) {
			
			Connection connection = null; 
			PreparedStatement preparedStatement = null; 
		
			
			try {
				connection = dataSource.getConnection();
				String query = "delete from notice where notice_id = ?";
				preparedStatement = connection.prepareStatement(query); 
				preparedStatement.setString(1, notice_id);
				
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				
			//메모리 정리 해주는 게 좋기 때문에 finally 필요 
			}finally {
				try {
					//보통 연 순서의 역으로 닫음 
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}//delete

	
}//
