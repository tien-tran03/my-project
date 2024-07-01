package Models;

public class Accounts {

    private int account_id;
    private String username;
    private String password;
    private int isAdmin;
    private String first_name;
    private String last_name;
    private String phonenumber;
    private String email;
    private int isActive;

    public Accounts(String username, String password, int isAdmin) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

public Accounts(int account_id, String username, String password, int isAdmin, String first_name, String last_name, String phonenumber, String email, int isActive) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.first_name = first_name;
        this.last_name = last_name;
        this.phonenumber = phonenumber;
        this.email = email;
        this.isActive = isActive;
    }

    public Accounts(int account_id, String username, String password, int isAdmin, String first_name, String last_name, String email) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
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

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Accounts{" + "username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }
}
