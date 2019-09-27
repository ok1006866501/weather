package com.weather.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weather.pojo.Area;
import com.weather.pojo.Weather;
import com.weather.service.WeatherService;

@Controller
public class WeatherController {

	@Resource
	private WeatherService weatherServiceImpl;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		request.setAttribute("weather",weatherServiceImpl.getWeatherInfo("101010100"));
		return "index";
	}
	
	@RequestMapping("query")
	@ResponseBody
	public List<Area> query(String cityName) {
		return weatherServiceImpl.queryCityInfo(cityName);
	}
	
	@RequestMapping("switcity")
	@ResponseBody
	public Weather index(String cityCode) {
		return weatherServiceImpl.getWeatherInfo(cityCode);
	}
	
}
