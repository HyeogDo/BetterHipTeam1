package com.betterhip.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.command.cart.CartDeleteCommand;
import com.betterhip.command.cart.CartListCommand;
import com.betterhip.command.cart.CartOrderCommand;
import com.betterhip.command.login.FindIdCommand;
import com.betterhip.command.login.FindPwCommand;
import com.betterhip.command.login.LoginCommand;
import com.betterhip.command.main.CakeAdCommand;
import com.betterhip.command.mypage.PurchaseCancelCommand;
import com.betterhip.command.mypage.PurchaseListCommand;
import com.betterhip.command.mypage.PurchaseQueryListCommand;
import com.betterhip.command.mypage.RefundListCommand;
import com.betterhip.command.mypage.RefundQueryListCommand;
import com.betterhip.command.mypage.UserInfoDeleteCommand;
import com.betterhip.command.mypage.UserInfoModifyCommand;
import com.betterhip.command.mypage.UserInfoViewCommand;
import com.betterhip.command.notice.NoticeContentCommand;
import com.betterhip.command.notice.NoticeFormCommand;
import com.betterhip.command.notice.NoticeListCommand;
import com.betterhip.command.order.CakeChoiceCommand;
import com.betterhip.command.order.CakeListViewCommand;
import com.betterhip.command.order.CakeOrderCartCommand;
import com.betterhip.command.order.CakeOrderPaymentCommand;
import com.betterhip.command.order.CakeReviewCommand;
import com.betterhip.command.order.CakeReviewWriteCommand;
import com.betterhip.command.payment.PaymentCommand;
import com.betterhip.command.payment.PaymentFailureCommand;
import com.betterhip.command.payment.PaymentListCommand;
import com.betterhip.command.payment.PaymentListPopupCommand;
import com.betterhip.command.payment.PaymentSuccessCommand;
import com.betterhip.command.signup.SignUpCheckIdCommand;
import com.betterhip.command.signup.SignUpCheckPhoneCommand;
//import com.betterhip.command.signup.SignUpCheckIdCommand;
//import com.betterhip.command.signup.SignUpCheckPhoneCommand;
//import com.betterhip.command.signup.SignUpCommand;
import com.betterhip.command.signup.SignUpCommand;


/**
 * Servlet implementation class BetterhipHomeController
 */
@WebServlet("*.do")
public class BetterhipHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BetterhipHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String viewPage = null;
		BetterhipCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();		
		String com = uri.substring(conPath.length());
		System.out.println("actionDo");
		System.out.println("com : " + com);
		
		
		switch(com) {
		
		//테스트용 
		case("/test.do") :
			viewPage = "mypage/Test1.jsp";
			break; 
			
		case("/main.do") :
			command = new CakeAdCommand();
			command.excute(request, response);
			viewPage = "main/main.jsp";
			break;
			
		case("/guideCake.do") :
			viewPage = "guide/guideCake.jsp";
			break;
			
		case("/guidePickup.do") :
			viewPage = "guide/guidePickup.jsp";
			break;           
			
		case("/guideUse.do") :
			viewPage = "guide/guideUse.jsp";
			break;
			
		case("/write_view.do"): 	
			viewPage = "write_view.jsp";
			break;
		
			// 공지사항
		case("/main/noticeList.do"):
			command = new NoticeListCommand();
			command.excute(request, response);
			viewPage = "../notice/noticeList.jsp";
			break;
			
		case("/noticeForm.do"):
			command = new NoticeFormCommand();
			command.excute(request,response);
			viewPage = "/notice/noticeForm.jsp";
			break;
		
		case("/noticeContent.do"):
			command = new NoticeContentCommand();
			command.excute(request, response);
			viewPage = "../notice/noticeContent.jsp"; 
			break; 
		
		case("/noticeUpdate.do"): 
			command = new NoticeContentCommand();
			command.excute(request, response);
			viewPage = "noticeList.do";
			break; 
			
		case("/noticeDelete.do") :
			command = new PurchaseListCommand();
			command.excute(request, response);
			viewPage = "noticeList.do";
			break;
			
			
		// 	
		case("/purchaseList.do") :
			command = new PurchaseListCommand();
			command.excute(request, response);
			viewPage = "purcrchaseList.do";
			break;			
			

		case("/purchaseQueryList.do") :
			command = new PurchaseQueryListCommand();
			command.excute(request, response);
			viewPage = "mypage/purchaseList.jsp";
			break;
			
		case("/purchaseCancel.do") :
			command = new PurchaseCancelCommand();
			command.excute(request, response);
			viewPage = "mypage/purchaseCancelResult.jsp";
			break;
			
		case("/refundList.do") :
			command = new RefundListCommand();
			command.excute(request, response);
			viewPage = "mypage/refundList.jsp";
			break;
			
		case("/refundQueryList.do") :
			command = new RefundQueryListCommand();
			command.excute(request, response);
			viewPage = "mypage/refundList.jsp";
			break;
		
		case("/userInfoModifyView.do") :
			command = new UserInfoViewCommand();
			command.excute(request, response);
			viewPage = "mypage/userInfoModifyView.jsp";
			break;
			
		case("/userInfoModify.do") :
			command = new UserInfoModifyCommand();
			command.excute(request, response);
			viewPage = "userInfoModifyView.do";
			break;
			
		case("/userInfoDeleteView.do") :
			command = new UserInfoViewCommand();
			command.excute(request, response);
			viewPage = "mypage/userInfoDeleteView.jsp";
			break;
					
		case("/userInfoDelete.do") :
			command = new UserInfoDeleteCommand();
			command.excute(request, response);
			viewPage = "mypage/goodbye.jsp";
			break;
			
		case("/cakeListView.do") :
			command = new CakeListViewCommand();
			command.excute(request, response);
			viewPage = "/order/cakeList.jsp";
			break;
			
			
		case("/cakeChoice.do") :
			session.setAttribute("CAKE_ID", request.getParameter("cake_id"));
			session.setAttribute("USER_ID", "hong");
			command = new CakeChoiceCommand();
			command.excute(request, response);
			viewPage = "/order/cakeInfo.jsp";
			break;
			
		case("/cakeOrderCart.do") :
			command = new CakeOrderCartCommand();
			command.excute(request, response);
			viewPage = "cartList.do";
			break;
			
		case("/cakeOrderPayment.do") :
			command = new CakeOrderPaymentCommand();
			command.excute(request, response);
			viewPage = "paymentList.do";
			break;
			
		case("/cakeReview.do") :
			command = new CakeReviewCommand();
			command.excute(request, response);
			viewPage = "order/cakeReviewWrite.jsp";
			break;
			
		case("/cakeReviewWrite.do") :
			command = new CakeReviewWriteCommand();
			command.excute(request, response);
			viewPage = "order/cakeReviewResult.jsp";
			break;
			
		case("/cartList.do") :
			command = new CartListCommand();
			command.excute(request, response);
			viewPage = "cart/cartList.jsp";
			break;
			
		case("/cartDelete.do") :
			command = new CartDeleteCommand();
			command.excute(request, response);
			viewPage = "cartList.do";
			break;
			
		case("/cartOrder.do") :
			command = new CartOrderCommand();
			command.excute(request, response);
			viewPage = "paymentList.do";
			break;
			
		case("/paymentList.do") :
			command = new PaymentListCommand();
			command.excute(request, response);
			viewPage = "payment/paymentList.jsp";
			break;
			
		case("/paymentListPopup.do") :
			command = new PaymentListPopupCommand();
			command.excute(request, response);
			viewPage = "payment/paymentListPopup.jsp";
			break;
			
		case("/payment.do") :
			command = new PaymentCommand();
			command.excute(request, response);
			viewPage = "payment/payment.jsp";
			break;
			
		case("/paySuccess.do") :
			command = new PaymentSuccessCommand();
			command.excute(request, response);
			viewPage = "payment/paySuccess.jsp";
			break;
			
		case("/payFailure.do") :
			command = new PaymentFailureCommand();
			command.excute(request, response);
			viewPage = "payment/payFailure.jsp";
			break;
		
		case("/signupForm.do") :
			viewPage = "signup/signupForm.jsp";
			break;
		
		case("/signup/signup.do") :
			command = new SignUpCommand();
			command.excute(request, response);
			viewPage = "signupResult.jsp";
			break;
		
		case("/signup/signupCheckId.do") :
			command = new SignUpCheckIdCommand();
			command.excute(request, response);
			viewPage = "signupCheckIdResult.jsp";
			break;

		case("/signup/signupCheckPhone.do") :
			command = new SignUpCheckPhoneCommand();
			command.excute(request, response);
			viewPage = "signupCheckPhoneResult.jsp";
			break;
		
		case("/loginForm.do") :
			viewPage = "login/login.jsp";
			break;
		
		case("/login.do") :
			command = new LoginCommand();
			command.excute(request, response);
			viewPage = request.getAttribute("viewPage").toString();
			break;
		
		case("/findIdPage.do") :
			viewPage = "login/findId.jsp";
			break;
			
		case("/findId.do") :
			command = new FindIdCommand();
			command.excute(request, response);
			viewPage = "login/printId.jsp";
			break;
			
		case("/gotoLogin.do") :
			viewPage = "loginForm.do";
			break;
			
		case("/findPwPage.do") :
			viewPage = "login/findPw.jsp";
			break;
			
		case("/findPw.do") :
			command = new FindPwCommand();
			command.excute(request, response);
			viewPage = "login/printPw.jsp";
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
				
	} // actionDo

} // BetterhipHomeController