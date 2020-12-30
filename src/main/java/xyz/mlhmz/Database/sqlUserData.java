package xyz.mlhmz.Database;

import xyz.mlhmz.Objects.User;

import java.sql.*;

public class sqlUserData {

    // Method that needs a username and password from the HTML Form.
    public static User get(String username, String password) {

        // Initialize Database Class
        Database db = new Database();

        // Run JDBC Driver
        try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsername(), db.getPassword())) {
            // Create SQL Query (Everything from Table Login)
            String query = "SELECT * FROM login";

            // Create a Statement from the DriverManager
            Statement stmt = con.createStatement();

            // Get Results from Statement
            ResultSet rs = stmt.executeQuery(query);

            // Check if Table has another Entry
            while (rs.next()) {
                // If so, check if the Table contains the Username from the Login
                if (rs.getString("username").equals(username)){

                    // If the Password from the selected Table User equals the Password from the Form, get the certain Data.
                    if (rs.getString("password").equals(password)) {
                        // Return the Data to the certain Class
                        return new User(rs.getString("username"),
                                rs.getString("password"),
                                rs.getInt("uid"),
                                rs.getString("name"),
                                rs.getInt("rang"),
                                rs.getString("email"));


                    }
                }
            }

            // If the User couldn't be found, return null.
            return null;



        } catch (SQLException throwables) {
            throwables.printStackTrace();
           return null;
        }
    }

    public static void create(String username, String password, String fullname, int rang, String email) {
        // Initialize Database Class
        Database db = new Database();


        try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsername(), db.getPassword())) {
            // Create Command for Inserting the Credentials into the Database
            String query =
                    "INSERT INTO login (username, password, uid, name, email, rang) VALUES ('" +
                    username + "', '" +
                    password + "', " +
                    "NULL, '" +
                    fullname + "', '" +
                    email + "', "  +
                    rang + ")";

            // Create a Statement from the DriverManager
            Statement st = con.createStatement();

            // Execute the Query with the Statement
            st.executeUpdate(query);

            // Close the Statement
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void delete(int uid) {
        // Database Class
        Database db = new Database();

        try(Connection con = DriverManager.getConnection(db.getUrl(), db.getUsername(), db.getPassword())) {
            // Query command to delete the Row where the uid is the one selected.
            String query = "DELETE FROM login WHERE uid = " + uid + ";";

            // Statement
            Statement st = con.createStatement();

            // Execute the Delete Command
            st.executeUpdate(query);

            // Close the Statement
            st.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
