package com.betterhip.dao.login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.betterhip.dto.login.LoginDto;



public class LoginDao {
	
	DataSource dataSource;
	
	public LoginDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/betterhip");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인시 아이디, 비밀번호 확인 메서드
	// 아이디, 비밀번호 확인하여 리턴값 전달
	// 탈퇴회원은 아이디만 확인하고 리턴
	//  2 : 인증성공
	//  1 : 아이디 틀림
	// -1 : 비밀번호 틀림
	// -2 : 탈퇴회원
	//  0 : DB 연결안됨
	// -3 : 카카오를 사용하여 가입하지 않았거나 이메일 동의를 하지않
	
	public LoginDto Login(String user_id, String user_pw, String loginMethod, HttpServletRequest request, HttpServletResponse response ) {
		
		int loginCheck = 0; 			// 아이디, 비밀번호 확인결과 리턴
		String dbPassword = "";     // 해당 아이디로 DB에서 받은 패스워드
		String dbLeaveDate = "";    // 해당 아이디로 DB에서 받은 탈퇴일
		String message = "";
		String viewPage = "";
		HttpSession session = request.getSession();
		LoginDto  dto = null;


		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;		
		
		
		// DB 접속하여 회원여부 확
		try {		
			// 카카오 로그인
			if(loginMethod.equals("kakao")) {
				
				// 이메일 동의하지 않은 카카오 로그인일 경우 
				if(user_id.equals("undefined")) {				
					loginCheck = -3;
					
				}else {					
				// 이메일 동의 카카오 로그인 	
					connection = dataSource.getConnection();		
					String query = "select count(user_id) from user where user_id = '" + user_id + "'";
					preparedStatement = connection.prepareStatement(query);
					resultSet = preparedStatement.executeQuery();
					
					
					loginCheck = resultSet.next() == true ? (resultSet.getInt(1) > 0 ? 2 : -3) : -3;
				}
					
			}else {
			// 일반 로그인						
				// 입력한 아이디로 비밀번호 조회	
				connection = dataSource.getConnection();
				String query = "select * from user where user_id = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, user_id);
				resultSet = preparedStatement.executeQuery();
				
				
				if(resultSet.next()) {
					dbPassword = resultSet.getString("user_pw"); // DB에서 받은 비밀번호
					dbLeaveDate = resultSet.getString("user_leavedate");
					
					loginCheck = dbLeaveDate == null ? (dbPassword.equals(user_pw) == true ? 2 : -1) : -2;
				} else {
					loginCheck = 1;
					
				}				
				
			}
		}catch (Exception e) {
			loginCheck = 0; // DB 연결실패
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();				
			}catch(Exception e) {
				e.printStackTrace();
			}
		} // Login - try
		
		
		// DB 확인결과 리턴정보 생성 
		switch(loginCheck) {
		case 2 :
			message = "success";
			viewPage = "main.do";
			break;
			
		case 1 :
			message = "아이디가 틀렸습니다";
			viewPage = "login/login.jsp";
			break;
		
		case 0 : 
			message = "데이터베이스 연결에 실패하였습니다";
			viewPage = "login/login.jsp";
			break;
			
		case -1 :
			message = "비밀번호가 틀렸습니다";
			viewPage = "login/login.jsp";
			break;
			
		case -2 :
			message = "탈퇴회원 입니다 재가입 해주세요";
			viewPage = "login/login.jsp";
			break;
			
		case -3 :
			message = "가입하지 않았거나 이메일 동의를 하지 않으셨습니다";
			viewPage = "login/login.jsp";
			break;
		}

	
		dto = new LoginDto(message, viewPage);		
		
		return dto;
		
	} // Login

} // LoginDao