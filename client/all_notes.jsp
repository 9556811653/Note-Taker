<%@page import="com.entity.pack1.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>
		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> l = q.list();
				for (Note note : l) {
				%>
				<!--  it will repeat(create a card)-->
				<div class="card mt-3">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%>

						</p>
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
					</div>
				</div>
				<%
				}

				s.close();
				%>

			</div>
		</div>

	</div>
</body>
</html>