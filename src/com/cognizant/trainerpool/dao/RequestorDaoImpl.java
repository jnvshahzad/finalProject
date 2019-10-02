package com.cognizant.trainerpool.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cognizant.trainerpool.constants.QueryConstants;
import com.cognizant.trainerpool.model.Request;
import com.cognizant.trainerpool.model.Requestor;
import com.cognizant.trainerpool.util.DBUtil;
import com.cognizant.trainerpool.util.DateUtil;

public class RequestorDaoImpl implements RequestorDao {

	@Override
	public boolean checkRequestor(int userId) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement checkRequestor = (PreparedStatement) connection
					.prepareStatement(QueryConstants.COUNT_USER);
			checkRequestor.setInt(1, userId);
			checkRequestor.setInt(2, 100004);

			int count = checkRequestor.executeUpdate();

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

	@Override
	public boolean addRequestor(Requestor requestor) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement statement = (PreparedStatement) connection
					.prepareStatement(QueryConstants.INSERT_USER);
			statement.setString(1, requestor.getUserRequestor().getUserFirstName());
			statement.setString(2, requestor.getUserRequestor().getUserLastName());
			statement.setInt(3, requestor.getUserRequestor().getAge());
			statement.setString(4, requestor.getUserRequestor().getGender());
			statement.setLong(5, requestor.getUserRequestor().getContactNumber());
			statement.setString(6, requestor.getUserRequestor().getAddress());
			statement.setInt(7, requestor.getUserRequestor().getUserId());
			statement.setString(8, requestor.getUserRequestor().getPassword());
			statement.setInt(9, 100004);

			int count = statement.executeUpdate();

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

	@Override
	public boolean createNewRequest(Request request) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement createRequest = connection
					.prepareStatement(QueryConstants.INSERT_REQUEST);
			createRequest.setInt(1, request.getRequestorId());
			createRequest.setString(2, request.getRequestSubject());
			createRequest.setDate(3, DateUtil.convertToDate((Date) request.getStartDate()));
			createRequest.setDate(4, DateUtil.convertToDate((Date) request.getEndDate()));
			createRequest.setString(5, request.getCity());
			createRequest.setInt(6, request.getBatchSize());

			int count = createRequest.executeUpdate();

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

	@Override
	public List<Request> viewAllRequests() {
		Connection connection = DBUtil.getConnection();
		List<Request> requests = new ArrayList<Request>();
		PreparedStatement viewRequests = null;

		try {
			viewRequests = connection.prepareStatement(QueryConstants.SELECT_REQUESTS);
			ResultSet requestSet = viewRequests.executeQuery();

			while (requestSet.next()) {
				Request request = new Request();
				request.setRequestSubject(requestSet.getString(1));
				request.setStartDate(requestSet.getDate(2));
				request.setEndDate(requestSet.getDate(3));
				request.setCity(requestSet.getString(4));
				request.setBatchSize(requestSet.getInt(5));
				request.setRequestStatus(requestSet.getString(6));
				request.setRequestId(requestSet.getInt(7));

				requests.add(request);
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
		return requests;
	}

	@Override
	public boolean deleteRequest(int requestId, int userId) {
		Connection connection = DBUtil.getConnection();

		try {
			PreparedStatement deleteRequest = connection
					.prepareStatement(QueryConstants.DELETE_REQUEST);
			deleteRequest.setInt(1, requestId);
			deleteRequest.setInt(2, userId);

			int count = deleteRequest.executeUpdate();

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
