<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/WEB-INF/css/style.css">
</head>
<body>
<div class="container">
    <form:form class="form-horizontal" action='' method="POST" modelAttribute="user">
        <fieldset>
            <div id="legend">
                <legend class="">Register</legend>
            </div>
            <div class="control-group">
                <!-- Username -->
                <label class="control-label"  for="username">Username</label>
                <div class="controls">
                    <form:input type="text" id="username" name="username" placeholder="" class="input-xlarge" path="username" required="true" />
                    <p class="help-block"></p>
                </div>
            </div>

            <%--<div class="control-group">--%>
                <%--<!-- E-mail -->--%>
                <%--<label class="control-label" for="email">E-mail</label>--%>
                <%--<div class="controls">--%>
                    <%--<form:input type="text" id="email" name="email" placeholder="" class="input-xlarge" path="email" required="true" />--%>
                    <%--<p class="help-block">Please provide your E-mail</p>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="control-group">
                <!-- Password-->
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <form:input type="password" id="password" name="password" placeholder="" class="input-xlarge" path="password" required="true" onchange='check_pass()' />
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="control-group">
                <!-- Password -->
                <label class="control-label"  for="password_confirm">Password (Confirm)</label>
                <div class="controls">
                    <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge" required="true" onchange='check_pass()' />
                    <p class="help-block">Please confirm password</p>
                    <span id="message"></span>
                </div>
            </div>

            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-success" id="submit">Register</button>
                </div>
            </div>
        </fieldset>
    </form:form>
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            var password = $("#password").val();
            var confirmPassword = $("#password_confirm").val();
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        });
    });
</script>
<script>
    $(function () {
        var json = $("#usernames");
        for (var i = 0; i < json.length; i++){
            if($("#username") == i){
                alert("Username already exists");
                return false;
            }
        }
        return true;
    });
</script>
<script src="/WEB-INF/js/registerCheck.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
