<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Wallet</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: darkgray;
        }

        li {
            float: left;
            border-right:1px solid #111111;
        }

        li:last-child {
            border-right: none;
        }

        li a {
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: lightgray;
        }

        .active {
            background-color: lightgray;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }

        .text {
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .table {
            float: left;
            width: 50%;
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            height: 700px;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 14px 20px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 14px 20px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
        }

        .tg .tg-baqh {
            text-align: center;
            vertical-align: top
        }

        .tg .tg-yw4l {
            vertical-align: top
        }

    </style>
</head>
<body>
    <ul>
        <li class="text">Exchange</li>
        <li class="right"><a href="/logout">Logout</a></li>
        <li class="right"><a href="/settings">Settings</a></li>
        <li class="right text">Logged in as <span>${username}</span></li>
    </ul>
    <div>
        <div class="left table">
            <table class="tg">
                <tr>
                    <th class="tg-baqh" colspan="4"></th>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
            </table>
        </div>
        <div class="right table">
            <table class="tg">
                <tr>
                    <th class="tg-baqh" colspan="4">My Wallet</th>
                </tr>
                <tr>
                    <td class="tg-baqh">Currency</td>
                    <td class="tg-baqh">Unit price</td>
                    <td class="tg-baqh">Amount</td>
                    <td class="tg-baqh">Value</td>
                    <td class="tg-baqh">Actions</td>
                </tr>
                <c:forEach items="walletCurrencies" var="walletCurrency">
                    <tr>
                        <td class="tg-baqh">${walletCurrency.currency.code}</td>
                        <td class="tg-baqh">${unitprice}</td>
                        <td class="tg-baqh">${walletCurrency.amount}</td>
                        <td class="tg-baqh"><script>
                            $(function () {
                                document.write(${unitprice} * ${walletCurrency.amount})
                            });
                        </script></td>
                        <td class="tg-baqh"></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>

            </table>
        </div>
    </div>

<script type="text/javascript" src="../resources/js/readFromAPI.js" ></script>
</body>
</html>
