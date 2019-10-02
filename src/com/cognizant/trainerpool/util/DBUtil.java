package com.cognizant.trainerpool.util;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {
	public static Connection getConnection() {
		Connection connection = null;
		Properties property = new Properties();

		try {
			URL resource = DBUtil.class.getClassLoader().getResource("db.properties");
			File file = new File(resource.toURI());
			FileInputStream fileInput = new FileInputStream(file);
			property.load(fileInput);

			String driver = (String) property.get("driver");
			String connectionURL = (String) property.get("connection-url");
			String username = (String) property.get("user");
			String password = (String) property.get("password");

			Class.forName(driver);
			connection = DriverManager.getConnection(connectionURL, username, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return connection;
	}

	/*
	 * public static void main(String[] args) { System.out.println(getConnection());
	 * }
	 */

}
