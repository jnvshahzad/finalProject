package com.cognizant.trainerpool.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.trainerpool.constants.QueryConstants;
import com.cognizant.trainerpool.model.Request;
import com.cognizant.trainerpool.model.Trainer;
import com.cognizant.trainerpool.util.DBUtil;

public class TrainerDaoImpl implements TrainerDao{

	@Override
	public boolean checkTrainer(int userId) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement checkTrainer = (PreparedStatement) connection
					.prepareStatement(QueryConstants.COUNT_USER);
			checkTrainer.setInt(1, userId);
			checkTrainer.setInt(2, 100003);

			int count = checkTrainer.executeUpdate();

			if (count > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean addTrainer(Trainer trainer) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement statement = (PreparedStatement) connection
					.prepareStatement(QueryConstants.INSERT_USER);
			statement.setString(1, trainer.getUserTrainer().getUserFirstName());
			statement.setString(2, trainer.getUserTrainer().getUserLastName());
			statement.setInt(3, trainer.getUserTrainer().getAge());
			statement.setString(4, trainer.getUserTrainer().getGender());
			statement.setLong(5, trainer.getUserTrainer().getContactNumber());
			statement.setString(6, trainer.getUserTrainer().getAddress());
			statement.setInt(7, trainer.getUserTrainer().getUserId());
			statement.setString(8, trainer.getUserTrainer().getPassword());
			statement.setInt(9, 100003);

			int count = statement.executeUpdate();

			if (count > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Trainer
	
	@Override
	public List<Request> showRequest(int trainerId) {
		try {
			List<Request> listRequest = new ArrayList<Request>();
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.SHOW_REQUEST);
			ps.setInt(1, trainerId);
			ResultSet rs = ps.executeQuery();
			Request request = null;
			while(rs.next()) {
				request = new Request();
				request.setRequestId(rs.getInt(1));
				request.setRequestSubject(rs.getString(2));
				request.setStartDate(rs.getDate(3));
				request.setEndDate(rs.getDate(4));
				request.setCity(rs.getString(5));
				request.setBatchSize(rs.getInt(6));
				
				listRequest.add(request);
				
			}
			return listRequest;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public Boolean updateRequest(int reqId) {
		
		try {
			Connection connection= DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.UPDATE_REQUEST);
			ps.setInt(1, reqId);
			int count =  ps.executeUpdate();
			if(count>0)
				return true;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}

	@Override
	public Boolean insertUserRequest(int trainerId, int reqId) {
		
		try {

			Connection connection= DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.INSERT_USER_REQUEST);
			ps.setInt(1, trainerId);
			ps.setInt(2, reqId);
			
			int count = ps.executeUpdate();
			if(count>0)
				return true;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}

	

	
}
