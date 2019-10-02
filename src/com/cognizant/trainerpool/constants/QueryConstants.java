package com.cognizant.trainerpool.constants;

public final class QueryConstants {
	public static final String INSERT_ROLE = "INSERT INTO role(role_name) VALUES(?)";
	public static final String INSERT_USER = "INSERT INTO user(usr_first_name, usr_last_name, usr_age, usr_gender, "
			+ "usr_contact_number, usr_address, usr_userId, usr_password, usr_role)"
			+ " VALUES(?,?,?,?,?,?,?,?,?)";

	public static final String INSERT_ADDRESS = "INSERT INTO address(add_line1,add_line2,add_city) VALUES(?,?,?)";

	public static final String INSERT_SKILLS = "INSERT INTO skills(skill_name,skill_duration) VALUES(?,?)";

	public static final String INSERT_USER_SKILLS = "INSERT INTO user_skills(user_id,skill_id) VALUES(?,?)";

	public static final String INSERT_REQUEST = "INSERT INTO request(req_requestorId,req_subject,req_start_date,req_end_date, req_city,req_batch_size)"
			+ " VALUES(?,?,?,?,?,?)";


	public static final String INSERT_SKILL_REQUEST = "INSERT INTO skill_requests(skill_id,req_id) VALUES(?,?)";

	public static final String SHOW_SKILLS = "SELECT skill_id, skill_name, skill_duration from skills";

	public static final String SELECT_USER = "SELECT usr_userId, usr_password, usr_role FROM user WHERE usr_userId=? AND usr_password=?";

	public static final String COUNT_USER = "SELECT COUNT(1) FROM user WHERE usr_userId = ? AND usr_role = ?";

	public static final String SELECT_REQUESTS = "SELECT req_subject, req_start_date, req_end_date, req_city, req_batch_size, req_status, req_id FROM request, user " + 
	"WHERE req_requestorId = usr_userId ORDER BY req_start_date";
	
	public static final String DELETE_REQUEST = "DELETE FROM request WHERE req_id = ? AND req_requestorId = ?";

	public static final String UPDATE_PASSWORD = "UPDATE user SET usr_password = ? WHERE usr_userId = ? AND usr_password = ?";

// 
	
//	Trainer
	
	public static final String SHOW_REQUEST = "\n" + 
			"select req_id,req_subject,req_start_date,req_end_date,req_city,req_batch_size from user,request where usr_userId=? and  usr_start_avail<=req_start_date and usr_end_avail>=req_end_date and req_status=\"NA\"; \n" + 
			"";	
	// Update into Request
	public static final String UPDATE_REQUEST = "update request set req_status = 'A' where req_id=?";
	// Insert into user_request
	public static final String INSERT_USER_REQUEST = "INSERT INTO user_requests(user_id,req_id) VALUES(?,?)";

	public static final String SHOW_ACCEPTED_REQUEST = "";
	
	
}
