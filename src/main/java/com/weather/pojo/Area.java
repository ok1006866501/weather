package com.weather.pojo;

import java.util.List;

public class Area {

	private Integer areaid;
	private String areaname;
	private Integer parentid;
	private Integer arealevel;
	private Integer status;
	private String weathercode;
	private String imageurl;
	private List<Area> chilren;
	
	
	
	public List<Area> getChilren() {
		return chilren;
	}
	public void setChilren(List<Area> chilren) {
		this.chilren = chilren;
	}
	public Integer getAreaid() {
		return areaid;
	}
	public void setAreaid(Integer areaid) {
		this.areaid = areaid;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public Integer getArealevel() {
		return arealevel;
	}
	public void setArealevel(Integer arealevel) {
		this.arealevel = arealevel;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getWeathercode() {
		return weathercode;
	}
	public void setWeathercode(String weathercode) {
		this.weathercode = weathercode;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "Area [areaid=" + areaid + ", areaname=" + areaname + ", parentid=" + parentid + ", arealevel="
				+ arealevel + ", status=" + status + ", weathercode=" + weathercode + ", imageurl=" + imageurl
				+ ", chilren=" + chilren + "]";
	}
	
	
	
	
}
