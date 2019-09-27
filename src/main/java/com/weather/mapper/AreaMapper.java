package com.weather.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.weather.pojo.Area;

public interface AreaMapper {

	@Select("select * from area where parentid = #{0}")
	List<Area> selProvinceAndCity(Integer parentId);
	
}
