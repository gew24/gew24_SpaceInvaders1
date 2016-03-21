package edu.pitt.is1017.spaceinvaders;

import java.sql.ResultSet;
import javax.swing.JOptionPane;

/*
 * @author Grant Wescott
 * 
 */



public class User {
	int userID;
	private String lastName, firstName, email, password;
	private boolean loggedIn;
	
	//default constructor
	public User(int user, String mail, String pw){
		userID = user;
		email = mail;
		password = pw;
	}
	
	public int getUserID() {
		return userID;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	//constructor to login user
	public User(String txtEmail, String txtPassword){
		DbUtilities db = new DbUtilities();
		// gather data from Login
		String email = txtEmail;
		String password = txtPassword;
		
		// sql statement to query db for email and password
		String sql = "SELECT * FROM users WHERE email = '" + email +  "' AND password = MD5('" + password + "');";

		// try catch block test input against database to validate user credentials
		try{
			ResultSet rs = db.getResultSet(sql);
			if(rs.next()){
				loggedIn = true;
				this.userID = rs.getInt("userID");
				this.lastName = rs.getString("lastName");
				this.password = rs.getString("password");
				this.email  = rs.getString("email");
				this.firstName = rs.getString("firstName");
			}
			else{ // handles invalid user input 
				loggedIn = false;
				JOptionPane.showMessageDialog(null, "Login attempt failed.");
			}
		}
		catch(Exception ex){	
		}
		finally{}
	}
	
	// constructor to register new user this constructor passes user entered information from RegistrationGUI to MySql
	// to create a new row in the database for a new user account
	public User(String lastName, String firstName, String email, String password){
		DbUtilities db = new DbUtilities();
		
		String sql = "INSERT INTO users (lastName, firstName, email, password)";//Insert statement 
		sql = sql + "VALUES('" + lastName + "','" + firstName +"','" + email +"'," + "MD5('" + password + "'))";
		System.out.println(sql);
		db.executeQuery(sql);
	}
	
	// Updates new user information
	public void saveUserInfo(){
		DbUtilities db = new DbUtilities();
		String sql ="UPDATE users SET email = '" + email +  //update statement for mysql
				"', password = MD5('" + password + "') "
						+ "WHERE userID = '" + this.userID + "';";
		System.out.println(sql);
		db.executeQuery(sql);
	}
}