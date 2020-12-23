
import xyz.mlhmz.Database.Database;
import xyz.mlhmz.Objects.User;

import java.sql.*;

public class mysql {
    public static void main(String[] args) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://IP:PORT/DATABASE", "root", "")) {
            String username = "USERNAME";
            String query = "SELECT * FROM login";

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                if (rs.getString("username").equals(username)) {
                    System.out.println(
                            "Username: " + rs.getString("username") + "\n" +
                            "Password: " + rs.getString("password") + "\n" +
                            "UID: " + rs.getInt("uid") + "\n" +
                            "Name: " + rs.getString("name"));
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
