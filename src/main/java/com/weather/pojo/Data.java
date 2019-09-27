package com.weather.pojo;

import java.util.List;

public class Data {

	private String shidu;
	private String pm25;
	private String pm10;
	private String quality;
	private String wendu;
	private String ganmao;
	private List<Forecast> forecast;
	private Yesterday yesterday;
	
	
	
	public Yesterday getYesterday() {
		return yesterday;
	}
	public void setYesterday(Yesterday yesterday) {
		this.yesterday = yesterday;
	}
	public String getShidu() {
		return shidu;
	}
	public void setShidu(String shidu) {
		this.shidu = shidu;
	}
	public String getPm25() {
		return pm25;
	}
	public void setPm25(String pm25) {
		this.pm25 = pm25;
	}
	public String getPm10() {
		return pm10;
	}
	public void setPm10(String pm10) {
		this.pm10 = pm10;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getWendu() {
		return wendu;
	}
	public void setWendu(String wendu) {
		this.wendu = wendu;
	}
	public String getGanmao() {
		return ganmao;
	}
	public void setGanmao(String ganmao) {
		this.ganmao = ganmao;
	}
	public List<Forecast> getForecast() {
		return forecast;
	}
	public void setForecast(List<Forecast> forecast) {
		this.forecast = forecast;
	}
	@Override
	public String toString() {
		return "Data [shidu=" + shidu + ", pm25=" + pm25 + ", pm10=" + pm10 + ", quality=" + quality + ", wendu="
				+ wendu + ", ganmao=" + ganmao + ", forecast=" + forecast + ", yesterday=" + yesterday + "]";
	}

	
	
}
