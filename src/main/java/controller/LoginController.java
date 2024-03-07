package controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class LoginController {
	static String dbURL =  "jdbc:mysql://localhost:3306/mkce";
	static String dbUname = "root";
	static String dbPass = "";
	static String dbDriver = "com.mysql.cj.jdbc.Driver";
    String email,pass;
	public LoginController(String email, String pass) {
		this.email=email;
		this.pass= pass;	}
	public boolean toStore(){
		Connection con = null;
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL,dbUname,dbPass);
			String sql = "select * from batch2 where email='"+email+"' and password='"+pass+"' ";
			Statement s = con.createStatement();
			ResultSet rs =s.executeQuery(sql);
			if(rs.next()) {
				con.close();
				return true;
				}
			con.close();
		}catch(Exception e) {
			System.out.println(e);	
		}
		return false;
		
	}
	public ResultSet toGet(){
		Connection con = null;
		ResultSet rs=null;
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL,dbUname,dbPass);
			String sql = "select * from bookings";
			Statement s = con.createStatement();
			rs =s.executeQuery(sql);
			return rs;
		}catch(Exception e) {
			System.out.println(e);	
		}
		return rs;
		
	}
	
}
