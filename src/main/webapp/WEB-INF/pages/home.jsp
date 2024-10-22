<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${page}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body style= "background-color:#ECDFCC">
	<div class="container mt-2">
		<h1 class="text-center">Welcome to Todo Manager</h1>

		<c:if test="${not empty msg}">
			<div class="alert alert-success">
				<b><c:out value="${msg} "></c:out></b>
			</div>
		</c:if>

		<div class="row mt-4">
			<div class="col-md-2">

				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active"
						aria-current="true"> Menu</a> <a
						href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add Todo </a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View Todo </a>
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page=='home' }">
					<h1 class="text-center">All Todos</h1>
					<c:forEach items="${todos }" var="t">
						<div class="card"></div>
						<div class="card-body">
							<h3><c:out value="${t.todoTitle}"></c:out></h3>
							<p><c:out value="${t.todoContent}"></c:out></p>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${page == 'add' }">
					<h1 class="text-center">Add Todo</h1>
					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter your todo title" />
						</div>

						<div class="form-group mt-2">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter your content for todo"
								cssstyle="height:300px;" />
						</div>

						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>
					</form:form>
				</c:if>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>