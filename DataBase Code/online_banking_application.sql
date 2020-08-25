create database online_banking;
use online_banking;

create table UserandAccountDetails(accountNumber varchar(50) primary key,accountHolderName varchar(50),bankingType varchar(50),availableBalance double,currency varchar(10));
insert into UserandAccountDetails values("0000104502456345689","Paul Mcwhorter","SIMPLE SAVINGS BANK ACCOUNT",5000.0,"INR");
select * from UserandAccountDetails;

create table transactiondetails(payeeId int primary key,payeeName varchar(50),payeeAccNumber varchar(50),bankdetials varchar(120),IFSCcode varchar(50),debitAmount double,availableBalance double,transactiondate varchar(20));
select * from transactiondetails;


DELIMITER $$
DROP PROCEDURE IF EXISTS `get_account_balance`$$

CREATE DEFINER=`student`@`localhost` PROCEDURE `get_account_balance`(IN accnumber varchar(50), OUT currentbal double)
BEGIN

select availableBalance into currentbal from UserandAccountDetails where accountNumber=accnumber;

END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `upload_transaction_details`$$

CREATE DEFINER=`student`@`localhost` PROCEDURE `upload_transaction_details`(IN IDForPayee int,IN NameofthePayee varchar(50),IN AccNumberofPayee varchar(50),IN BankdetailsofPayee varchar(120),IN IFSCcodeofPayee varchar(50),IN debAmount double,IN currBal double,IN AccNumberofMainUser varchar(50),IN dateofTranasction varchar(20))
BEGIN
insert into transactiondetails values(IDForPayee,NameofthePayee,AccNumberofPayee,BankdetailsofPayee,IFSCcodeofPayee,debAmount,currBal,dateofTranasction);
update UserandAccountDetails set availableBalance = currBal where accountNumber=AccNumberofMainUser;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `get_number_of_transactions`$$

CREATE DEFINER=`student`@`localhost` PROCEDURE `get_number_of_transactions`(out NumberOfTransactions int)
BEGIN

select count(payeeAccNumber) into NumberOfTransactions from transactiondetails;

END$$
DELIMITER ;
