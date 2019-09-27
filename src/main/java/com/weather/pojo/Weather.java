package com.weather.pojo;

public class Weather {

	private String weatherPhoto;
	private String message;
	private String status;
	private String date;
	private String time;
	private City cityInfo;
	private Data data;
	
	
	
	
	public String getWeatherPhoto() {
		return weatherPhoto;
	}
	public void setWeatherPhoto(String weatherPhoto) {
		this.weatherPhoto = weatherPhoto;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public City getCityInfo() {
		return cityInfo;
	}
	public void setCityInfo(City cityInfo) {
		this.cityInfo = cityInfo;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "Weather [message=" + message + ", status=" + status + ", date=" + date + ", time=" + time
				+ ", cityInfo=" + cityInfo + ", data=" + data + "]";
	}

	
	
	
}
