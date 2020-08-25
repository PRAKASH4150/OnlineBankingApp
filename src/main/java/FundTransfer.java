import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.*;

@WebServlet(urlPatterns="/transferfund.org")
public class FundTransfer extends HttpServlet {

	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	  {
		  request.getRequestDispatcher("/WEB-INF/views/FundTransfer.jsp").forward(request, response);
	  }
	  
	  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	  {
		  //DataBase Connection Objects
		  Connection mycon=null;
		  CallableStatement stmnt=null;
		  ResultSet rs=null;
		  
		  //DataBase Credentials
		  String url="jdbc:mysql://localhost:3306/online_banking";
		  String dbUserName="student";
		  String dbPassword="student";
		  
		  //Account details and Program Variables
		  String accountNumberofuser="0000104502456345689";
		  String payeeName,payeeAccountNumber,bankDetails,ifscCode,transferAmount;
		  double currentBalance,transferMoney;
		  int numberOfTransactions;
		  
		  //Getting information from the user about the payee for fund transfer
		  payeeName=request.getParameter("payeename");
		  payeeAccountNumber=request.getParameter("accnumber");
		  bankDetails=request.getParameter("bankdetails");
		  ifscCode=request.getParameter("ifsc");
		  transferAmount=request.getParameter("amount");
		  transferMoney=Double.parseDouble(transferAmount);
		  
		  try {
			//Connecting to the DataBase
			mycon=DriverManager.getConnection(url,dbUserName,dbPassword);
			
			//Calling Stored procedure in MYSQLDB for knowing the current account balance of the main user
			stmnt=mycon.prepareCall("{call get_account_balance(?,?)}");
			stmnt.setString(1,accountNumberofuser);
			stmnt.registerOutParameter(2,Types.DOUBLE);
			stmnt.execute();
			currentBalance=stmnt.getDouble(2);
			
			//Checking whether funds are available for begining the transaction
			
			if((currentBalance==0) || (transferMoney > currentBalance))
			{  
				//Condition Satisfied hence showing a message to the user that "Funds are Insufficient"
				request.setAttribute("payeename",request.getParameter("payeename"));
				request.setAttribute("accnumber",request.getParameter("accnumber"));
				request.setAttribute("bankdetails",request.getParameter("bankdetails"));
				request.setAttribute("ifsc",request.getParameter("ifsc"));
				request.setAttribute("amount",request.getParameter("amount"));
				request.setAttribute("accountmessage","Funds Insufficient");
				request.getRequestDispatcher("/WEB-INF/views/FundTransfer.jsp").forward(request, response);
			}
			
			else 
			{    
				//Sufficient Funds available to transfer
				
				 //System Generated Payee ID
				 stmnt=mycon.prepareCall("{call get_number_of_transactions(?)}");
			     stmnt.registerOutParameter(1,Types.INTEGER);
			     stmnt.execute();
			     numberOfTransactions=stmnt.getInt(1);
			     numberOfTransactions+=1;
			     
			     //Deducing the money from the account anduploading it to transaction details
				 currentBalance=currentBalance-transferMoney;
				 LocalDate date=LocalDate.now();
				 String transactionDate=date.toString();
				 stmnt=mycon.prepareCall("{call upload_transaction_details(?,?,?,?,?,?,?,?,?)}");
				 stmnt.setInt(1,numberOfTransactions);
				 stmnt.setString(2,payeeName);
				 stmnt.setString(3,payeeAccountNumber);
				 stmnt.setString(4,bankDetails);
				 stmnt.setString(5,ifscCode);
				 stmnt.setDouble(6,transferMoney);
				 stmnt.setDouble(7,currentBalance);
				 stmnt.setString(8,accountNumberofuser);
				 stmnt.setString(9,transactionDate);
				 stmnt.execute();
				 
				 //Redirecting to Home Page
			     response.sendRedirect("/homepage.org");
			}
			
		      } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
	  }
}
