package com.weather.service;

import java.util.List;

import com.weather.pojo.Area;
import com.weather.pojo.Weather;

public interface WeatherService {


	Weather getWeatherInfo(String cityCode);

	List<Area> queryCityInfo(String city);
	
}
