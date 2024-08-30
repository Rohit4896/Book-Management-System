<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smart Book Hub</title>
 <link rel="icon" href="img/icon.jpeg" type="img/icon.jpeg">

<%@include file="components/cdn.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/lib2.jpeg");
	height: 70vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #F0E68C
}
</style>
<style>
.custom-carousel-img {
	height: 600px; /* Set your desired height here */
	object-fit: cover;
	/* Ensures the image covers the set height without stretching */
}

.animated-text {
	color: red;
	font-weight: bold;
	position: absolute;
	white-space: nowrap;
	font-size: 24px;
	animation: slide 10s linear infinite;
}

@
keyframes slide { 0% {
	left: -100%;
}
50
%
{
left
:
100%;
}
100
%
{
left
:
-100%;
}
}
</style>
</head>
<body style="background-color: #F0F8FF">
	<%@include file="components/navbar.jsp"%>


	<br>
	<div class="container-fluid">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/lib2.jpeg" alt="Image 1"
						class="d-block w-100 custom-carousel-img">
				</div>
				<div class="carousel-item">
					<img src="img/iib3.jpg" alt="Image 2" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="img/lib4.jpeg" alt="Image 3" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="img/lib5.jpg" alt="Image 4" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="img/lib6.jpg" alt="Image 5" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="img/lib7.jpg" alt="Image 6" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="img/lib8.jpg" alt="Image 7" class="d-block w-100">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<br />

	<!-- RECENT BOOKS Started From Here-->

	<div class="container-fluid" style="background-color:">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-2">
			<a href="" class="btn btn-danger">View All</a>
		</div>

	</div>

	<!-- RECENT BOOKS ENDS Here-->

	<hr>

	<!-- NEW BOOKS Started From Here-->

	<div class="container-fluid" style="background-color:">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add to Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-2">
			<a href="" class="btn btn-danger">View All</a>
		</div>

	</div>

	<!-- NEW BOOKS ENDS Here-->

	<hr>

	<!-- OLD BOOKS Started From Here-->

	<div class="container-fluid" style="background-color:">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xl-3 col-lg-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Java" src="books/java.jpg"
							style="width: 200px; height: 200px" class="img-thumblin">
						<p>Java Programming</p>
						<p>Rohit Nigade</p>
						<p>Categorie: New</p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add To Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-2">
			<a href="" class="btn btn-danger">View All</a>
		</div>

	</div>

	<!-- OLD BOOKS ENDS Here-->

	<%@include file="components/footer.jsp"%>
</body>
</html>