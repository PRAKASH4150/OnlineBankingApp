<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Online Banking-Fund Transfer</title>
        <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"rel="stylesheet">
        <style>
         header h1{
                 color:darkblue;
                 font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                 font-size:50px;
                 text-align: center;
                 }
        section h3{
            text-align: center;
            color:crimson;
            font-size:30px;
            font-weight: bold;

        }
        #FundTransferContainer{
            border:2px solid #f1f1f1;
            border-radius:5px;
            width:500px;
            margin:30px auto;
            position:relative;
            padding:0.5%;
        }
        #FundTransferContainer p{
            font-size:20px;
            color:mediumpurple;
            font-weight:bold;

        }
          #FundTransferContainer #message{
            font-size:15px;
            color:red;

        }
        #FundTransferContainer input{
        width:100%;
        }
        #FundTransferContainer #submit{
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
        
        <section>
            <h3>QUICK FUND TRANSFER</h3>
            <div id="FundTransferContainer">
                <p>Payment Details</p>
                <p id="message">${accountmessage}</p>
                <form action="/transferfund.org"method="post">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td class="field">Payee Name</td>
                            <td class="value">
                                <input type="text" name="payeename" placeholder="Enter the Payee Name"required value="${payeename}">
                            </td>
                        </tr>

                        <tr>
                            <td class="field">Account Number</td>
                            <td class="value">
                                <input type="text" name="accnumber" placeholder="Enter the account number" required value="${accnumber}">
                            </td>
                        </tr>

                        <tr>
                            <td class="field">Bank & Branch</td>
                            <td class="value">
                                <input type="text" name="bankdetails" placeholder="Enter the Payee Bank Details" required value="${bankdetails}">
                            </td>
                        </tr>

                        <tr>
                            <td class="field">IFSC CODE</td>
                            <td class="value">
                                <input type="text" name="ifsc" placeholder="Enter the IFSC Code" required value="${ifsc}">
                            </td>
                        </tr>

                        <tr>
                            <td class="field">Amount</td>
                            <td class="value">
                                <input type="text" name="amount"placeholder="Enter the Transfer amount" required value="${amount}">
                            </td>
                        </tr>
                    </table>
                    
                    <input id="submit" type="submit" class="btn btn-success" value="Transfer Fund">
                </form>
            </div>
        
        </section>
    </body>
  </html>