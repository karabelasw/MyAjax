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
						 document.getElementById("fName").value = "Yahoo";						 
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
				}
			//	
				function showPanel(fieldName, value) {
					//alert(fieldName);
					 var fieldNameElement = document.getElementById(fieldName);
					  while(fieldNameElement.childNodes.length >= 1) {
					    fieldNameElement.removeChild(fieldNameElement.firstChild);
					  }
					  fieldNameElement.appendChild(fieldNameElement.ownerDocument.createTextNode(value));
				}
			</script>
	</head>
	
	<body>
			Lets see if we can get this thing to work......
			<h3><%=request.getContextPath()%></h3>
			<div id="sayhello"></div>
			<br/>
			<input type="button" value="Push Me" onClick="helloWorld('sayhello')" />
		
			<div id="other">Here I Am</div>
			<input name="somebutton" type="button" value="Push Me" onClick="helloWorld('other')" />
			
			
 			First name:<input id="fName" type="text" name="firstName" oninput="helloWorld('fName')"><br>
 			Re-name:<input id="rName" type="text" name="rName"><br>
  						
			
	</body>

</html>
