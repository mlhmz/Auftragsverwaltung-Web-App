<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SQL Login Test</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" />
</head>
<body>
<div id="container">
    <h3>Die Auftragsverwaltung</h3>
    <h4>Login</h4>
    <form name="loginForm" method="post" action="login">
        <input type="text" id="textInput" name="un" placeholder="Username" /> <br>
        <input type="password" id="textInput" name="pw" placeholder="Password" /> <br>
        <input type="submit" id="button" value="Login">
    </form>
</div>
</body>
</html>

 <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resources/script.js" />
