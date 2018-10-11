<!DOCTYPE html>
<html>
<head>
	<title>{{c}}</title>
	<style>
		body{background:silver;width: 1000px;margin: 0 auto;}
		.box{border:0.75px dotted;border-radius: 5px;background-color: gray;padding:5px;}
		a{color:black;}
		h1, h2, h3{text-align: center;}
		table {
		    font-family: arial, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}

		td, th {
		    border: 1px solid #dddddd;
		    text-align: left;
		    padding: 8px;
		    width: 50%;
		}

		tr:nth-child(even) {
		    background-color: #dddddd;
		}
	</style>
</head>
<body>
	<h1>Bensínstöðvar</h1>
	<br>
	
	<table>
  	<tr>
    	<th>Fyrirtæki</th>
    	<th>Staður</th>
  	</tr>
	<%
		cnt = 0
		for i in data['results']:
			if i['company'] == c:	# Finnum rétta stöð
			cnt += 1				# Teljum stöðvar og birtum neðst á síðu
	%>
	 		<tr>
			    <td><a href="/moreinfo/{{i['key']}}">{{i['company']}}</td>
			    <td>{{i['name']}}</td>
	  		</tr>		
	<%
			end
		end
	%>
 	</table>
 	<h3>Fjöldi stöðva: {{cnt}}</h3>
 	<center><a href="/">Heim</a></center>
 	<br>
</body>
</html>