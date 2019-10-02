package com.cognizant.trainerpool.model;

public class Skill {
	private int skillId;
	private int skillDuration;
	private String skillName;

	public Skill() {
		super();
	}

	public Skill(int skillDuration, String skillName) {
		super();
		this.skillDuration = skillDuration;
		this.skillName = skillName;
	}

	public Skill(int skillId, int skillDuration, String skillName) {
		super();
		this.skillId = skillId;
		this.skillDuration = skillDuration;
		this.skillName = skillName;
	}

	public int getSkillId() {
		return skillId;
	}

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}

	public int getSkillDuration() {
		return skillDuration;
	}

	public void setSkillDuration(int skillDuration) {
		this.skillDuration = skillDuration;
	}

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	@Override
	public String toString() {
		return "Skill [skillDuration=" + skillDuration + ", skillName=" + skillName + "]";
	}

}
