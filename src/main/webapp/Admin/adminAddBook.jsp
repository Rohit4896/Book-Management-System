<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Books</title>
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

	<br />

	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3">
				<div class="card">
					<div class="card-body">
					 <h4 class="text-center mt-1 text-primary">Add Book </h4>
                        <hr>
                        <form action="../AdminAddBook" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Book Name <span style="color:red">*</span></label>
                                <input type="text" class="form-control" placeholder="Enter Book Name" required="required" name="BookName">
                            </div>
                            <div class="form-group">
                                <label for="AuthorName">Author Name <span style="color:red">*</span></label>
                                <input type="text" class="form-control" placeholder="Enter Author Name" required="required" name="AuthorName" id="AuthorName">
                            </div>
                            <div class="form-group">
                                <label for="Price">Price <span style="color:red">*</span></label>
                                <input type="number" class="form-control" placeholder="Enter Price Of Book" required="required" name="price" id="Price">
                            </div>
                            <div class="form-group">
                                <label for="Category">Book Category</label>
                                <select class="form-control" required="required" name="Category">
                                    <option>---Select Book Category ---</option>
                                    <option value="New">New</option>
                                   
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Status">Book Status</label>
                                 <select class="form-control" name="Status">
                                    <option>---Select Book Status ---</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Photo">Upload Photo</label>
                                <input type="file" class="form-control-file" placeholder="Image"  name="Image" id="img">
                            </div>
                            <button type="submit" class="btn btn-primary " >Submit</button>
                        </form>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<br/>

 <%@include file="footer.jsp"%>
</body>
</html>