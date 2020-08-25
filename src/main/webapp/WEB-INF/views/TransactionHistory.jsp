<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Online Banking- Trasaction History</title>
        <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"rel="stylesheet">
        <style>
         header h1{
                 color:darkblue;
                 font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                 font-size:50px;
                 text-align: center;
                 }
          body h3{
            text-align: center;
            color:crimson;
            font-size:30px;
            font-weight: bold;

                 }
           #TransactionHistoryContainer{
            width:1000px;
            margin:30px auto;oo
            position:relative;
            padding:0.5%;
              }
           .field{
              width:200px;  
              font-weight:bold;
              font-size:15px;      
              }
        </style>
     </head>
     <body>
        <header>
           <h1>WELCOME TO ONLINE BANKING</h1>
        </header>
         <h3>TRANSACTION HISTORY</h3>
         
           <div id="TransactionHistoryContainer">
            <table class="table table-striped table-bordered table-hover" border="1">
            <thead>
               <tr>
                 <td class="field">Payee Name</td>
                 <td class="field">Account Number</td>
                 <td class="field">Bank Details</td>
                 <td class="field">IFSC Code</td>
                 <td class="field">Debit</td>
                 <td class="field">Balance</td>
                 <td class="field">Transaction Date</td>
               </tr>
            </thead>
            <tbody>
                <c:forEach items="${AccountNumberofPayee}" var="payeeaccnumber" varStatus="loop">
                 <tr>
                    	<td>${NameofthePayee[loop.index]}</td>
                    	<td>${payeeaccnumber}</td>
                    	<td>${BankDetailsofPayee[loop.index]}</td>
                    	<td>${IFSCCODEofPayee[loop.index]}</td>
                        <td>${DebitAmount[loop.index]}</td>
                        <td>${CurrentBalance[loop.index]}</td>
                        <td>${DateofTransaction[loop.index]}</td>
                 </tr>
                </c:forEach>
            </tbody> 
            </table>
           </div>
     </body>
 </html>