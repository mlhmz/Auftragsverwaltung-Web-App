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
            <select name="appSelector">
                <%
                switch(Integer.parseInt(session.getAttribute("rang").toString())) {
                    case(2):
                        out.println("<option value='admin'>Admin-Panel</option>");
                    case(1):
                        out.println("<option value='creation'>Auftragserstellung</option>" +
                    "<option value='data'>Datenverwaltung</option>");
                    case(0):
                        out.println("<option value='list'>Auftragsliste</option>");             
                 }
                 %>

            </select>
            <input type="submit" id="button" value="Starten">
            </form>
        </div>
    </div>
</body>
</html>