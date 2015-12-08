<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
			<title>Hello World</title>
			<script language="javascript" type="text/javascript">
				
				xmlhttp = new XMLHttpRequest();
				
				function helloWorld(anId){
					//alert('Hello World was pushed!');
					xmlhttp.onreadystatechange = 
					function(){
					
					/**
					Holds the status of the XMLHttpRequest. Changes from 0 to 4: 
						0: request not initialized 
						1: server connection established
						2: request received 
						3: processing request 
						4: request finished and response is ready
					*/
					//alert(xmlhttp.responseText);
					 if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
						 showPanel(anId, xmlhttp.responseText ) //= xmlhttp.responseText;	
						// document.getElementById("fName").value = "Yahoo";						 
					 }else{
						 showPanel(anId, "waiting for response" ) ;
						 //document.getElementById('sayhello').innerHTML = "waiting for response";
					 }					 				
				}
				
				//xmlhttp.open("Get", "HelloWorld.do?fName="+document.getElementById("fName").value, true);
				xmlhttp.open("POST", "HelloWorld.do", true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xmlhttp.send("fName=Henry&lname=Ford");
				//xmlhttp.send();
				}/**---------END HELLO WORLD FUNCTION--------------------**/
				
				//*****NEW FUNCTION HERE****************************//
				function showPanel(fieldName, value) {
					//alert(fieldName);
					 var fieldNameElement = document.getElementById(fieldName);
					  while(fieldNameElement.childNodes.length >= 1) {
					    fieldNameElement.removeChild(fieldNameElement.firstChild);
					  }
					  fieldNameElement.appendChild(fieldNameElement.ownerDocument.createTextNode(value));
				}
			    /**-------------END showPanel FUNCTION --------------------------**/
			    //**-------BEGIN---------**//
				function myCheck(){
					
					//var txtField = document.getElementById("txtFirstName");
					var sex = document.getElementById("sex");
					var firstName = document.getElementById("txtFirstName");
					var postString= 'sexy=' + getRadioValue("sexy") + '&firstName='+firstName.value;
					//alert(getRadioValue("sexy"));
					
					xmlhttp.onreadystatechange = 
					function(){
						
					//alert(xmlhttp.responseText);
					 //if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
					 if (xmlhttp.readyState == 4 && xmlhttp.status == 200){	 
						 //showPanel--places data from server into firstParameter 'id' field
						 showPanel("sayhello", xmlhttp.responseText ) //= xmlhttp.responseText;	
						 document.getElementById('rName').value = xmlhttp.responseText;
						 						 
					 }else{
						 showPanel(anId, "waiting for response" ) ;
						 //document.getElementById('sayhello').innerHTML = "waiting for response";
					 }
					 			
				}
				
				//xmlhttp.open("Get", "HelloWorld.do?fName="+document.getElementById("fName").value, true);
				xmlhttp.open("POST", "HelloWorld.do", true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				alert("postString = -->" + postString);
				xmlhttp.send(postString);
				return false;	
				
				}					
			
		/*  Parameter: takes in 'id' of a radio group
			returns the value of a selected radio button
		*/
				function getRadioValue(theRadioGroup)
				{
					
					var elements = document.getElementsByName(theRadioGroup);
				    for (var i = 0, l = elements.length; i < l; i++)
				    {
				        if (elements[i].checked)
				        {
				            return elements[i].value;
				        }
				    }
				}
			</script>
	</head>
	
	<body>
			Lets see if we can get this thing to work......
			<h3><%=request.getContextPath()%></h3>
			<div id="sayhello"></div>
			<br/>
			<input type="button" value="Push Me" onClick="return myCheck();" />
		
			<div id="other">Here I Am</div>
			<input name="somebutton" type="button" value="Push Me" onClick="helloWorld('other');" />
			
			
 			First name:<input id="fName" type="text" name="firstName" oninput="helloWorld('fName');"><br>
 			Re-name:<input id="rName" type="text" name="rName"><br>
  						
			<br/><br/>
			<form>
				<input type="text" id="txtFirstName" name="firstName" />
				<br/>
				<input type="radio" id="sex" name="sexy" value="male" /> Male
  				<br />
 				 <input type="radio" id="sex" name="sexy" value="female" /> Female
			    <br />
			    <input type="submit" name="submit" onclick="return myCheck();" />
			</form>
	</body>

</html>
