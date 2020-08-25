import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns="/homepage.org")
public class HomePage extends HttpServlet{
    
	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{  
		//DataBase Connection Objects
		Connection mycon=null;
		PreparedStatement prstmnt=null;
		Statement stmnt=null;
		ResultSet rs=null;
		
		//DataBase Credentials
		String url="jdbc:mysql://localhost:3306/online_banking";
		String dbUserName="student";
		String dbPassword="student";
		
		//Account details and Program Variables
		String accountNumber="0000104502456345689";
		String dbaccountNumber,accountHolderName,bankingType,currency;
		double availableBalance;
		
		//Lists for Storing the Transaction Details
		List<String> PayeeName=new ArrayList();
		List<String> PayeeAccNumber=new ArrayList();
		List<String> PayeeBankDetails=new ArrayList();
		List<String> PayeeIFSCCode=new ArrayList();
		List<Double> TransferAmount=new ArrayList();
		List<Double> AvailableBalance=new ArrayList();
		List<String> TransactionDate=new ArrayList();
		
		try { 
			//Getting Connection to DB
			mycon=DriverManager.getConnection(url,dbUserName,dbPassword);
			
			//The Below Code is for User Account Details
			
			//Executing Query
			prstmnt=mycon.prepareStatement("select * from UserandAccountDetails where accountNumber=?");
			prstmnt.setString(1,accountNumber);
			rs=prstmnt.executeQuery();
			
			//Output From DB
			while(rs.next())
			{
				dbaccountNumber=rs.getString("accountNumber");
				accountHolderName=rs.getString("accountHolderName");
				bankingType=rs.getString("bankingType");
				availableBalance=rs.getDouble("availableBalance");
				currency=rs.getString("currency");
				
				//Account Details of the User Setting Attributes to HomePage.jsp UI PAGE
				request.setAttribute("accountnumber",dbaccountNumber);
				request.setAttribute("description",bankingType);
				request.setAttribute("accountholder",accountHolderName);
				request.setAttribute("availablebalance",availableBalance);
				request.setAttribute("currencytype",currency);
			 }
			//The Below Code is for Transaction History
			
			//Executing Query Such that we get only the latest 5 Transactions
			stmnt=mycon.createStatement();
			rs=stmnt.executeQuery("select * from transactiondetails order by payeeId desc limit 5");
			
			//Output from DB
			while(rs.next())
			{
			  PayeeName.add(rs.getString("payeeName"));
			  PayeeAccNumber.add(rs.getString("payeeACCNumber"));
			  PayeeBankDetails.add(rs.getString("bankdetials"));
			  PayeeIFSCCode.add(rs.getString("IFSCcode"));
			  TransferAmount.add(rs.getDouble("debitAmount"));
			  AvailableBalance.add(rs.getDouble("availableBalance"));
			  TransactionDate.add(rs.getString("transactiondate"));
			 }
			//Latest 5 Transaction Details.Setting Attribute to TransferFund.jsp Page
			request.setAttribute("NameofthePayee",PayeeName);
			request.setAttribute("AccountNumberofPayee",PayeeAccNumber);
			request.setAttribute("BankDetailsofPayee",PayeeBankDetails);
			request.setAttribute("IFSCCODEofPayee",PayeeIFSCCode);
			request.setAttribute("DebitAmount",TransferAmount);
			request.setAttribute("CurrentBalance",AvailableBalance);
			request.setAttribute("DateofTransaction",TransactionDate);

	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		request.getRequestDispatcher("/WEB-INF/views/HomePage.jsp").forward(request,response);
		}
}
