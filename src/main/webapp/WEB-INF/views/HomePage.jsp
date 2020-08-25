<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Online Banking- Home</title>
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
     
        #AccountDetailsContainer input{
         font-weight:bold;
         font-size:15px;
        }
        #AccountDetailsContainer{
            border:2px solid #f1f1f1;
            border-radius:5px;
            width:1000px;
            margin:30px auto;
            position:relative;
            padding:0.5%;
                  }
        #AccountDetailsContainer #headding{
            font-size:20px;
            color:mediumpurple;
            font-weight:bold;
        }
        #TransactionHistoryContainer{
            border:2px solid #f1f1f1;
            border-radius:5px;
            width:1000px;
            margin:30px auto;
            position:relative;
            padding:0.5%;
        }
        #TransactionHistoryContainer #headding{
            font-size:20px;
            color:mediumpurple;
            font-weight:bold;
        }
        #TransactionHistoryContainer a input{
         font-weight:bold;
         font-size:15px;
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
         <h3>ACCOUNT SUMMARY & TRANSACTION HISTORY</h3>
       <section>
           <div id="AccountDetailsContainer">
             <p id="headding">Account Summary</p>
             <table class="table table-striped table-bordered table-hover" border="1">
                 <tr>
                     <td class="field">Account Number</td>
                     <td class="value">${accountnumber}</td>
                 </tr>
                  
                 <tr>
                     <td class="field">Description</td>
                     <td class="value">${description}</td>
                 </tr>

                 <tr>
                     <td class="field">Name</td>
                     <td class="value">${accountholder}</td>
                 </tr>
                 
                 <tr>
                     <td class="field">Available Balance</td>
                     <td class="value">${availablebalance}/-</td>
                 </tr>
                  
                 <tr>
                     <td class="field">Currency</td>
                     <td class="value">${currencytype}</td>
                 </tr>

             </table>
            
                <a href="/transferfund.org">
                      <input type="button" value="Transfer Funds" class="btn btn-primary" >
                </a>
           </div>
           
           <div id="TransactionHistoryContainer">
            <p id="headding">Last 5 Transactions</p>
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
            <a href="/transactionhistory.org">
              <input type="button" value="Click here to get all transactions" class="btn btn-primary">
            </a>
            
           </div>
        </section>

    </body>
    
</html>