import java.sql.*;
import javax.sql.*;
import java.io.IOException.*;
class Bucket{
	public static void main(String[] args){
		Bucket buk = new Bucket();
		buk.DBConn();
	}
	//static Connection con=null;
	public void DBConn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentfeedback","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from student");
            while(rs.next())
                System.out.println(rs.getInt("Roll_No")+"  "+rs.getString("Name")+"  "+rs.getString("Pass"));
            con.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
	}
}