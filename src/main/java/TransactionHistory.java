import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns="/transactionhistory.org")
public class TransactionHistory extends HttpServlet{
   
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		Connection mycon=null;
		Statement stmnt=null;
		ResultSet rs=null;
		
		String url="jdbc:mysql://localhost:3306/online_banking";
		String dbUserName="student";
		String dbPassword="student";
		
		List<String> PayeeName=new ArrayList();
		List<String> PayeeAccNumber=new ArrayList();
		List<String> PayeeBankDetails=new ArrayList();
		List<String> PayeeIFSCCode=new ArrayList();
		List<Double> TransferAmount=new ArrayList();
		List<Double> AvailableBalance=new ArrayList();
		List<String> TransactionDate=new ArrayList();
		
		try {
			mycon=DriverManager.getConnection(url,dbUserName,dbPassword);
			stmnt=mycon.createStatement();
			rs=stmnt.executeQuery("select * from transactiondetails");
		     
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
		request.getRequestDispatcher("/WEB-INF/views/TransactionHistory.jsp").forward(request,response);
	}
}
