package com.cognizant.trainerpool.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.trainerpool.constants.QueryConstants;
import com.cognizant.trainerpool.model.Skill;
import com.cognizant.trainerpool.util.DBUtil;

public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Skill> showSkills() {
		Connection connection = DBUtil.getConnection();
		PreparedStatement showSkills = null;
		ResultSet skills = null;
		List<Skill> skillsList = new ArrayList<Skill>();
		try {
			showSkills = connection.prepareStatement(QueryConstants.SHOW_SKILLS);
			skills = showSkills.executeQuery();

			while (skills.next()) {
				Skill skill = new Skill();
				skill.setSkillId(skills.getInt(1));
				skill.setSkillName(skills.getString(2));
				skill.setSkillDuration(skills.getInt(3));
				skillsList.add(skill);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return skillsList;

	}

}
