<!DOCTYPE html>
<html>
<head>
	<title>Verð</title>
	<style>
		body{background:silver;width: 1000px;margin: 0 auto;}
		.box{border:0.75px dotted;border-radius: 5px;background-color: gray;padding:5px;}
		a{color:black;}
		h1{text-align: center;}
	</style>
</head>
<body>
	<h1>Nánari upplýsingar</h1>
	<%
		for i in data['results']:
			if i['key'] == k:
	%>
				<h3>Söluaðili: {{i['company']}}</h3>
				<h3>Staður: {{i['name']}}</h3>
				<h3>Bensín 95: {{i['bensin95']}}</h3>
				<h3>Dísel: {{i['diesel']}}</h3>
	<%
			end
		end
	%>
	<br>
	<center><a href="/">Heim</a></center>
	<br>
</body>
</html>