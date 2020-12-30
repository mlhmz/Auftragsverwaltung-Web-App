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
    <div id="nav">
        <!-- <em class="arrow" href="/selection"></em> -->
        <h2>Auftragsverwaltung</h2>

        <ul>
            <li><a class="selected">Admin-Panel</a></li>
            <li><a>Datenverwaltung</a></li>
            <li><a>Auftragsverwaltung</a></li>
            <li><a>Auftragsliste</a></li>
            <li><a href="/WebSqlApp/logout" class="navA">Logout</a></li>
        </ul>
    </div>
    <div id="site-content">
        <h3>Admin-Panel</h3>
        <form name="deleteForm" method="POST" action="deleteUser">
            <input type="hidden" name="uid" />

        </form>
        <table>
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
                        out.println("<div class='contentRow'>");
                        out.println("<details>");
                        out.println("<summary>");
                        out.println("<div id='summaryContainer'>");
                        out.println("<p class='itemTitle'>ID</p><br>");
                        out.println("<p class='summaryContent'>" + rs.getString("uid") + "</p>");
                        out.println("</div>");
                        out.println("<div id='summaryContainer'>");
                        out.println("<p class='itemTitle'>Nutzername</p><br>");
                        out.println("<p class='summaryContent'>" + rs.getString("username") + "</p>");
                        out.println("</div>");
                        out.println("</summary>");
                        out.println("<p class='itemTitle'>Voller Name</p>");
                        out.println("<p>" + rs.getString("name") + "</p><br>");
                        out.println("<p class='itemTitle'>Email</p>");
                                                out.println("<p>" + rs.getString("email") + "</p><br>");
                        out.println("<p class='itemTitle'>Rechte</p>");
                        out.println("<ul class='permissions'>");
                        switch(rs.getInt("rang")) {
                            case(2):
                                out.println("<li>Administrieren</li>");
                            case(1):
                                out.println("<li>Verwalten</li>");
                            case(0):
                                out.println("<li>Lesen</li>");
                        }
                        out.println("</ul>");
                        out.println("<button id='detailsBtn' form='deleteUser' name='uid' value='" + rs.getInt("uid") + "' onclick='document.deleteForm.uid.value=this.value;document.deleteForm.submit();'>Entfernen</button>");
                        out.println("</details>");
                        out.println("</div>");
                        out.println("</tr>");
                        
                    }
                } catch (Exception throwables) {

                }
            %>
        </table>
        <button id="btn" onClick="toggleFormVisibility()">Nutzer erstellen</button>
    </div>
    <div id="dimEffect">
    </div>
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
    padding: 0;
    margin: 0;
}

#nav a {
    background: transparent;
    text-decoration: none;
    cursor: pointer;

}



#nav a:hover {
    color: #FFF07C;
}

.selected a {
    color: #FFF07C;
}

form a {
    color: grey;
    font-size: 10px;
    cursor: pointer;
}



h3 {
    text-align: center;
    color: rgb(255, 95, 37);
    margin: 15px;    
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

#creationForm {
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
    margin: 5px;
}

select {
    width: 50%;
    padding: 10px;
    border-radius: 10px;
    border: solid grey 2px;
    margin: 10px;
}

.creationMessage {
    text-align: center;
}

p {
    background: transparent;
    display: inline-table;
    margin: 15px;

}

summary {
    background: rgb(252, 252, 252);
}

.contentRow {
    padding: 4px;
    padding-top: 2px;
    padding-bottom: 2px;
    margin: 5px;
    width: 50%;
    text-align: justify;
    border-radius: 10px;
    border: rgb(223, 223, 223) solid 1px;
    background: rgb(252, 252, 252);
}

#btn {
    cursor: pointer;
    margin: 2px;
    padding: 10px;
    background: transparent;
    color: white;
    border: none;
    border-radius: 10px;
    border: 2px solid rgb(255,95,37);
    font-weight: 700;
    color: rgb(255,95,37);
}

#btn:hover {
    background: rgb(255,95,37);
    color: white;
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
}

table {
    margin: auto;
    padding: 10px;
}

#summaryContainer {
    display: inline-block;
    background: transparent;
}

.summaryContent {
    margin-top: 0;
}

.itemTitle {
    margin-bottom: 0;
    font-size: 12px;
}

.navA {
    color: white;
}

details {
    background: transparent;
}

li {
    list-style-type: none;
    background: transparent;
}

ul {
    background: transparent;
}

#detailsBtn {
    background: none;
    border: none;
    cursor: pointer;
    margin: 5px;
}

#detailsBtn:hover {
    color: rgb(255,95,37);
}



#nav ul {
    display: inline-flex;
    float: right;
    margin: 5px;
    vertical-align: middle;
    margin-right: 10px;

}

#nav li {
    margin-left: 10px;

    color: white;
    font-weight: 700;


}

.selected {
    color: #FFC300;
}


#nav {
    width: 100%;
    height: 5%;
    background: rgb(255,95,37);
    margin: 0;
    padding-top: 15px;
    padding-bottom: 15px;


    
}



#nav h2 {
    margin-left: 15px;
    display: inline-flex;
    background: rgb(255,95,37);

    color: white;



}

.permissions {
    margin: 5px;
    margin-left: 25px;
}

</style>