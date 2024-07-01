package DAL;

import Models.*;
import DAL.DBContext;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class DAO extends DBContext {

    private Connection con;
    private String status;
    private List<Products> pro;
    private List<Accounts> acc;
    private List<Categories> cate;
    private List<String> columnName;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Products> getPro() {
        return pro;
    }

    public void setPro(List<Products> pro) {
        this.pro = pro;
    }

    public List<String> getColumnName() {
        return columnName;
    }

    public void setColumnName(List<String> columnName) {
        this.columnName = columnName;
    }

    public List<Categories> getCate() {
        return cate;
    }

    public void setCate(List<Categories> cate) {
        this.cate = cate;
    }

    public List<Accounts> getAcc() {
        return acc;
    }

    public void setAcc(List<Accounts> acc) {
        this.acc = acc;
    }

    public List<Products> loadProduct() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)
                ));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public List<Products> getMaxQuantity() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Products \n"
                + "WHERE quantity = (\n"
                + "    SELECT MAX(quantity) \n"
                + "    FROM Products\n"
                + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                list.add(new Products(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public List<Products> getMinQuantity() {
        List<Products> list = new ArrayList<>();
       String sql = "select * from Products where quantity =(select MIN(quantity) from Products)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {               
                list.add(new Products(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }


    public List<Products> loadProductOderBypIDcID() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products "
                + "order by CategoryID, ProductID asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public int getTotalProduct() {
        String sql = "select count(*) from Products";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {

        }
        return 0;
    }

    public int getTotalAccount() {
        String sql = "select count(*) from Accounts";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {

        }
        return 0;
    }

    public List<Products> pagingProducts(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "Select * from Products "
                + "order by CategoryID asc, ProductID Offset ? rows fetch next 15 rows only;";
        // offset tu dong nao va tu dong day se lay may student
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 15);
            //khi click vao 1 thi no se offset bat dau tu 0 
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Accounts> pagingAccount(int index) {
        List<Accounts> list = new ArrayList<>();
        String sql = "Select * from Accounts "
                + "order by CategoryID asc, ProductID Offset ? rows fetch next 15 rows only;";
        // offset tu dong nao va tu dong day se lay may student
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 15);
            //khi click vao 1 thi no se offset bat dau tu 0 
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Accounts(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> loadProductByCID(int cid) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products where CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)
                ));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public List<Products> searchByPName(int cid, String name) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products \n"
                + "where CategoryID = ? and ProductName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setString(2, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)
                ));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public List<Products> searchAllByPName(String name) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products \n"
                + "where ProductName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)
                ));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public Products loadProductByPID(int pid) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Products(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getFloat(4),
                        rs.getInt(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8),
                        rs.getFloat(9)
                );
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return null;
    }

    public List<Accounts> ChangePass(String user, String pass) {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Accounts where username = ? and password = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Accounts(rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public Accounts ChangePassword(String user, String pass) {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Accounts where username = ? and password = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Accounts(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(9), rs.getString(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public void setPassword(String user, String pass, String newpass) {
        Accounts a = ChangePassword(user, pass);
        String sql = "update Accounts set password = ? where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setInt(2, a.getAccount_id());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Categories> loadCategory() {
        List<Categories> cate = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Categories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return cate;
    }

    public void getAllColumnName(String tableName) {
        columnName = new ArrayList<>();
        String sql = "SELECT column_name\n"
                + "FROM information_schema.columns\n"
                + "WHERE table_name = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String column = rs.getString("column_name");
                columnName.add(column);
            }
        } catch (Exception e) {
            status = "Error at get column name in table " + e.getMessage();
        }
    }

    public void Insert(int ProductID, String ProductName, String Category, String Price, int StockQuantity, int CategoryID, String image_url, int Quantity, String Sellprice) {
        String sql = "Insert into Products values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ps.setString(2, ProductName);
            ps.setString(3, Category);
            ps.setFloat(4, Float.parseFloat(Price));
            ps.setInt(5, StockQuantity);
            ps.setInt(6, CategoryID);
            ps.setString(7, image_url);
            ps.setInt(8, Quantity);
            ps.setFloat(9, Float.parseFloat(Sellprice));
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Products " + e.getMessage();
        }
    }

    public void InsertCategory(int CategoryID, String Category) {
        String sql = "Insert into Categories values(?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ps.setString(2, Category);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Products " + e.getMessage();
        }
    }

    public void Update(int ProductID, String ProductName, String Category, float Price, int StockQuantity, int CategoryID, float Discount, String image_url, int Quantity, float Sellprice) {
        String sql = "UPDATE Products\n"
                + "SET [ProductName] = ?\n"
                + ",[Category] = ?\n"
                + ",[Price] = ?\n"
                + ",[StockQuantity] = ?\n"
                + ",[CategoryID] = ?\n"
                + ",[image_url] = ?\n"
                + ",[Quantity] = ?\n"
                + ",[Sellprice] = ? WHERE ProductID = ? ;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ProductName);
            ps.setString(2, Category);
            ps.setFloat(3, Price);
            ps.setInt(4, StockQuantity);
            ps.setInt(5, CategoryID);

            ps.setString(6, image_url);
            ps.setInt(7, Quantity);
            ps.setFloat(8, Sellprice);
            ps.setInt(9, ProductID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Products " + e.getMessage();
        }
    }

    public void Delete(int pid) {
        String sql = "delete from Products where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at Update Products " + e.getMessage();
        }
    }

    public void DeleteOrderItem(int pid) {
        String sql = "delete from OrderItems where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at Update Products " + e.getMessage();
        }
    }

    public Accounts loadAccount(String user, String pass) {
        String sql = " select * from Accounts \n"
                + "where [username] = ? and [password] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                return new Accounts(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(9), rs.getString(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return null;
    }

    public Accounts checkAccount(String user) {
        String sql = " select * from Accounts \n"
                + " where [username] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Accounts(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return null;
    }

    public boolean checkUser(String user) {
        String sql = "SELECT COUNT(*) FROM Accounts WHERE [username] = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Trả về true nếu có ít nhất một tài khoản có username tương ứng.
            }
        } catch (Exception e) {
            status = "Error at read Accounts " + e.getMessage();
        }

        return false; // Trả về false nếu có lỗi hoặc không tìm thấy tài khoản.
    }

    public boolean checkUserAndPass(String user, String pass) {
        String sql = "SELECT COUNT(*) FROM Accounts WHERE [username] = ? and [password] = ? ";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Trả về true nếu có ít nhất một tài khoản có username tương ứng.
            }
        } catch (Exception e) {
            status = "Error at read Accounts " + e.getMessage();
        }

        return false; // Trả về false nếu có lỗi hoặc không tìm thấy tài khoản.
    }

    public void updateActive(int active, String user) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [isActive] = ?\n"
                + " WHERE [username] = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, active);
            ps.setString(2, user);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Products " + e.getMessage();
        }
    }

    public void signUp(String user, String pass, String fname, String lname, String email, String phonenumber) {
        String sql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[is_admin]\n"
                + "           ,[first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[email]\n"
                + "           ,[isActive])\n"
                + "           ,[phoneNumber])\n"
                + "     VALUES\n"
                + "(?, ?, 0, ?, ?, ?, 0,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, fname);
            ps.setString(4, lname);
            ps.setString(5, email);
            ps.setString(6, phonenumber);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Accounts " + e.getMessage();
        }
    }

    public void signUp1(String user, String pass, int isAdmin, String fname, String lname, String email, int isActive, String phonenumber) {
        String sql = "insert into Accounts (username,password,is_admin,first_name,last_name,email,isActive,phoneNumber) values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isAdmin);
            ps.setString(4, fname);
            ps.setString(5, lname);
            ps.setString(6, email);
            ps.setInt(7, isActive);
            ps.setString(8, phonenumber);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Accounts " + e.getMessage();
        }
    }

    public void addOrder(Order od) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        String sql = "INSERT INTO [dbo].[Orders] ([OrderDate],[account_id]) VALUES(?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, date);
            ps.setInt(2, od.getUserID().getAccount_id());
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at insert Orders " + e.getMessage();
        }
    }

    public int getOrder() {
        int ordID = 0;
        String sql = "select top 1 OrderID from Orders order by OrderID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ordID = rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at insert Orders " + e.getMessage();
        }
        return ordID;
    }

    public void addToOdItem(Items item, int orderId) {
        String sql1 = "INSERT INTO [dbo].[OrderItems] "
                + "(OrderID, ProductID, ProductQuantity, Sellprice) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, orderId);
            ps.setInt(2, item.getProduct().getProductID());
            ps.setInt(3, item.getProductQuantity());
            ps.setFloat(4, item.getProduct().getSellprice());
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at insert Orders " + e.getMessage();
        }
    }

    public void updateOd(Order od, int oderID) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "SET [TotalAmount] = ?\n"
                + "WHERE [OrderID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, od.getTotalAmount());
            ps.setInt(2, oderID);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at insert Orders " + e.getMessage();
        }
    }

    public void updateAdd(String location, int oderID) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "SET [address] = ?\n"
                + "WHERE [OrderID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, location);
            ps.setInt(2, oderID);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at insert Orders " + e.getMessage();
        }
    }

    public void updateQuantity(int stockQuantity, int Quantity, int ProductID) {
        String sql = "UPDATE Products SET \n"
                + "[StockQuantity] = ? "
                + ",[Quantity] = ? WHERE ProductID = ? ;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, stockQuantity);
            ps.setInt(2, Quantity);
            ps.setInt(3, ProductID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Products " + e.getMessage();
        }
    }

    public List<Accounts> getAllAcc() {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Accounts";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Accounts(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getInt(9)));

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        Accounts acc = d.loadAccount("admin", "123");
        System.out.println(acc);
    }
}
