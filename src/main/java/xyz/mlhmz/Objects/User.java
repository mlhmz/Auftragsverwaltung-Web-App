package xyz.mlhmz.Objects;

public class User {
    public String username;
    public String password;
    public int uid;
    public String name;
    public int rang;
    public String email;

    public User(String username, String password, int uid, String name, int rang, String email) {
        this.username = username;
        this.password = password;
        this.uid = uid;
        this.name = name;
        this.rang = rang;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRang() {
        return rang;
    }

    public void setRang(int rang) {
        this.rang = rang;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
