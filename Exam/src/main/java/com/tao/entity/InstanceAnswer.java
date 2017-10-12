package com.tao.entity;

public class InstanceAnswer {

	private int answer_id;
	private String answer_student;
	private int score;
	private int answer_prompt;
	private int packet_id;
	private int info_id;
	private String token;
	private int clazz_id;
	
	
/*	private String plan_name;
	private String info_name;
	private String */
	
	public InstanceAnswer() {
		super();
	}

	public InstanceAnswer(int answer_id, String answer_student, int score, int answer_prompt, int packet_id,
			int info_id, String token, int clazz_id) {
		super();
		this.answer_id = answer_id;
		this.answer_student = answer_student;
		this.score = score;
		this.answer_prompt = answer_prompt;
		this.packet_id = packet_id;
		this.info_id = info_id;
		this.token = token;
		this.clazz_id = clazz_id;
	}

	@Override
	public String toString() {
		return "InstanceAnswer [answer_id=" + answer_id + ", answer_student=" + answer_student + ", score=" + score
				+ ", answer_prompt=" + answer_prompt + ", packet_id=" + packet_id + ", info_id=" + info_id + ", token="
				+ token + ", clazz_id=" + clazz_id + "]";
	}

	public int getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}

	public String getAnswer_student() {
		return answer_student;
	}

	public void setAnswer_student(String answer_student) {
		this.answer_student = answer_student;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getAnswer_prompt() {
		return answer_prompt;
	}

	public void setAnswer_prompt(int answer_prompt) {
		this.answer_prompt = answer_prompt;
	}

	public int getPacket_id() {
		return packet_id;
	}

	public void setPacket_id(int packet_id) {
		this.packet_id = packet_id;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getClazz_id() {
		return clazz_id;
	}

	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	
}
