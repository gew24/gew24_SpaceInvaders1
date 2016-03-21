package edu.pitt.is1017.spaceinvaders;

import java.sql.ResultSet;
import java.util.UUID;

import javax.swing.JOptionPane;

public class ScoreTracker {

	// variables to hold user information
	/** User method */
	private User user;
	/** Variable to hold value of users current score */
	private int currentScore;
	/**Variable to hold the high score value from the database */
	private int highestScore; // compare high score to current score if curr>highest insert curr into db
	/** Variable to hold UUID for each new game */
	private int point;
	private String gameID;
	/** Variable to hold value of point scored during gameplay*/
	private int score;
	
	private int topScore;
	private String topPlayerFName, topPlayerLName;
	
	
	/** Getters and Setters for the variables being used*/
	public String getTopPlayerLName() {
		return topPlayerLName;
	}

	public void setTopPlayerLName(String topPlayerLName) {
		this.topPlayerLName = topPlayerLName;
	}

	public void setTopPlayerFName(String topPlayerFName) {
		this.topPlayerFName = topPlayerFName;
	}

	public String getTopPlayerFName() {
		return topPlayerFName;
	} 
	public int getTopScore() {
		return topScore;
	}

	public void setTopScore(int topScore) {
		this.topScore = topScore;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCurrentScore() {
		return currentScore;
	}

	public void setCurrentScore(int currentScore) {
		this.currentScore = currentScore;
	}

	public int getHighestScore() {
		return highestScore;
	}

	public void setHighestScore(int highestScore) {
		this.highestScore = highestScore;
	}

	public String getGameID() {
		return gameID;
	}

	public void setGameID(String gameID) {
		this.gameID = gameID;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	// ScoreTracker constructor
	public ScoreTracker(User inUser){ //constructor:
		
		user = inUser;
		currentScore = 0;
		gameID = UUID.randomUUID().toString();
		highestScore=0;
		
		
		DbUtilities db = new DbUtilities();// instantiate new DbUtilities object		
//		Retrieves the value of the highest score for any game that the user has ever played (QUERY)		
		String sql = "SELECT MAX(scoreValue) AS highestScore FROM finalscores WHERE fk_userID = '" + user.getUserID() + "'; ";    	
		try{
			ResultSet rs = db.getResultSet(sql);
			if(rs.next()){
				this.highestScore = rs.getInt("highestScore");
				//JOptionPane.showMessageDialog(null, "high score = " + getHighestScore());			
			}
		}
		catch(Exception ex){	
			
		}	
	}
	
	//RecordScore method
	public void recordScore(int point){
		DbUtilities db = new DbUtilities();
	
		
		int scoreType = 1;
		if(point < -1){ scoreType = 0;}
		currentScore = currentScore + point;
		
		String sql = "INSERT INTO runningscores (`gameID`, `scoreType`, `scoreValue`, `fk_userID`, `dateTimeEntered`)";//Insert statement 
		sql = sql + "VALUES('" + this.gameID + "'," + scoreType + "," + currentScore +",'" + this.user.getUserID() + "'," + "NOW());";
		//System.out.println(sql);
		db.executeQuery(sql);
		

	}

	
	// RecordFinalScore method
	public void recordFinalScore(int currentScore){
		DbUtilities db = new DbUtilities();
		highestScore=getCurrentScore();
		String sql = "INSERT INTO finalscores (`gameID`, `scoreValue`, `fk_userID`, `dateTimeEntered`)VALUES('" + gameID + "'," 
					  + highestScore + "," + user.userID + ", now());";
		db.executeQuery(sql);	
	}
	public void topHighScore(String topPlayerFName, String topPlayerLName, int topScore){
		DbUtilities db = new DbUtilities();
		String sql = "SELECT lastName, firstName, MAX(scoreValue) FROM finalscores JOIN users ON fk_userID = userID GROUP BY lastName, firstName ORDER BY MAX(scoreValue) DESC LIMIT 1;";
		try{
			ResultSet rs = db.getResultSet(sql);
			if(rs.next()){
				this.topScore = rs.getInt("MAX(scoreValue)");
				this.topPlayerFName = rs.getString("firstName");
				this.topPlayerLName = rs.getString("lastName");	
			}
		}
		catch(Exception ex){	// displays when we can't access the information in the database
			JOptionPane.showMessageDialog(null,"no data to display");
			
		}
	}
}