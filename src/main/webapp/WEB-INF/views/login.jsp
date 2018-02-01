<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="dropdown-menu">
    <form:form class="px-4 py-3" method="post" modelAttribute="login">
        <div class="form-group">
            <label for="dropdownFormUsername">Username</label>
            <form:input type="text" class="form-control" id="dropdownFormUsername" placeholder="Username" path="username" />
        </div>
        <div class="form-group">
            <label for="exampleDropdownFormPassword1">Password</label>
            <form:input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password" path="password" />
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="dropdownCheck">
            <label class="form-check-label" for="dropdownCheck">
                Remember me
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Sign in</button>
    </form:form>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#">To create an account -> Sign up</a>
    <p>${error}</p>
</div>
</body>
</html>
