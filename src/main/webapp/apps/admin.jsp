<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin-Panel</title>
</head>
<body>
    <div id="site-content">
        <h3>Admin-Panel</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Nutzername</th>
                <th>Voller Name</th>
                <th>Rang</th>
            </tr>
            <%
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "")) {
                    // Create SQL Query (Everything from Table Login)
                    String query = "SELECT * FROM login";

                    // Create a Statement from the DriverManager
                    Statement stmt = con.createStatement();

                    // Get Results from Statement
                    ResultSet rs = stmt.executeQuery(query);

                    // Check if Table has another Entry
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("uid") + "</td>");
                        out.println("<td>" + rs.getString("username") + "</td>");
                        out.println("<td>" + rs.getString("name") + "</td>");
                        out.println("<td>" + rs.getString("rang") + "</td>");
                        out.println("<td><a href='#'>Bearbeiten</a></td>");
                        out.println("<td><a href='#'>Loeschen</a></td>");
                        out.println("</tr>");
                    }
                } catch (Exception throwables) {

                }
            %>
        </table> 
        <button id="btn" onClick="toggleFormVisibility()">Nutzer erstellen</button>
    </div>
    <div id="dimEffect" />
    <form name="creationForm" id="creationForm" method="post" action="createUser">
        <h5><a onClick="toggleFormVisibility()">Schliessen</a></h5>
        <h4>Nutzer erstellen</h4>
        <input type="text" placeholder="Nutzername" name="username" id="un" /><br>
        <input type="password" placeholder="Passwort" name="password" id="pw" /><br>
        <input type="text" placeholder="Voller Name" name="fullname" id="fn" /><br>
        <input type="text" placeholder="Email" name="email" id="e" /><br>
        <p>Rang:</p>
        <select name="rang" id="rang">
            <option value="reading">Reading</option>
            <option value="managing">Managing</option>
            <option value="admin">Admin</option>
        </select>
        <input type="submit" id="btn" value="Nutzer erstellen" /><br>
    </form>
</body>
</html>

<script>
    document.getElementById("creationForm").style.visibility = "hidden";
    document.getElementById("dimEffect").style.visibility = "hidden";
    var formHidden = false;

    function toggleFormVisibility() {
        if (formHidden === false) {
            document.getElementById("creationForm").style.visibility = "visible";
            document.getElementById("dimEffect").style.visibility = "visible";
            formHidden = !formHidden;
        } else {
            document.getElementById("creationForm").style.visibility = "hidden";
            document.getElementById("dimEffect").style.visibility = "hidden";
            document.getElementById("un").value = "";
            document.getElementById("pw").value = "";
            document.getElementById("fn").value = "";
            document.getElementById("e").value = "";

            formHidden = !formHidden;
        }
    }
</script>

<style>
* {
    font-family: 'Segoe UI', Arial, Helvetica, sans-serif;
    background-color:white;
}

a {
    color: grey;
    font-size: 10px;
    cursor: pointer;
}

p {
    margin: 0;
}

h3 {
    text-align: center;
    color: rgb(255, 95, 37);
}

h4 {
    margin: 2px;
    text-align: center;
    background: none;
}

h5 {
    margin: 0px;
    text-align: right;
}

form {
    position: fixed;
    width: 25%;
    background-color: white;
    padding: 50px;
    box-shadow: 0px 0px 25px black;
    border-radius: 10px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    align-items: center;
}

input {
    padding: 10px;
    border: solid grey 2px;
    border-radius: 10px;
    width: 50%;
}

select {
    width: 50%;
    padding: 10px;
    border-radius: 10px;
    border: solid grey 2px;
    margin: 10px;
}

#btn {
    cursor: pointer;
    margin: 2px;
    padding: 10px;
    background-color: rgb(255, 95, 37);
    color: white;
    border: none;
    border-radius: 10px;
}

#site-content {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    margin: auto;
    align-items: center;
    width: 50%;
}

#dimEffect {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    transition: 0.3s;
}

table {
    margin: auto;
    padding: 10px;
}

button {
    
}


</style>