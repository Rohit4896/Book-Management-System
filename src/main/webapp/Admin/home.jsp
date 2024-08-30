<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<link rel="icon" href="icon.jpeg" type="img/icon.jpeg">
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
    background-color:#00308F;
    color: white;
    padding: 10px 0;
}


</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <br/>

    <div class="container-fluid">
        <div class="welcome-marquee">
            <marquee behavior="scroll" direction="left">Welcome to Smart Book Hub</marquee>
        </div>
        <img src="ebook.jpg" alt="photo">
        <div class="row">
            <!-- Additional content can go here -->
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
