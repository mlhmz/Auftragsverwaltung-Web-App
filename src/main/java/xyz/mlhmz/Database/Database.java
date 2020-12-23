package xyz.mlhmz.Database;

import xyz.mlhmz.Objects.User;

import java.sql.SQLException;
import java.util.ArrayList;

public class Database {
    final String url = "jdbc:mysql://localhost:3306/auftragsverwaltung";
    final String username = "root";
    final String password = "";

    public String getUrl() {
        return url;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
