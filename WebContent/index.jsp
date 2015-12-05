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
					 0: hasn't started
					 1: Conntected to server
					 2: Server has received our request
					 3: Server is processing
					 4: Request is finished and data is ready
					*/
					//alert(xmlhttp.responseText);
					 if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
						 
						 showPanel(anId,xmlhttp.responseText ) //= xmlhttp.responseText;						 
						 
					 }else{
						 showPanel(anId, "waiting for response" ) ;
						 //document.getElementById('sayhello').innerHTML = "waiting for response";
					 }
					 				
				}
				
				xmlhttp.open("POST", "HelloWorld.do", true);
				xmlhttp.send();
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
			
			<form id="myform" action="HelloWorld.do" >
 						 	First name:<input type="text" name="Push Me"><br>
  							Last name: <input id = "lastName" type="text" name="lname"><br>
  							E-mail: <input type="email" name="email" autocomplete="off"><br>
  						<input type="submit" onClick = "helloWorld('lastName'); return false;">
			</form>
	</body>

</html>
