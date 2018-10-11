<!DOCTYPE html>
<html>
<head>
	<title>Bensínstöðvar</title>
	<style>
		body{background:silver;width: 1000px;margin: 0 auto;}
		img{height:55px;width:55px;}
		.imgwrapper{display: grid;   grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr; justify-items:center;}
		.wrapper{
			display: grid;   grid-template-columns: 1fr;   grid-gap:5px;
   			-moz-display: grid;   -moz-grid-template-columns:  1fr;   -moz-grid-gap:5px;
   			-ms-display: grid;    -ms-grid-template-columns:  1fr;   -ms-grid-gap:5px;
   			-webkit-display: grid;   -webkit-grid-template-columns:  1fr;   -webkit-grid-gap:5px;
			
			}
		.box{display:grid;justify-content:center;border:0.75px dotted;border-radius: 5px;background-color: gray;padding:5px;}
		a{text-decoration: none;color:black;}
		h1{text-align: center;}
	</style>
</head>
<body>
	<h1>Söluaðilar eldsneytis á Íslandi</h1>
	<div class='imgwrapper'>
		<img src="/static/ao.png">
		<img src="/static/n1.png">
		<img src="/static/daelan.png">
		<img src="/static/skeljungur.png">
		<img src="/static/costco.png">
		<img src="/static/olis.png">
		<img src="/static/ob.png">
		<img src="/static/orkan.png">
		<img src="/static/orkanx.png">
	</div>
	<br>
	<div  class="wrapper">
		<% 
		keyminpriceP = ""
		keyminpriceD = ""
		minpriceP = 5000.0
		minpriceD = 5000.0

		l = len(data['results']) 
		 c = 0
		 for i in range(l-1):
		 	c = i
		 	if minpriceP > data['results'][i]['bensin95']: # Finnum ódýrasta bensínlíterinn og söluaðila
		 		minpriceP = data['results'][i]['bensin95']
		 		companyP = data['results'][i]['company']
		 	end
		 	if minpriceD > data['results'][i]['diesel']:   # Finnum ódýrasta díesellíterinn og söluaðila
		 		minpriceD = data['results'][i]['diesel']
		 		companyD = data['results'][i]['company']
		 	end


		 	if (data['results'][i]['company'] != data['results'][i+1]['company']):#Viljum bara fá hvert fyrirtæki einu sinni, drullumix...
		%> 		
		 		<div class='box'><a href="/company/{{data['results'][i]['company']}}"> {{data['results'][i]['company']}}</a></div>
		<%
		 	end
		 end
		 %>
		 		<div class='box'><a href="/company/{{data['results'][c+1]['company']}}"> {{data['results'][c+1]['company']}}</a></div>
	</div>
	<h4>Ódýrasta bensín: <b><i>{{minpriceP}} kr.</i></b> hjá {{companyP}}</h4>
	<h4>Ódýrasta díesel: <b><i>{{minpriceD}} kr.</i></b> hjá {{companyD}}</h4>
	<%	
		import datetime
		t = data['timestampPriceCheck']
		t = t [:19] #strippum af millisec
		d = datetime.datetime.strptime(t,'%Y-%m-%dT%H:%M:%S')
	%>
	<h5>Síðast uppfært: {{d.strftime('%d.%m %Y Kl.%H:%M')}}</h5>
</body>
</html>