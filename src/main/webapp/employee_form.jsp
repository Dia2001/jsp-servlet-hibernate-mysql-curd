<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.employeemanage.model.Department"%>
<%@ page import="com.employeemanage.dao.DepartmentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
</head>
<body>
	<center>
		<h1>Employee Management</h1>
		<h2>
			<a href="new">Add New Emloyee</a> &nbsp;&nbsp;&nbsp; <a href="list">List
				All Employees</a>

		</h2>
	</center>
	<div align="center">
		<c:if test="${employee != null}">
			<form action="update" method="post">
		</c:if>
		<c:if test="${employee == null}">
			<form action="insert" method="post">
		</c:if>
		<table border="1" cellpadding="5">
			<caption>
				<h2>
					<c:if test="${employee != null}">
               Edit Employee
              </c:if>
					<c:if test="${employee == null}">
               Add New Employee
              </c:if>
				</h2>
			</caption>
			<c:if test="${employee != null}">
				<input type="hidden" name="id"
					value="<c:out value='${employee.id}' />" />
			</c:if>
			<tr>
				<th>Employee Name:</th>
				<td><input type="text" name="name" size="45"
					value="<c:out value='${employee.name}' />" /></td>
			</tr>
			<tr>
				<th>Employee Pasword:</th>
				<td><input type="text" name="password" size="45"
					value="<c:out value='${employee.password}' />" /></td>
			</tr>
			<tr>
				<th>Employee Email:</th>
				<td><input type="text" name="email" size="45"
					value="<c:out value='${employee.email}' />" /></td>
			</tr>
			<tr>
				<th>Country:</th>
				<td><input type="text" name="country" size="15"
					value="<c:out value='${employee.country}' />" /></td>
			</tr>
			<tr>
				<th>Department:</th>
				<td><select name="department" style="width: 150px">
						<c:forEach var="dep" items="${departments}">
							<option
								<c:if test="${dep.departmentid==employee.department.departmentid}"><c:out value="${'selected'}"/></c:if>
								value="<c:out value="${dep.departmentid}"/>"><c:out
									value="${dep.name}" /></option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Save" /></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>