<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : ALL Orders</title>
<%@include file="cdn.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}

.container-fluid {
	position: relative;
	text-align: center;
	color: white;
}

.container-fluid img {
	width: 70%;
	height: auto;
	max-height: 400px; /* Restricting the height */
	display: block;
	margin: 0 auto; /* Centering the image */
}

.welcome-marquee {
	position: absolute;
	top: 0;
	width: 100%;
	background: rgba(0, 0, 0, 0.7);
	color: white;
	font-size: 24px;
	padding: 10px 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.welcome-marquee marquee {
	font-weight: bold;
}

h2 {
	text-align: center;
	color: #333;
	padding: 20px 0;
}

.navbar {
	background-color: #00308F;
	color: white;
	padding: 10px 0;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<br/>

	<div class="container">

		<table class="table table-striped ">
			<thead class="bg-warning">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>Otto</td>
					<td>Otto</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
					<td>Otto</td>
					<td>Otto</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					
				</tr>
			</tbody>
		</table>

	</div>

	<br />

	<%@include file="footer.jsp"%>
</body>
</html>