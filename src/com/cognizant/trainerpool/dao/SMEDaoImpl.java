package com.cognizant.trainerpool.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cognizant.trainerpool.constants.QueryConstants;
import com.cognizant.trainerpool.model.Trainer;
import com.cognizant.trainerpool.util.DBUtil;

public class SMEDaoImpl implements SMEDao {
	@Override
	public boolean checkSME(int userId) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement checkSME = (PreparedStatement) connection
					.prepareStatement(QueryConstants.COUNT_USER);
			checkSME.setInt(1, userId);
			checkSME.setInt(2, 100002);

			int count = checkSME.executeUpdate();

			if (count > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean addSME(Trainer sme) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement statement = (PreparedStatement) connection
					.prepareStatement(QueryConstants.INSERT_USER);
			statement.setString(1, sme.getUserTrainer().getUserFirstName());
			statement.setString(2, sme.getUserTrainer().getUserLastName());
			statement.setInt(3, sme.getUserTrainer().getAge());
			statement.setString(4, sme.getUserTrainer().getGender());
			statement.setLong(5, sme.getUserTrainer().getContactNumber());
			statement.setString(6, sme.getUserTrainer().getAddress());
			statement.setInt(7, sme.getUserTrainer().getUserId());
			statement.setString(8, sme.getUserTrainer().getPassword());
			statement.setInt(9, 100002);

			int count = statement.executeUpdate();

			if (count > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean changePassword(int userId, String previousPassword, String newPassword) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement changePassword = connection
					.prepareStatement(QueryConstants.UPDATE_PASSWORD);
			changePassword.setString(1, newPassword);
			changePassword.setInt(2, userId);
			changePassword.setString(3, previousPassword);

			int count = changePassword.executeUpdate();

			if (count > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null)
					connection.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return false;
	}

}
