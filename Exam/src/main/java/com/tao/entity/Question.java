package com.tao.entity;

public class Question {

	private int question_id;
	private String question_name;
	private int question_type;
	private String question_option;
	private String question_correct;
	private String question_prompt;
	private int info_id;
	private int packet_id;
	private int media_id;
	
	private String packet_name;
	
	public Question() {
		super();
	}

	public Question(int question_id, String question_name, int question_type, String question_option,
			String question_correct, String question_prompt, int info_id, int packet_id, int media_id,
			String packet_name) {
		super();
		this.question_id = question_id;
		this.question_name = question_name;
		this.question_type = question_type;
		this.question_option = question_option;
		this.question_correct = question_correct;
		this.question_prompt = question_prompt;
		this.info_id = info_id;
		this.packet_id = packet_id;
		this.media_id = media_id;
		this.packet_name = packet_name;
	}

	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", question_name=" + question_name + ", question_type="
				+ question_type + ", question_option=" + question_option + ", question_correct=" + question_correct
				+ ", question_prompt=" + question_prompt + ", info_id=" + info_id + ", packet_id=" + packet_id
				+ ", media_id=" + media_id + ", packet_name=" + packet_name + "]";
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getQuestion_name() {
		return question_name;
	}

	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}

	public int getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}

	public String getQuestion_option() {
		return question_option;
	}

	public void setQuestion_option(String question_option) {
		this.question_option = question_option;
	}

	public String getQuestion_correct() {
		return question_correct;
	}

	public void setQuestion_correct(String question_correct) {
		this.question_correct = question_correct;
	}

	public String getQuestion_prompt() {
		return question_prompt;
	}

	public void setQuestion_prompt(String question_prompt) {
		this.question_prompt = question_prompt;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public int getPacket_id() {
		return packet_id;
	}

	public void setPacket_id(int packet_id) {
		this.packet_id = packet_id;
	}

	public int getMedia_id() {
		return media_id;
	}

	public void setMedia_id(int media_id) {
		this.media_id = media_id;
	}

	public String getPacket_name() {
		return packet_name;
	}

	public void setPacket_name(String packet_name) {
		this.packet_name = packet_name;
	}

}
