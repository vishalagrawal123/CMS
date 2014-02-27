<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

  <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />
<html>
<head><title>
  
	Sign In
</title>
    
   
</head>

<body>
   
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY2MTc3NjUzM2Rk" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" />
</div><input type="hidden" name="__db" value="15" />
    <div class="MainArea">
        <div class="Header">
            <span id="PageTitleLabel">Sign In</span>
        </div>
        
        <div class="GroupLargeMargin">
            <div class="TextSizeXLarge">
                <span id="STSLabel">Certification Management System</span>
            </div>
        </div>
        <div class="MainActionContainer">
            
    <div class="GroupXLargeMargin"><span>Type your user name and password.</span></div>
    <table class="UsernamePasswordTable">
        <tr>
            <td>
                <span class="Label"><span>User name: </span></span>
            </td>
            <td>
                <input name="ctl00$ContentPlaceHolder1$UsernameTextBox" type="text" id="ContentPlaceHolder1_UsernameTextBox" />            
            </td>
            <td class="TextColorSecondary TextSizeSmall">
                <span>Example: Domain\username</span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="Label"><span>Password: </span></span>
            </td>
            <td>
                <input name="ctl00$ContentPlaceHolder1$PasswordTextBox" type="password" id="ContentPlaceHolder1_PasswordTextBox" />            
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2" class="TextSizeSmall TextColorError">
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="RightAlign GroupXLargeMargin">
                    <input type="submit" name="ctl00$ContentPlaceHolder1$SubmitButton" value="Sign In" id="ContentPlaceHolder1_SubmitButton" class="Resizable" />
                </div>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

        </div>
    </div>
   
</body>
</html>

