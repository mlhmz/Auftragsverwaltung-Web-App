<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wählen sie eine Option.</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" />
</head>
<body>
    <div id="container">
        <h3>Login erfolgreich.</h3>
        <h4><%= session.getAttribute("username") %></h4>
        <h5><a href="logout">Logout</a></h5>
        <div class="navigation">
            <form action="app" method="post">
            <div id="radioButtons">
                <% if ((int) session.getAttribute("rang") > 1) { %>
                <input type="radio" id="radioInput"name="appSelector" value="admin">Admin-Panel</input><br>
                <% } if ((int) session.getAttribute("rang") > 0) { %>
                <input type="radio" id="radioInput" name="appSelector" value="data">Datenverwaltung</input><br>
                <input type="radio" id="radioInput" name="appSelector" value="creation">Auftragserstellung</input><br>
                <% } %>
                <input type="radio" id="radioInput" name="appSelector" value="list">Auftragsliste</input><br>
            </div>
            <input type="submit" id="button" value="Starten">
            </form>
        </div>
    </div>
</body>
</html>