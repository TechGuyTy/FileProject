<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/js/bootstrap-notify.min.js"></script>
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/css/bootstrap-notify.min.css" type='text/css' media='all' />
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/css/styles/alert-bangtidy.min.css" type='text/css' media='all' />
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/css/styles/alert-blackgloss.min.css" type='text/css' media='all' />


<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<link rel="stylesheet" href="mainer.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/notify.js"></script>
<!-- <script type="text/javascript" src="jquery-latest.js"></script> -->
<script type="text/javascript" src="jquery.tablesorter.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Need a Job?</title>
<script>
	function addBullet(addUrl, addTitle, addCompany) {
		var ul = document.getElementById("BMlist");
		var li = document.createElement("li");
		var newlink = document.createElement("a");
		var linktext = document.createTextNode(addTitle);
		newlink.appendChild(linktext);
		newlink.href = addUrl;
		li.appendChild(newlink);
		ul.appendChild(li);
		return true;

	}
	
	
	
	

		function notify(msg){
			$.notify(msg,"success");
		}
</script>
</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Trying to center these things up top! -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">needaJob</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="Bookmars"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Bookmarks <b class="caret"></b></a>
					<ul id="BMlist" class="dropdown-menu" role="menu"
						aria-labelledby="menu1">

						<c:forEach items="${bookmarkArray}" var="job">
							<li title="${job.company}"><a href="${job.url}"
								target="_blank">${job.jobTitle}</a></li>
						</c:forEach>

					</ul>
			</ul>
			<div class="col-sm-3 col-md-3 pull-right"></div>
		</div>
	</div>
	</nav>
	
<!-- 	<script type="text/javascript"> -->
<!-- 	</script> -->
	<div class="container">
		<div class="row">
<div class='notifications bottom-right'></div>
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th><center>Job Title</center></th>
						<th><center>
								Company<span><img class="upDown" src="images/upDown.png"></img></span>
							</center></th>
						<th><center>
								Location<span><img class="upDown" src="images/upDown.png"></img></span>
							</center></th>
						<th><center>Search Engine</center></th>
						<th><center>Bookmark</center></th>

					</tr>
				</thead>
				<tbody>
					<!-- 				 if(){ -->
					<!-- 					out.println("<tr><td>Sorry</td><td>No</td><td>Results</td><td>For</td><td>Query</td></tr>"); -->
					<!-- 					out.println("<tr><td>Click</td><td><a href=\"verifyPassword.html\">HERE</a></td><td>And</td><td>Try</td><td>Again</td></tr>"); -->

					<!-- 				} -->






					<c:forEach items="${array}" var="job">
						<tr>
							<td id="white"><a href="${job.url}" target="_blank"><c:out
										value="${job.jobTitle}" /></a></td>
							<td><c:out value="${job.company}" /></td>
							<td><c:out value="${job.location}" /></td>
							<td><c:out value="${job.engine}" /></td>
							<td><span onclick="notify('Bookmark Successfully Added')"><a class="btn btn-warning"
								href='bookmarkJob.html?url=${job.url}&title=${job.jobTitle}'
								target="resultframe"
								onclick="return addBullet('${job.url}', '${job.jobTitle}', '${job.company}') ">Bookmark
									Job</a></span></td>

						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<iframe name="resultframe" width="1" height="1"></iframe>


	<script type="text/javascript">
		$(document).ready(function() {
			$("#myTable").tablesorter();
		});
	</script>


</body>
</html>