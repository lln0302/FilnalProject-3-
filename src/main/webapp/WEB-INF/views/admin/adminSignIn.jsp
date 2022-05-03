<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<style>
header{
     display:flex;
     justify-content: center;
}
form{
    padding:10px;
    position: relative;
    left:25%;
}
.inputBox{
    position:relative;
    margin:10px 0;
}
.inputBox > input{
    background:transparent;
    border:none;
    border-bottom: solid 1px #ccc;
    padding:20px 0px 5px 0px;
    font-size:14pt;
    width:50%;
}
input::placeholder{
    color:transparent;
}
input:placeholder-shown + label{
    color:#aaa;
    font-size:14pt;
    top:15px;

}
input:focus + label, label{
    color:#8aa1a1;
    font-size:10pt;
    pointer-events: none;
    position: absolute;
    left:0px;
    top:0px;
    transition: all 0.2s ease ;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown){
    border-bottom: solid 1px #8aa1a1;
    outline:none;
}
input[type=submit]{
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    width:50%;
    height:35px;
    font-size: 14pt;
    margin-top:100px;
}
#forgot{
    text-align: right;
    font-size:12pt;
    color:rgb(164, 164, 164);
    margin:10px 0px;
}
</style>
<body>

<header>
	<h2>Login</h2>
</header>

<form action="/adminSigninOk" method="POST">

	<div class="inputBox">
		<input id="username" type="text" name="username" placeholder="아이디">
		<label for="username">아이디</label>
	</div>
	
	<div class="inputBox">
		<input id="password" type="password" name="password" placeholder="비밀번호">
		<label for="password">비밀번호</label>
	</div>
		<div id="forgot">비밀번호 찾기</div>
	<input type="submit" value="로그인">

</form>

</body>
</html>