package com.weather.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.weather.mapper.AreaMapper;
import com.weather.pojo.Area;
import com.weather.pojo.Forecast;
import com.weather.pojo.Weather;
import com.weather.pojo.Yesterday;
import com.weather.service.WeatherService;
import com.weather.utils.HttpClientUtil;
import com.weather.utils.JsonUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class WeatherServiceImpl implements WeatherService {

	@Value("${city.weather.url}")
	private String url;
	@Value("${redis.city.info}")
	private String key;
	
	@Resource
	private JedisPool jedisPool;
	@Resource
	private AreaMapper areaMapper;
	
	@Override
	public Weather getWeatherInfo(String cityCode) {
		String value = HttpClientUtil.doGet(url+cityCode);
		if(value == null || value.equals("")) {
			return new Weather();
		}
		Weather weather = JsonUtils.jsonToPojo(value,Weather.class);
		addPhoto(weather.getData().getForecast().get(0),weather);
		for(Forecast forecast:weather.getData().getForecast()) {
			addForecastPhoto(forecast);
		}
		addYesterdayPhoto(weather.getData().getYesterday());
		return weather;
	}
	
	@Override
	public List<Area> queryCityInfo(String city) {
		Jedis jedis = jedisPool.getResource();	
		List<Area> list = JsonUtils.jsonToList(jedis.get(key),Area.class);
		List<Area> resultList = new ArrayList<>();
		for(Area area:list) {
			if(area.getAreaname().contains(city)) {
				resultList.add(area);
			}else {
				if(area.getChilren() != null && area.getChilren().size() > 0) {
					for(Area temp:area.getChilren()) {
						if(temp.getAreaname().contains(city)) {
							resultList.add(area);							
						}
					}	
				}
			}
		}
		
		jedis.close();
		return resultList;
	}
	
	
	private void addYesterdayPhoto(Yesterday esterday) {
		if(esterday.getType().equals("晴")) {
			esterday.setPhoto("../images/weather/qingDan.png");
		}else if(esterday.getType().equals("多云")) {
			esterday.setPhoto("../images/weather/duoyunDan.png");
		}else if(esterday.getType().equals("阵雨")) {
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else if(esterday.getType().equals("小雨")) {
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else if(esterday.getType().equals("阴")) {
			esterday.setPhoto("../images/weather/yintianDan.png");
		}else if(esterday.getType().equals("大雨")) {
			esterday.setPhoto("../images/weather/dayuDan.png");
		}else if(esterday.getType().equals("中雨")) {
			esterday.setPhoto("../images/weather/zhongyudaobaoyuDan.png");
		}else if(esterday.getType().equals("大雨转中雨")) {
			esterday.setPhoto("../images/weather/zhongyudaobaoyuDan.png");
		}else if(esterday.getType().equals("大雨到中雨")) {
			esterday.setPhoto("../images/weather/zhongyudaobaoyuDan.png");
		}else if(esterday.getType().equals("大雨转小雨")) {
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else if(esterday.getType().equals("大雨到小雨")) {
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else if(esterday.getType().equals("小雨转中雨")) {
			esterday.setPhoto("../images/weather/zhongyudaobaoyuDan.png");
		}else if(esterday.getType().equals("小雨转大雨")) {
			esterday.setPhoto("../images/weather/dayuDan.png");
		}else if(esterday.getType().equals("小雨到大雨")) {
			esterday.setPhoto("../images/weather/dayuDan.png");
		}else if(esterday.getType().equals("小雨到中雨")) {
			esterday.setPhoto("../images/weather/zhongyudaobaoyuDan.png");
		}else if(esterday.getType().equals("中雨转大雨")) {
			esterday.setPhoto("../images/weather/dayuDan.png");
		}else if(esterday.getType().equals("中雨到小雨")) {
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else if(esterday.getType().equals("雷阵雨")) {
			esterday.setPhoto("../images/weather/leizhenyuDan.png");
		}else if(esterday.getType().equals("暴雨")) {
			esterday.setPhoto("../images/weather/baoyuDan.png");
		}else if(esterday.getType().contains("暴")) {
			esterday.setPhoto("../images/weather/baoyuDan.png");
		}else if(esterday.getType().contains("雷")) {
			esterday.setPhoto("../images/weather/leizhenyuDan.png");
		}else if(esterday.getType().contains("霾")) {
			esterday.setPhoto("../images/weather/yintianDan.png");
		}else if(esterday.getType().contains("雨")){
			esterday.setPhoto("../images/weather/xiaoyuDan.png");
		}else {
			esterday.setPhoto("../images/weather/yintianDan.png");
		}
	}
	
	private void addForecastPhoto(Forecast forecast) {
		if(forecast.getType().equals("晴")) {
			forecast.setPhoto("../images/weather/qing.png");
		}else if(forecast.getType().equals("多云")) {
			forecast.setPhoto("../images/weather/duoyun.png");
		}else if(forecast.getType().equals("阵雨")) {
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("小雨")) {
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("阴")) {
			forecast.setPhoto("../images/weather/yintian.png");
		}else if(forecast.getType().equals("大雨")) {
			forecast.setPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("中雨")) {
			forecast.setPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨转中雨")) {
			forecast.setPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨到中雨")) {
			forecast.setPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨转小雨")) {
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("大雨到小雨")) {
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("小雨转中雨")) {
			forecast.setPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("小雨转大雨")) {
			forecast.setPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("小雨到大雨")) {
			forecast.setPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("小雨到中雨")) {
			forecast.setPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("中雨转大雨")) {
			forecast.setPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("中雨到小雨")) {
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("雷阵雨")) {
			forecast.setPhoto("../images/weather/leizhenyu.png");
		}else if(forecast.getType().equals("暴雨")) {
			forecast.setPhoto("../images/weather/baoyu.png");
		}else if(forecast.getType().contains("暴")) {
			forecast.setPhoto("../images/weather/baoyu.png");
		}else if(forecast.getType().contains("雷")) {
			forecast.setPhoto("../images/weather/leizhenyu.png");
		}else if(forecast.getType().contains("霾")) {
			forecast.setPhoto("../images/weather/yintian.png");
		}else if(forecast.getType().contains("雨")){
			forecast.setPhoto("../images/weather/xiaoyu.png");
		}else {
			forecast.setPhoto("../images/weather/yintian.png");
		}
	}
	
	private void addPhoto(Forecast forecast,Weather weather) {
		if(forecast.getType().equals("晴")) {
			weather.setWeatherPhoto("../images/weather/qing.png");
		}else if(forecast.getType().equals("多云")) {
			weather.setWeatherPhoto("../images/weather/duoyun.png");
		}else if(forecast.getType().equals("阵雨")) {
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("小雨")) {
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("阴")) {
			weather.setWeatherPhoto("../images/weather/yintian.png");
		}else if(forecast.getType().equals("大雨")) {
			weather.setWeatherPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("中雨")) {
			weather.setWeatherPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨转中雨")) {
			weather.setWeatherPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨到中雨")) {
			weather.setWeatherPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("大雨转小雨")) {
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("大雨到小雨")) {
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("小雨转中雨")) {
			weather.setWeatherPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("小雨转大雨")) {
			weather.setWeatherPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("小雨到大雨")) {
			weather.setWeatherPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("小雨到中雨")) {
			weather.setWeatherPhoto("../images/weather/zhongyudaobaoyu.png");
		}else if(forecast.getType().equals("中雨转大雨")) {
			weather.setWeatherPhoto("../images/weather/dayu.png");
		}else if(forecast.getType().equals("中雨到小雨")) {
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else if(forecast.getType().equals("雷阵雨")) {
			weather.setWeatherPhoto("../images/weather/leizhenyu.png");
		}else if(forecast.getType().equals("暴雨")) {
			weather.setWeatherPhoto("../images/weather/baoyu.png");
		}else if(forecast.getType().contains("暴")) {
			weather.setWeatherPhoto("../images/weather/baoyu.png");
		}else if(forecast.getType().contains("雷")) {
			weather.setWeatherPhoto("../images/weather/leizhenyu.png");
		}else if(forecast.getType().contains("霾")) {
			weather.setWeatherPhoto("../images/weather/yintian.png");
		}else if(forecast.getType().contains("雨")){
			weather.setWeatherPhoto("../images/weather/xiaoyu.png");
		}else {
			weather.setWeatherPhoto("../images/weather/yintian.png");
		}
	}


}
