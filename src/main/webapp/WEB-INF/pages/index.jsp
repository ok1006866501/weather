<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>天气</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <style type="text/css">
  	#addFollow{
  		text-decoration:none;
  		color:#D0DCFC;
  	}
  	#addFollow:hover {
		color:white;
	}
	input::-webkit-input-placeholder{
		color:#DAE2FD;
	}
	#ulWeather li{
			float:left;
	}
  </style>
  <script type="text/javascript">
  		function editIocSpan(faArrowCircleA){
  			$(faArrowCircleA).css("color","blue");
  		}
  		function editIocSpan2(faArrowCircleA){
  			$(faArrowCircleA).css("color","black");
  		}
  		function div15daysSytle(div15Day){
  			$(div15Day).css("background-color","#EEF0F6");
  		}
  		function div15daysSytle2(div15Day){
  			$(div15Day).css("background-color","#F8FAFF");
  		}
  		
  		function switchLife(tag){//生活指数切换
  			var $dressingDiv = $("#dressingDiv");//穿衣
  			var $goFishingDiv = $("#goFishingDiv");//钓鱼
  			var $umbrellaDiv = $("#umbrellaDiv");//雨伞
  			var $tourismDiv = $("#tourismDiv");//旅游
  			var $coldDiv = $("#coldDiv");//感冒
  			var $trafficDiv = $("#trafficDiv");//交通
  			var $carWashDiv = $("#carWashDiv");//洗车
  			var $atmosphereDiv = $("#atmosphereDiv");//空气
  			var $motionDiv = $("#motionDiv");//运动
  			var $comfortableDiv = $("#comfortableDiv");//舒适
  			var $sunscreenDiv = $("#sunscreenDiv");//防晒
  			var $airingDiv = $("#airingDiv");//晾晒
  			if(tag == 0){//向左边滑动
  				$dressingDiv.animate({left: '23px'}, "slow");//穿衣
  	  			$goFishingDiv.animate({left: '420px'}, "slow");//钓鱼
  	  			$umbrellaDiv.animate({left: '46px'}, "slow");//雨伞
  	  			$tourismDiv.animate({left: '395px'}, "slow");//旅游
  	  			$coldDiv.animate({left: '23px'}, "slow");//感冒
  	  			$trafficDiv.animate({left: '420px'}, "slow");//交通
  	  			$carWashDiv.animate({left: '46px'}, "slow");//洗车
  	  			$atmosphereDiv.animate({left: '395px'}, "slow");//空气
  	  			$motionDiv.animate({left: '23px'}, "slow");//运动
  	  			$comfortableDiv.animate({left: '420px'}, "slow");//舒适
  	  			$sunscreenDiv.animate({left: '46px'}, "slow");//防晒
  	  			$airingDiv.animate({left: '395px'}, "slow");//晾晒
  			}else if(tag == 1){//向右边滑动
  				$dressingDiv.animate({left: '-569px'}, "slow");//穿衣
  	  			$goFishingDiv.animate({left: '-420px'}, "slow");//钓鱼
  	  			$umbrellaDiv.animate({left: '-592px'}, "slow");//雨伞
  	  			$tourismDiv.animate({left: '-395px'}, "slow");//旅游
  	  			$coldDiv.animate({left: '-569px'}, "slow");//感冒
  	  			$trafficDiv.animate({left: '-420px'}, "slow");//交通
  	  			$carWashDiv.animate({left: '-592px'}, "slow");//洗车
  	  			$atmosphereDiv.animate({left: '-395px'}, "slow");//空气
  	  			$motionDiv.animate({left: '-569px'}, "slow");//运动
  	  			$comfortableDiv.animate({left: '-420px'}, "slow");//舒适
  	  			$sunscreenDiv.animate({left: '-592px'}, "slow");//防晒
  	  			$airingDiv.animate({left: '-395px'}, "slow");//晾晒
  			}
  			return false;
  		}
  		
  		
  		function see(divChildrean){
  			var $one = $("#"+divChildrean+"One");
  			var $two = $("#"+divChildrean+"Two");
  			$one.animate({top:"-200px"},400);
  			$two.animate({top:"-160px"},400);
  		}
  		
  		function see2(divChildrean){
  			var $one = $("#"+divChildrean+"One");
  			var $two = $("#"+divChildrean+"Two");
  			$one.animate({top:"0px"},400);
  			$two.animate({top:"60px"},400);
  		}
  		
  		function cityBackgorundColor(colorA){
  			$(colorA).css("background","#EBEBF0");
  		}
  		
		function cityBackgorundColor2(colorA){
			$(colorA).css("background","white");
  		}
		
		function obtain(){
			$("#locationDiv").css("display","");	
		}
		
		var current;
		var currentCode;
 	
		function lose(){
			window.setTimeout(function(){
				$("#queryInput")[0].value = "";
				$("#locationDiv").css("display","none");
				var $locationDiv = $("#locationDiv");
				$locationDiv.empty();
				$locationDiv.css("height","340px");
				$locationDiv.append("<table  style='text-align:right;' ><tr style='height:37px;' ><td style='width:75px;' ><font style='color:#999BAF;font-size:10px;position:relative;top:13px;' >当前定位</font></td><td style='width:75px;' ></td><td style='width:75px;' ></td><td style='width:75px;' ></td></tr><tr style='height:37px;' ><td style='width:75px;' ><a href='javascript:switchCity("+currentCode+");' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;position:relative;top:3px;' >"+current+"</a></td><td style='width:75px;' ></td><td style='width:75px;' ></td><td style='width:75px;' ></td></tr><tr style='height:26px;' ><td style='width:75px;' ></td><td style='width:75px;' ></td><td style='width:75px;' ></td><td style='width:75px;' ></td></tr><tr style='height:20px;' ><td style='width:75px;' ><font style='color:#999BAF;font-size:10px;position:relative;' >热门城市</font></td><td style='width:75px;' ></td><td style='width:75px;' ></td><td style='width:75px;' ></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101010100);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >北京</a></td><td style='width:75px;' ><a href='javascript:switchCity(101020100);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >上海</a></td><td style='width:75px;' ><a href='javascript:switchCity(101280101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >广州</a></td><td style='width:75px;' ><a href='javascript:switchCity(101280601);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >深圳</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101030100);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >天津</a></td><td style='width:75px;' ><a href='javascript:switchCity(101110101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >西安</a></td><td style='width:75px;' ><a href='javascript:switchCity(101200101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >武汉</a></td><td style='width:75px;' ><a href='javascript:switchCity(101270101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >成都</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101090101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >石家庄</a></td><td style='width:75px;' ><a href='javascript:switchCity(101180101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >郑州</a></td><td style='width:75px;' ><a href='javascript:switchCity(101050101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >哈尔滨</a></td><td style='width:75px;' ><a href='javascript:switchCity(101100101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >太原</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;text-align:right;' ><a href='javascript:switchCity(101130101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >乌鲁木齐</a></td><td style='width:75px;' ><a href='javascript:switchCity(101120101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >济南</a></td><td style='width:75px;' ><a href='javascript:switchCity(101230101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >福州</a></td><td style='width:75px;' ><a href='javascript:switchCity(101140201);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >日喀则</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101230201);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >厦门</a></td><td style='width:75px;' ><a href='javascript:switchCity(101120201);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >青岛</a></td><td style='width:75px;' ><a href='javascript:switchCity(101190601);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >扬州</a></td><td style='width:75px;' ><a href='javascript:switchCity(101220101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >合肥</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101040100);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >重庆</a></td><td style='width:75px;' ><a href='javascript:switchCity(101240101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >南昌</a></td><td style='width:75px;' ><a href='javascript:switchCity(101090501);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >唐山</a></td><td style='width:75px;' ><a href='javascript:switchCity(101210101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >杭州</a></td></tr><tr style='height:30px;text-align:center;' ><td style='width:75px;' ><a href='javascript:switchCity(101090901);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >邢台</a></td><td style='width:75px;' ><a href='javascript:switchCity(101070101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >沈阳</a></td><td style='width:75px;' ><a href='javascript:switchCity(101091001);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >邯郸</a></td><td style='width:75px;' ><a href='javascript:switchCity(101290101);' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;' >昆明</a></td></tr></table>");
			},200);
		}
		
		function switchCity(cityCode){
			$("#queryInput")[0].value = "";
			$.post("${pageContext.request.contextPath}/switcity",{cityCode:cityCode},function(weather){
				//城市显示 
			  	var cityShowDiv = $("#cityShowDiv");
			  	var as = $("#cityShowDiv > a");
			  	var cityName = weather.cityInfo.city;//城市
			  	var cityCodeTemp = weather.cityInfo.citykey;
			  	var parentCityName = weather.cityInfo.parent;//cityShowDiv > width:600px;left:850px	原来
			  	if(cityName === (parentCityName + "市")){//cityShowDiv > width:500px;left:930px;
			  		cityShowDiv.css("left","930px");
			  		cityShowDiv.css("width","500px");
			  		$(as[1]).html(parentCityName+"&nbsp;&nbsp;")//广东省&nbsp;广州市&nbsp;&nbsp;
			  	}else{
			  		cityShowDiv.css("left","850px");
			  		cityShowDiv.css("width","600px");
			  		$(as[1]).html(parentCityName+"省&nbsp;"+cityName+"&nbsp;&nbsp;");
			  	}
			  	
			  	//当天天气显示以及图片
			  	var cityPhoto = weather.weatherPhoto;
			  	var mess = weather.data.ganmao;//消息
			  	var mess2 = weather.data.forecast[0].notice;//消息
			  	var wind = weather.data.forecast[0].fx;//风向
			  	var windGrade = weather.data.forecast[0].fl;//风向等级
			  	var pm25 = weather.data.pm25;//pm25
			  	var pm10 = weather.data.pm10;//pm10
			  	pm10 = Math.ceil(Number(pm10));
			  	var humidity = weather.data.shidu;//湿度
			  	var quality = weather.data.quality;//空气质量
			  	var weatherType = weather.data.forecast[0].type;//天气
			  	var time = weather.time;//时间
			  	var temperature = weather.data.wendu;//温度
			  	var divs = $("#weatherShowDiv > div");
			  	$(divs[0]).html("中央气象台 "+time.split(" ")[1].split(":")[0]+":"+time.split(" ")[1].split(":")[1]+"发布");//发布时间
			  	$(divs[1]).html(temperature+"°");//温度
			  	if(weatherType.length == 5){//天气
			  		$(divs[2]).html(weatherType);
			  	  	$(divs[3]).css("left","390px");
			  	}else if(weatherType.length == 4){
			  		$(divs[2]).html(weatherType);
			  	  	$(divs[3]).css("left","370px");
			  	}else if(weatherType.length == 3){
			  		$(divs[2]).html(weatherType);
			  	  	$(divs[3]).css("left","340px");
			  	}else if(weatherType.length == 2){
			  		$(divs[2]).html(weatherType);
			  	  	$(divs[3]).css("left","300px");
			  	}else if(weatherType.length == 1){
			  		$(divs[2]).html(weatherType);
			  	  	$(divs[3]).css("left","270px");
			  	}else{
			  		$(divs[2]).html(weather);
			  	  	$(divs[3]).css("left","410px");
			  	}
			  	var airQuality = pm10 + " " + quality;//空气质量	
			  	if(airQuality.length > 5){
			  		$(divs[3]).children().children().css("width","120px");//
			  	  	$(divs[3]).children().children().html(airQuality);//
			  	}else{
			  		$(divs[3]).children().children().css("width","80px");
			  	  	$(divs[3]).children().children().html(airQuality);
			  	}
			  	var $airQualityDivs = $("#airQualityDiv > div");//隐藏的空气污染指数div
			  	$($airQualityDivs[0]).html("空气质量指数&nbsp;"+airQuality);
			  	var $table = $($airQualityDivs[1]).find("table");
			  	var trs = $table[0].rows;
			  	var tds = trs[0].cells;
			  	var tds1 = trs[1].cells;
			  	$(tds[0]).html(pm25+"</br><span style='color:#9F9F9F;font-size:15px;' >PM2.5</span>");
			  	$(tds[1]).html(pm10+"</br><span style='color:#9F9F9F;font-size:15px;' >PM10</span>");
			  	$(tds[2]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >SO2</span>");
			  	$(tds1[0]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >NO2</span>");
			  	$(tds1[1]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >O3</span>");
			  	$(tds1[2]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >CO</span>");
			  	if(quality === "良"){
			  		$(divs[3]).children().children().css("backgorund-color","#F0CC35");
			  		$($airQualityDivs[0]).css("background-color","#F0CC35");
			  	}else if(quality === "优"){
			  		$(divs[3]).children().children().css("background","#A3D765");
			  		$($airQualityDivs[0]).css("background","#A3D765");
			  	}else{
			  		$(divs[3]).children().children().css("background","#EF8C6B");
			  		$($airQualityDivs[0]).css("background","#EF8C6B");
			  	}
			  	var $airQualityDiv = $("#airQualityDiv");//onmouseleave
			  	$(divs[3]).children().children().mouseenter(function(){
			  		$airQualityDiv.css("display","");
			  	}).mouseout(function(){
			  		$airQualityDiv.css("display","none");
			  	});
			  	if(wind.length > 3){
			  		wind = wind.split("")[0] + wind.split("")[1] + wind.split("")[2];
			  	}
			  	var windAndGrade = wind +"&nbsp;"+ windGrade.split("")[1] +"级";
			  	$(divs[4]).find("span").html(windAndGrade);
			  	var humidityInfo = "湿度&nbsp;" + humidity;
			  	$(divs[5]).find("span").html(humidityInfo);//湿度
			  	$(divs[6]).find("span").html("气压&nbsp;暂无数据");//气压
			  	$(divs[7]).find("span").html(mess2+"~&nbsp;&nbsp;");
			  	var tag = true;
			  	$(divs[7]).find("a").click(function(){
			  		if(tag){
			  			tag = false;
			  			$(divs[7]).find("span").html(mess+"~&nbsp;&nbsp;");
			  		}else{
			  			tag = true;
			  			$(divs[7]).find("span").html(mess2+"~&nbsp;&nbsp;");
			  		}
			  		return false;
			  	});
			  	$("#weatherPhotoShowDiv").find("img")[0].src = cityPhoto;//天气大图片
			  	
			  	var $tableAweekWeatherDiv0 = $("#aweekWeatherDiv > table")//一周天气
			    //昨天
			  	var aweekTime0 = weather.data.yesterday.ymd.split("-")[1] + "月" + weather.data.yesterday.ymd.split("-")[2] + "日";//日期
			  	var aweekType0 = weather.data.yesterday.type;//天气
			  	var aweekPhoto0 = weather.data.yesterday.photo;//天气照片
			  	var aweekHigh0 = weather.data.yesterday.high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow0 = weather.data.yesterday.low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind0 = weather.data.yesterday.fx;//风向
			  	if(aweekWind0.length > 3){
			  		aweekWind0 = aweekWind0.split("")[0] + aweekWind0.split("")[1] + aweekWind0.split("")[2];
			  	}
			  	var aweekGrade0 = weather.data.yesterday.fl.split("")[1] + weather.data.yesterday.fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds0 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv0 = $(tableAweekWeatherDivTds0[0]).find("div");
			  	var tableAweekWeatherDivTdsDivTable0 = tableAweekWeatherDivTdsDiv0.find("table");
			  	var left0 = "46px";
			  	if(aweekType0.length == 1){
			  		left0 = "46px";
			  	}else if(aweekType0.length == 2){
			  		left0 = "38px";
			  	}else if(aweekType0.length == 3){
			  		left0 = "28px";
			  	}else if(aweekType0.length == 4){
			  		left0 = "22px";
			  	}else if(aweekType0.length == 5){
			  		left0 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >昨天</span>");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime0+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left0+";' >"+aweekType0+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto0+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable0[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh0+"</span>");
			  	tableAweekWeatherDivTdsDivTable0[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable0[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable0[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow0+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto0+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left0+";' >"+aweekType0+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable0[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind0+"&nbsp;"+aweekGrade0+"</span>");
			    //今天
			  	var aweekTime1 = weather.data.forecast[0].ymd.split("-")[1] + "月" + weather.data.forecast[0].ymd.split("-")[2] + "日";//日期
			  	var aweekType1 = weather.data.forecast[0].type;//天气
			  	var aweekPhoto1 = weather.data.forecast[0].photo;//天气照片
			  	var aweekHigh1 = weather.data.forecast[0].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow1 = weather.data.forecast[0].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind1 = weather.data.forecast[0].fx;//风向
			  	if(aweekWind1.length > 3){
			  		aweekWind1 = aweekWind1.split("")[0] + aweekWind1.split("")[1] + aweekWind1.split("")[2];
			  	}
			  	var aweekGrade1 = weather.data.forecast[0].fl.split("")[1] + weather.data.forecast[0].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds1 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv1 = $(tableAweekWeatherDivTds1[1]).find("div");
			  	var tableAweekWeatherDivTdsDivTable1 = tableAweekWeatherDivTdsDiv1.find("table");
			  	var left1 = "46px";
			  	if(aweekType1.length == 1){
			  		left1 = "46px";
			  	}else if(aweekType1.length == 2){
			  		left1 = "38px";
			  	}else if(aweekType1.length == 3){
			  		left1 = "28px";
			  	}else if(aweekType1.length == 4){
			  		left1 = "22px";
			  	}else if(aweekType1.length == 5){
			  		left1 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >今天</span>");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime1+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left1+";' >"+aweekType1+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto1+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable1[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh1+"</span>");
			  	tableAweekWeatherDivTdsDivTable1[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable1[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable1[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow1+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto1+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left1+";' >"+aweekType1+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable1[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind1+"&nbsp;"+aweekGrade1+"</span>");
			  	 //明天
			  	var aweekTime2 = weather.data.forecast[1].ymd.split("-")[1] + "月" + weather.data.forecast[1].ymd.split("-")[2] + "日";//日期
			  	var aweekType2 = weather.data.forecast[1].type;//天气
			  	var aweekPhoto2 = weather.data.forecast[1].photo;//天气照片
			  	var aweekHigh2 = weather.data.forecast[1].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow2 = weather.data.forecast[1].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind2 = weather.data.forecast[1].fx;//风向
			  	if(aweekWind2.length > 3){
			  		aweekWind2 = aweekWind2.split("")[0] + aweekWind2.split("")[1] + aweekWind2.split("")[2];
			  	}
			  	var aweekGrade2 = weather.data.forecast[1].fl.split("")[1] + weather.data.forecast[1].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds2 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv2 = $(tableAweekWeatherDivTds2[2]).find("div");
			  	var tableAweekWeatherDivTdsDivTable2 = tableAweekWeatherDivTdsDiv2.find("table");
			  	var left2 = "46px";
			  	if(aweekType2.length == 1){
			  		left2 = "46px";
			  	}else if(aweekType2.length == 2){
			  		left2 = "38px";
			  	}else if(aweekType2.length == 3){
			  		left2 = "28px";
			  	}else if(aweekType2.length == 4){
			  		left2 = "22px";
			  	}else if(aweekType2.length == 5){
			  		left2 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >明天</span>");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime2+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left2+";' >"+aweekType2+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto2+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable2[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh2+"</span>");
			  	tableAweekWeatherDivTdsDivTable2[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable2[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable2[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow2+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto2+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left2+";' >"+aweekType2+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable2[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind2+"&nbsp;"+aweekGrade2+"</span>");
			  	 //后天
			  	var aweekTime3 = weather.data.forecast[2].ymd.split("-")[1] + "月" + weather.data.forecast[2].ymd.split("-")[2] + "日";//日期
			  	var aweekType3 = weather.data.forecast[2].type;//天气
			  	var aweekPhoto3 = weather.data.forecast[2].photo;//天气照片
			  	var aweekHigh3 = weather.data.forecast[2].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow3 = weather.data.forecast[2].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind3 = weather.data.forecast[2].fx;//风向
			  	if(aweekWind3.length > 3){
			  		aweekWind3 = aweekWind3.split("")[0] + aweekWind3.split("")[1] + aweekWind3.split("")[2];
			  	}
			  	var aweekGrade3 = weather.data.forecast[2].fl.split("")[1] + weather.data.forecast[2].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds3 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv3 = $(tableAweekWeatherDivTds3[3]).find("div");
			  	var tableAweekWeatherDivTdsDivTable3 = tableAweekWeatherDivTdsDiv3.find("table");
			  	var left3 = "46px";
			  	if(aweekType3.length == 1){
			  		left3 = "46px";
			  	}else if(aweekType3.length == 2){
			  		left3 = "38px";
			  	}else if(aweekType3.length == 3){
			  		left3 = "28px";
			  	}else if(aweekType3.length == 4){
			  		left3 = "22px";
			  	}else if(aweekType3.length == 5){
			  		left3 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >后天</span>");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime3+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left3+";' >"+aweekType3+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto3+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable3[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh3+"</span>");
			  	tableAweekWeatherDivTdsDivTable3[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable3[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable3[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow3+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto3+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left3+";' >"+aweekType3+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable3[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind3+"&nbsp;"+aweekGrade3+"</span>");
				 //后天 + 1
			  	var aweekTime4 = weather.data.forecast[3].ymd.split("-")[1] + "月" + weather.data.forecast[3].ymd.split("-")[2] + "日";//日期
			  	var aweekType4 = weather.data.forecast[3].type;//天气
			  	var aweekPhoto4 = weather.data.forecast[3].photo;//天气照片
			  	var aweekHigh4 = weather.data.forecast[3].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow4 = weather.data.forecast[3].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind4 = weather.data.forecast[3].fx;//风向
			  	if(aweekWind4.length > 3){
			  		aweekWind4 = aweekWind4.split("")[0] + aweekWind4.split("")[1] + aweekWind4.split("")[2];
			  	}
			  	var aweekGrade4 = weather.data.forecast[3].fl.split("")[1] + weather.data.forecast[3].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds4 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv4 = $(tableAweekWeatherDivTds4[4]).find("div");
			  	var tableAweekWeatherDivTdsDivTable4 = tableAweekWeatherDivTdsDiv4.find("table");
			  	var left4 = "46px";
			  	if(aweekType4.length == 1){
			  		left4 = "46px";
			  	}else if(aweekType4.length == 2){
			  		left4 = "38px";
			  	}else if(aweekType4.length == 3){
			  		left4 = "28px";
			  	}else if(aweekType4.length == 4){
			  		left4 = "22px";
			  	}else if(aweekType4.length == 5){
			  		left4 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+weather.data.forecast[3].week.split("")[2]+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime4+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left4+";' >"+aweekType4+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto4+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable4[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh4+"</span>");
			  	tableAweekWeatherDivTdsDivTable4[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable4[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable4[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow4+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto4+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left4+";' >"+aweekType4+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable4[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind4+"&nbsp;"+aweekGrade4+"</span>");
			  	 //后天 + 2
			  	var aweekTime5 = weather.data.forecast[4].ymd.split("-")[1] + "月" + weather.data.forecast[4].ymd.split("-")[2] + "日";//日期
			  	var aweekType5 = weather.data.forecast[4].type;//天气
			  	var aweekPhoto5 = weather.data.forecast[4].photo;//天气照片
			  	var aweekHigh5 = weather.data.forecast[4].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow5 = weather.data.forecast[4].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind5 = weather.data.forecast[4].fx;//风向
			  	if(aweekWind5.length > 3){
			  		aweekWind5 = aweekWind5.split("")[0] + aweekWind5.split("")[1] + aweekWind5.split("")[2];
			  	}
			  	var aweekGrade5 = weather.data.forecast[4].fl.split("")[1] + weather.data.forecast[4].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds5 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv5 = $(tableAweekWeatherDivTds5[5]).find("div");
			  	var tableAweekWeatherDivTdsDivTable5 = tableAweekWeatherDivTdsDiv5.find("table");
			  	var left5 = "46px";
			  	if(aweekType5.length == 1){
			  		left5 = "46px";
			  	}else if(aweekType5.length == 2){
			  		left5 = "38px";
			  	}else if(aweekType5.length == 3){
			  		left5 = "28px";
			  	}else if(aweekType5.length == 4){
			  		left5 = "22px";
			  	}else if(aweekType5.length == 5){
			  		left5 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+weather.data.forecast[4].week.split("")[2]+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime5+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left5+";' >"+aweekType5+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto5+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable5[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh5+"</span>");
			  	tableAweekWeatherDivTdsDivTable5[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable5[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable5[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow5+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto5+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left5+";' >"+aweekType5+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable5[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind5+"&nbsp;"+aweekGrade5+"</span>");
			  	 //后天 + 3
			  	var aweekTime6 = weather.data.forecast[5].ymd.split("-")[1] + "月" + weather.data.forecast[5].ymd.split("-")[2] + "日";//日期
			  	var aweekType6 = weather.data.forecast[5].type;//天气
			  	var aweekPhoto6 = weather.data.forecast[5].photo;//天气照片
			  	var aweekHigh6 = weather.data.forecast[5].high.split(" ")[1].split("℃")[0] + "°";//最高温
			  	var aweekLow6 = weather.data.forecast[5].low.split(" ")[1].split("℃")[0] + "°";//最低温
			  	var aweekWind6 = weather.data.forecast[5].fx;//风向
			  	if(aweekWind6.length > 3){
			  		aweekWind6 = aweekWind6.split("")[0] + aweekWind6.split("")[1] + aweekWind6.split("")[2];
			  	}
			  	var aweekGrade6 = weather.data.forecast[5].fl.split("")[1] + weather.data.forecast[5].fl.split("")[2];//风等级
			  	var tableAweekWeatherDivTds6 = $tableAweekWeatherDiv0[0].rows[0].cells;
			  	var tableAweekWeatherDivTdsDiv6 = $(tableAweekWeatherDivTds6[6]).find("div");
			  	var tableAweekWeatherDivTdsDivTable6 = tableAweekWeatherDivTdsDiv6.find("table");
			  	var left6 = "46px";
			  	if(aweekType6.length == 1){
			  		left6 = "46px";
			  	}else if(aweekType6.length == 2){
			  		left6 = "38px";
			  	}else if(aweekType6.length == 3){
			  		left6 = "28px";
			  	}else if(aweekType6.length == 4){
			  		left6 = "22px";
			  	}else if(aweekType6.length == 5){
			  		left6 = "18px";
			  	}
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+weather.data.forecast[5].week.split("")[2]+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime6+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left6+";' >"+aweekType6+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto6+"' height='45' width='45' />");
			  	tableAweekWeatherDivTdsDivTable6[0].rows[4].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh6+"</span>");
			  	tableAweekWeatherDivTdsDivTable6[0].rows[6].cells[0];
			  	tableAweekWeatherDivTdsDivTable6[0].rows[7].cells[0];
			  	tableAweekWeatherDivTdsDivTable6[0].rows[8].cells[0];
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow6+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto6+"' height='45' width='45' />");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left6+";' >"+aweekType6+"</span>");
			  	$(tableAweekWeatherDivTdsDivTable6[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind6+"&nbsp;"+aweekGrade6+"</span>");
			  	$($("#locationDiv > table")[0].rows[1].cells[0]).html("<a href='javascript:switchCity("+cityCodeTemp+");' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;position:relative;top:3px;' >"+cityName+"</a>");
			  	current = cityName;
			  	currentCode = cityCodeTemp;
			});
			return false;
		}
		
		function queryCityInfo(input){
			if(input.value === ""){
				return false;
			}
			var regex = /^[\u4e00-\u9fa5]+$/;
			if(regex.test(input.value)){
				var cityName = input.value;
				$.post("${pageContext.request.contextPath}/query",{cityName:cityName},function(area){
					if(area.length > 0){
						var $locationDiv = $("#locationDiv");
						$locationDiv.css("height","300px");
						$locationDiv.empty();
						$locationDiv.append("<select id='temp' onchange='javascript:switchCity(this.value)' style='height:300px;' multiple class='form-control'></select>");
						var $temp = $("#temp");
						var count = 0;
						for(var i = 0;i < area.length;i++){
							if(area[i].chilren == null || area[i].chilren.length < 1 || area[i].chilren == ""){
								$temp.append("<option value='"+area[i].weathercode+"' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;' >"+area[i].areaname+"</option>");
							}else{
								for(var j = 0;j < area[i].chilren.length;j++){
									$temp.append("<option value='"+area[i].chilren[j].weathercode+"' style='font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;' >"+area[i].areaname+","+area[i].chilren[j].areaname+"</option>");
								}	
							}
						}
					}
				});
			}
			
		}
		
  </script>
</head>
<body style="background-color:#F6F9FE;background-image:url('../images/background-up.jpg');background-repeat:no-repeat;" >
  <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
  <div style="width:100%;height:580px;" >
  	<div style="height:40px;width:160px;position:absolute;top:15px;left:80px;" >
  		<img src="../images/logo-c3cae1c3ef.png"/>
  	</div>
  	<div id="followCity" style="width:420px;height:125px;background-color:white;border-radius:8px;position:absolute;left:935px;top:60px;z-index:1;display:none;" >
  		
  	</div>
 	<div id="cityShowDiv" style="height:40px;width:600px;position:absolute;top:22px;left:850px;" >
 	 	<a href="javascript:void(0)" style="text-decoration:none;position:relative;bottom:4px;" >
 	 		<img src="../images/dingwei.png" height="36px;" />
 	 	</a>
 	 	<a href="javascript:void(0)" style="text-decoration:none;color:white;font-size:18px;" ></a>
 	 	<a id="addFollow" href="javascript:void(0)" >
 	 		[添加关注]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	 	</a>
 	 	<input type="text" id="queryInput" value="" onfocus="obtain();" onblur="lose();" onkeyup="queryCityInfo(this);" placeholder="搜索市、区、县等" style="font-size:16px;color:#DAE2FD;padding-left:10px;width:300px;height:35px;background-color:#859AF8;border:none;border-radius:30px;outline:none;" />
 	</div>
 	<div style="width:100%;height:0.8px;background-color:#8BBAFA;position:absolute;top:70px;" ></div>
 	<div id="locationDiv" style="height:340px;width:300px;background-color:white;border-radius:8px;position:absolute;left:1108px;top:63px;z-index:1;display:none;overflow:hidden;" >
 		<table  style="text-align:right;" >
 			<tr style="height:37px;" >
 				<td style="width:75px;" ><font style="color:#999BAF;font-size:10px;position:relative;top:13px;" >当前定位</font></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 			</tr>
 			<tr style="height:37px;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(0);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;position:relative;top:3px;" ></a>
 				</td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 			</tr>
 			<tr style="height:26px;" >
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 			</tr>
 			<tr style="height:20px;" >
 				<td style="width:75px;" ><font style="color:#999BAF;font-size:10px;position:relative;" >热门城市</font></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 				<td style="width:75px;" ></td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101010100);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					北京</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101020100);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					上海</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101280101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					广州</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101280601);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					深圳</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101030100);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					天津</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101110101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					西安</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101200101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					武汉</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101270101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					成都</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101090101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					石家庄</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101180101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					郑州</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101050101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					哈尔滨</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101100101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					太原</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;text-align:right;" >
 					<a href="javascript:switchCity(101130101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					乌鲁木齐</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101120101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					济南</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101230101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					福州</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101140201);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					日喀则</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101230201);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					厦门</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101120201);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					青岛</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101190601);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					扬州</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101220101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					合肥</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101040100);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					重庆</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101240101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					南昌</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101090501);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					唐山</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101210101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					杭州</a>
 				</td>
 			</tr>
 			<tr style="height:30px;text-align:center;" >
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101090901);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					邢台</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101070101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					沈阳</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101091001);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					邯郸</a>
 				</td>
 				<td style="width:75px;" >
 					<a href="javascript:switchCity(101290101);" onmouseenter="cityBackgorundColor(this);" onmouseleave="cityBackgorundColor2(this);" style="font-size:16px;text-decoration:none;color:#3B3B40;background-color:white;position:relative;top:3px;" >
 					昆明</a>
 				</td>
 			</tr>
 		</table>
 	</div>
 	<div id="weatherShowDiv" style="width:600px;height:350px;position:absolute;top:70px;left:30px;" >
 		<div style="width:160px;height:35px;font-size:16px;color:#C1DEFD;position:absolute;top:53px;left:52px;" ></div>
 		<div style="width:140;height:120px;font-size:100px;color:white;position:absolute;top:78px;left:57px;" ></div>
 		<div style="width:155px;height:50px;font-size:30px;color:white;position:absolute;top:150px;left:210px;" ></div>
 		<div style="width:80px;height:25px;text-align:center;line-height:25px;position:absolute;top:163px;left:300px;" ><a href="javascript:void(0);" style="text-decoration:none;color:white;" ><div style="width:80px;height:25px;background-color:#F0CC35;border-radius:10px;" ></div></a></div>
 		<div style="width:140px;height:40px;position:absolute;top:220px;left:50px;" ><img src="../images/jiantou.png" height="26px;" style="position:relative;bottom:2px;" />&nbsp;&nbsp;<span style="color:white;font-size:20px;" ></span></div>
 		<div style="width:140px;height:40px;position:absolute;top:220px;left:228px;" ><img src="../images/shuidi.png" height="26px;" style="position:relative;bottom:2px;" />&nbsp;&nbsp;<span style="color:white;font-size:20px;" ></span></div>
 		<div style="width:200px;height:40px;position:absolute;top:220px;left:378px;" ><img src="../images/qiya.png" height="28px;" style="position:relative;bottom:3px;" />&nbsp;&nbsp;<span style="color:white;font-size:20px;" ></span></div>
 		<div style="widt:500px;height:50px;position:relative;top:276px;left:8px;" ><ul style="font-size:23px;color:white;list-style:none;" ><li><img src="../images/dian.png" width="30" style="position:relative;bottom:3px;" />&nbsp;<span></span><a href="javascript:void(0)" ><img src="../images/zuoyou.png" /></a></li></ul></div>
 		<div id="airQualityDiv" style="width:280px;height:180px;border-radius:10px;position:absolute;top:200px;left:174px;overflow:hidden;display:none;" ><div style="height:45px;width:280px;background-color:#A3D765;text-align:center;line-height:45px;font-size:20px;color:white;" ></div><div style="height:135px;width:280px;background-color:white;" ><table style="text-align:center;border:1 solid black;" ><tr style="height:67.5px;" ><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ></td><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ></td></tr><tr style="height:67.5px;" ><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ></td><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ></td><td style="width:93px;font-size:20px;border-bottom:1px solid #999;border-right:1px solid #999;" ></td></tr></table></div></div></div>
 	<div id="weatherPhotoShowDiv" style="width:260px;height:260px;position:absolute;left:1150px;top:210px;" ><img src="" height="174" /></div>
  </div>
  <div style="width:100%;height:300px;" ><!-- box-shadow: 0 0 14px 0 rgba(0,0,0,.08); box-shadow: 0 0 11px #4E4E4E   -->
  	<div style="width:1333px;height:220px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;position:relative;top:28px;left:84px;overflow:hidden;" >
  		<div style="height:35px;width:300px;position:relative;top:21px;left:32px;float:left;" >
  			<span style="font-size:20px;" >
  				●&nbsp;&nbsp;逐小时预报&nbsp;&nbsp;
  			</span>
  			<a href="http://www.weather.com.cn/" target="_blank" style="text-decoration:none;" >
	  			<span style="font-size:10px;color:#8A9BAF;" >
	  				数据来源于中国天气网
	  			</span>
  			</a>
  		</div>
  		<div style="width:100px;height:35px;float:left;position:relative;top:21px;left:940px;" >
  			<a href="javascript:void(0)" onmouseover="editIocSpan(this);" onmouseout="editIocSpan2(this);" style="text-decoration:none;color:black;" >
  				<i class="fa fa-arrow-circle-left" style="font-size:25px;" ></i>
  			</a>&nbsp;
  			<a href="javascript:void(0)" onmouseover="editIocSpan(this);" onmouseout="editIocSpan2(this);" style="text-decoration:none;color:black;" >
  				<i class="fa fa-arrow-circle-right" style="font-size:25px;" ></i>
  			</a>
  		</div>
  		<div style="widht:1333px;height:145px;position:relative;top:50px;" ><!-- 110 -->
  			<ul id="ulWeather" style="list-style:none; height: 145px" >
  				<li style="position:absolute;left:40px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:150px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:260px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:370px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:480px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:590px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:700px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:810px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:920px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1030px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1140px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1250px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1360px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1470px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1580px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  				<li style="position:absolute;left:1690px;" >
  					<div style="height:140px;width:80px;" >
  						<span style="font-size:17px;color:#8A9BAF;position:relative;top:18px;" >15:00</span>
  						<img style="position:relative;top:34px;" src="../images/weather/duoyun.png" height="45" width="45" />
  						<span style="font-size:23px;position:relative;top:45px;left:3px;" >33°</span>
  					</div>
  				</li>
  			</ul>
  		</div>
  	</div>
  </div>
  <div style="width:100%;height:700px;" > 
  	<div style="width:822px;height:585px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;position:absolute;left:84px;float:left;" >
  		<div style="height:55px;width:100%" >
	  		<div style="height:35px;width:300px;position:relative;top:21px;left:32px;float:left;" >
	  			<span style="font-size:20px;" >
	  				●&nbsp;&nbsp;7日天气预报
	  			</span>
	  		</div>
	  		<div style="width:80px;height:25px;text-align:center;line-height:27px;position:absolute;top:20px;left:670px;" >
		  		<a href="javascript:void(0);" style="text-decoration:none;" >
		 			<div onmousemove="div15daysSytle(this);" onmouseout="div15daysSytle2(this);" style="width:115px;height:25px;font-size:12px;color:black;box-shadow: 0 0 1px #4E4E4E;background-color:#F8FAFF;border-radius:10px;float:left;" >
		 				15日天气预报
		 			</div>
		 		</a>
		 	</div>
	 	</div>
	 	<div id="aweekWeatherDiv" style="widht:760px;height:500px;" >
	 		<table style="widht:760px;height:500px;"  >
	 			<tr style="height:500px;" >
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;background-color:#F8FAFF;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 				<td style="width:118.5px;" >
	 					<div style="width:116px;height:520px;" >
	 						<table >
	 							<tr style="height:42px;" >
	 								<td style="width:115px;" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
		 							<td>
		 							</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td rowspan="2" >
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" ><td></td></tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:38px;" >
	 								<td>
	 								</td>
	 							</tr>
	 							<tr style="height:58px;" >
	 								<td>
	 								</td>
	 							</tr>
	 						</table>
	 					</div>
	 				</td>
	 			</tr>	 		
	 		</table>
	 	</div>
  	</div>
  	<div style="width:580px;height:585px;float:right;" >
  		<div style="height:35px;width:580px;" >
	  		<div style="height:35px;width:300px;position:relative;top:2px;left:32px;float:left;" >
	  			<span style="font-size:20px;" >
	  				●&nbsp;&nbsp;生活指数
	  			</span>
	  		</div>
	  		<div style="width:100px;height:35px;float:left;position:relative;top:2px;left:140px;" >
	  			<a href="javascript:switchLife(0);" onmouseover="editIocSpan(this);" onmouseout="editIocSpan2(this);" style="text-decoration:none;color:black;" >
	  				<i class="fa fa-arrow-circle-left" style="font-size:25px;" ></i>
	  			</a>&nbsp;
	  			<a href="javascript:switchLife(1);" onmouseover="editIocSpan(this);" onmouseout="editIocSpan2(this);" style="text-decoration:none;color:black;" >
	  				<i class="fa fa-arrow-circle-right" style="font-size:25px;" ></i>
	  			</a>
	  		</div>
  		</div>
  		<div style="width:510px;height:545px;overflow:hidden;" ><!-- overflow:hidden; -->
  			<table style="width:1280px;height:545px;" >
  				<tr style="height:181px;" >
  					<td style="width:250px;" >
  						<div id="dressingDiv" onmouseenter="see('dressingDiv');" onmouseleave="see2('dressingDiv');"  style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:23px;top:8px;overflow:hidden;" >
  							<div id="dressingDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/yifu.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >穿衣&nbsp;炎热</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="dressingDivTwo" style="height:160px;width:223px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:55px;" >
  											宜：</br>
											忌：
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="umbrellaDiv" onmouseenter="see('umbrellaDiv');" onmouseleave="see2('umbrellaDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:46px;top:8px;overflow:hidden;" >
  							<div id="umbrellaDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/yushan.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >雨伞&nbsp;带伞</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="umbrellaDivTwo" style="height:160px;width:223px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											有降水，如果您要短时间外出的话可不必带雨伞。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="goFishingDiv" onmouseenter="see('goFishingDiv');" onmouseleave="see2('goFishingDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:69px;top:8px;overflow:hidden;" >
  							<div id="goFishingDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/diaoyu.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >钓鱼&nbsp;不宜</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="goFishingDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:55px;" >
  											宜：</br>
											忌：
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="tourismDiv" onmouseenter="see('tourismDiv');" onmouseleave="see2('tourismDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:92px;top:8px;overflow:hidden;" >
  							<div id="tourismDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr  style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/lvyou.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >旅游&nbsp;一般</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="tourismDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											微风，感觉比较热，有降水，降雨期间请尽量不要外出，若外出，请注意防雷。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  					</td>
  				</tr>
  				<tr style="height:181px;" >
  					<td style="width:250px;" >
  						<div id="coldDiv" onmouseenter="see('coldDiv');" onmouseleave="see2('coldDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:23px;top:8px;overflow:hidden;" >
  							<div id="coldDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/yaopian.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >感冒&nbsp;少发</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="coldDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											各项气象条件适宜，发生感冒机率较低。但请避免长期处于空调房间中，以防感冒。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="carWashDiv" onmouseenter="see('carWashDiv');" onmouseleave="see2('carWashDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:46px;top:8px;overflow:hidden;" >
  							<div id="carWashDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/xiche.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >洗车&nbsp;不宜</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="carWashDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="trafficDiv" onmouseenter="see('trafficDiv');" onmouseleave="see2('trafficDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:69px;top:8px;overflow:hidden;" >
  							<div id="trafficDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/jiaotong.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >交通&nbsp;较好</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="trafficDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											有降水，路面潮湿，不适宜高速行驶，司机应更加集中注意力，保持车距，坚持中速或低速行驶。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="atmosphereDiv" onmouseenter="see('atmosphereDiv');" onmouseleave="see2('atmosphereDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:92px;top:8px;overflow:hidden;" >
  							<div id="atmosphereDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/kongqiwuran.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >空气污染扩散条件&nbsp;良</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="atmosphereDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											气象条件有利于空气污染物稀释、扩散和清除。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  					</td>
  				</tr>
  				<tr style="height:181px;" >
  					<td style="width:250px;" >
  						<div id="motionDiv" onmouseenter="see('motionDiv');" onmouseleave="see2('motionDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:23px;top:8px;overflow:hidden;" >
  							<div id="motionDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/yundong.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >运动&nbsp;较不宜</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="motionDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											有降水，推荐您在室内进行低强度运动；若坚持户外运动，请选择合适的运动，并携带雨具。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="sunscreenDiv" onmouseenter="see('sunscreenDiv');" onmouseleave="see2('sunscreenDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:46px;top:8px;overflow:hidden;" >
  							<div id="sunscreenDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/fangshai.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >防晒&nbsp;中等</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="sunscreenDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											属中等强度紫外辐射天气，外出时应注意防护，建议涂擦SPF指数高于15，PA+的防晒护肤品。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="comfortableDiv" onmouseenter="see('comfortableDiv');" onmouseleave="see2('comfortableDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:69px;top:8px;overflow:hidden;" >
  							<div id="comfortableDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/shushidu.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >舒适度&nbsp;较不舒适</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="comfortableDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											白天虽然有雨，但仍无法削弱较高气温带来的暑意，同时降雨造成湿度加大会您感到有些闷热，不很舒适。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  						<div id="airingDiv" onmouseenter="see('airingDiv');" onmouseleave="see2('airingDiv');" style="height:160px;width:223px;box-shadow: 0 0 14px 0 rgba(0,0,0,.08);border-radius:12px;background-color:white;float:left;position:relative;left:92px;top:8px;overflow:hidden;" >
  							<div id="airingDivOne" style="height:160px;width:223px;position:relative;top:1px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<img style="position:relative;top:15px;" src="../images/liangshai.png" />
  										</td>
  									</tr>
  									<tr style="height:80px;" >
  										<td style="width:223px;text-align:center;" >
  											<span style="font-size:18px;position:relative;bottom:20px;" >晾晒&nbsp;不宜</span>
  										</td>
  									</tr>
  								</table>
  							</div>
  							<div id="airingDivTwo" style="height:160px;width:223px;position:relative;top:10px;position:relative;top:10px;" >
  								<table>
  									<tr style="height:80px;" >
  										<td style="width:223px;font-size:16px;padding-left:20px;padding-top:50px;" >
  											有降水，不适宜晾晒。若需要晾晒，请在室内准备出充足的空间。
  										</td>
  									</tr>
  								</table>
  							</div>
  						</div>
  					</td>
  				</tr>
  			</table>
  		</div>
  	</div>
  </div>
  <div style="width:100%;height:160px;background-color:black;" >
  
  </div>
  <script type="text/javascript">
  
 	var current;
	var currentCode;
  	
  	//城市显示 
  	var cityShowDiv = $("#cityShowDiv");
  	var as = $("#cityShowDiv > a");
  	var cityName = "${requestScope.weather.cityInfo.city}";//城市
  	var cityCodeTemp = ${requestScope.weather.cityInfo.citykey};//城市
  	var parentCityName = "${requestScope.weather.cityInfo.parent}";//cityShowDiv > width:600px;left:850px	原来
  	if(cityName === (parentCityName + "市")){//cityShowDiv > width:500px;left:930px;
  		cityShowDiv.css("left","930px");
  		cityShowDiv.css("width","500px");
  		$(as[1]).html(parentCityName+"&nbsp;&nbsp;")//广东省&nbsp;广州市&nbsp;&nbsp;
  	}else{
  		cityShowDiv.css("left","850px");
  		cityShowDiv.css("width","600px");
  		$(as[1]).html(parentCityName+"省&nbsp;"+cityName+"&nbsp;&nbsp;");
  	}
  	
  	//当天天气显示以及图片
  	var cityPhoto = "${requestScope.weather.weatherPhoto}";
  	var mess = "${requestScope.weather.data.ganmao}";//消息
  	var mess2 = "${requestScope.weather.data.forecast[0].notice}";//消息
  	var wind = "${requestScope.weather.data.forecast[0].fx}";//风向
  	var windGrade = "${requestScope.weather.data.forecast[0].fl}";//风向等级
  	var pm25 = "${requestScope.weather.data.pm25}";//pm25
  	var pm10 = "${requestScope.weather.data.pm10}";//pm10
  	pm10 = Math.ceil(Number(pm10));
  	var humidity = "${requestScope.weather.data.shidu}";//湿度
  	var quality = "${requestScope.weather.data.quality}";//空气质量
  	var weather = "${requestScope.weather.data.forecast[0].type}";//天气
  	var time = "${requestScope.weather.time}";//时间
  	var temperature = "${requestScope.weather.data.wendu}";//温度
  	var divs = $("#weatherShowDiv > div");
  	$(divs[0]).html("中央气象台 "+time.split(" ")[1].split(":")[0]+":"+time.split(" ")[1].split(":")[1]+"发布");//发布时间
  	$(divs[1]).html(temperature+"°");//温度
  	if(weather.length == 5){//天气
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","390px");
  	}else if(weather.length == 4){
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","370px");
  	}else if(weather.length == 3){
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","340px");
  	}else if(weather.length == 2){
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","300px");
  	}else if(weather.length == 1){
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","270px");
  	}else{
  		$(divs[2]).html(weather);
  	  	$(divs[3]).css("left","410px");
  	}
  	var airQuality = pm10 + " " + quality;//空气质量	
  	if(airQuality.length > 5){
  		$(divs[3]).children().children().css("width","120px");//
  	  	$(divs[3]).children().children().html(airQuality);//
  	}else{
  		$(divs[3]).children().children().css("width","80px");
  	  	$(divs[3]).children().children().html(airQuality);
  	}
  	var $airQualityDivs = $("#airQualityDiv > div");//隐藏的空气污染指数div
  	$($airQualityDivs[0]).html("空气质量指数&nbsp;"+airQuality);
  	var $table = $($airQualityDivs[1]).find("table");
  	var trs = $table[0].rows;
  	var tds = trs[0].cells;
  	var tds1 = trs[1].cells;
  	$(tds[0]).html(pm25+"</br><span style='color:#9F9F9F;font-size:15px;' >PM2.5</span>");
  	$(tds[1]).html(pm10+"</br><span style='color:#9F9F9F;font-size:15px;' >PM10</span>");
  	$(tds[2]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >SO2</span>");
  	$(tds1[0]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >NO2</span>");
  	$(tds1[1]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >O3</span>");
  	$(tds1[2]).html("无</br><span style='color:#9F9F9F;font-size:15px;' >CO</span>");
  	if(quality === "良"){
  		$(divs[3]).children().children().css("backgorund-color","#F0CC35");
  		$($airQualityDivs[0]).css("background-color","#F0CC35");
  	}else if(quality === "优"){
  		$(divs[3]).children().children().css("background","#A3D765");
  		$($airQualityDivs[0]).css("background","#A3D765");
  	}else{
  		$(divs[3]).children().children().css("background","#EF8C6B");
  		$($airQualityDivs[0]).css("background","#EF8C6B");
  	}
  	var $airQualityDiv = $("#airQualityDiv");//onmouseleave
  	$(divs[3]).children().children().mouseenter(function(){
  		$airQualityDiv.css("display","");
  	}).mouseout(function(){
  		$airQualityDiv.css("display","none");
  	});
  	if(wind.length > 3){
  		wind = wind.split("")[0] + wind.split("")[1] + wind.split("")[2];
  	}
  	var windAndGrade = wind +"&nbsp;"+ windGrade.split("")[1] +"级";
  	$(divs[4]).find("span").html(windAndGrade);
  	var humidityInfo = "湿度&nbsp;" + humidity;
  	$(divs[5]).find("span").html(humidityInfo);//湿度
  	$(divs[6]).find("span").html("气压&nbsp;暂无数据");//气压
  	$(divs[7]).find("span").html(mess2+"~&nbsp;&nbsp;");
  	var tag = true;
  	$(divs[7]).find("a").click(function(){
  		if(tag){
  			tag = false;
  			$(divs[7]).find("span").html(mess+"~&nbsp;&nbsp;");
  		}else{
  			tag = true;
  			$(divs[7]).find("span").html(mess2+"~&nbsp;&nbsp;");
  		}
  		return false;
  	});
  	$("#weatherPhotoShowDiv").find("img")[0].src = cityPhoto;//天气大图片
  	
  	var $tableAweekWeatherDiv0 = $("#aweekWeatherDiv > table")//一周天气
    //昨天
  	var aweekTime0 = "${requestScope.weather.data.yesterday.ymd}".split("-")[1] + "月" + "${requestScope.weather.data.yesterday.ymd}".split("-")[2] + "日";//日期
  	var aweekType0 = "${requestScope.weather.data.yesterday.type}";//天气
  	var aweekPhoto0 = "${requestScope.weather.data.yesterday.photo}";//天气照片
  	var aweekHigh0 = "${requestScope.weather.data.yesterday.high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow0 = "${requestScope.weather.data.yesterday.low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind0 = "${requestScope.weather.data.yesterday.fx}";//风向
  	if(aweekWind0.length > 3){
  		aweekWind0 = aweekWind0.split("")[0] + aweekWind0.split("")[1] + aweekWind0.split("")[2];
  	}
  	var aweekGrade0 = "${requestScope.weather.data.yesterday.fl}".split("")[1] + "${requestScope.weather.data.yesterday.fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds0 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv0 = $(tableAweekWeatherDivTds0[0]).find("div");
  	var tableAweekWeatherDivTdsDivTable0 = tableAweekWeatherDivTdsDiv0.find("table");
  	var left0 = "46px";
  	if(aweekType0.length == 1){
  		left0 = "46px";
  	}else if(aweekType0.length == 2){
  		left0 = "38px";
  	}else if(aweekType0.length == 3){
  		left0 = "28px";
  	}else if(aweekType0.length == 4){
  		left0 = "22px";
  	}else if(aweekType0.length == 5){
  		left0 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >昨天</span>");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime0+"</span>");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left0+";' >"+aweekType0+"</span>");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto0+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable0[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh0+"</span>");
  	tableAweekWeatherDivTdsDivTable0[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable0[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable0[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow0+"</span>");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto0+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left0+";' >"+aweekType0+"</span>");
  	$(tableAweekWeatherDivTdsDivTable0[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind0+"&nbsp;"+aweekGrade0+"</span>");
    //今天
  	var aweekTime1 = "${requestScope.weather.data.forecast[0].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[0].ymd}".split("-")[2] + "日";//日期
  	var aweekType1 = "${requestScope.weather.data.forecast[0].type}";//天气
  	var aweekPhoto1 = "${requestScope.weather.data.forecast[0].photo}";//天气照片
  	var aweekHigh1 = "${requestScope.weather.data.forecast[0].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow1 = "${requestScope.weather.data.forecast[0].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind1 = "${requestScope.weather.data.forecast[0].fx}";//风向
  	if(aweekWind1.length > 3){
  		aweekWind1 = aweekWind1.split("")[0] + aweekWind1.split("")[1] + aweekWind1.split("")[2];
  	}
  	var aweekGrade1 = "${requestScope.weather.data.forecast[0].fl}".split("")[1] + "${requestScope.weather.data.forecast[0].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds1 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv1 = $(tableAweekWeatherDivTds1[1]).find("div");
  	var tableAweekWeatherDivTdsDivTable1 = tableAweekWeatherDivTdsDiv1.find("table");
  	var left1 = "46px";
  	if(aweekType1.length == 1){
  		left1 = "46px";
  	}else if(aweekType1.length == 2){
  		left1 = "38px";
  	}else if(aweekType1.length == 3){
  		left1 = "28px";
  	}else if(aweekType1.length == 4){
  		left1 = "22px";
  	}else if(aweekType1.length == 5){
  		left1 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >今天</span>");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime1+"</span>");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left1+";' >"+aweekType1+"</span>");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto1+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable1[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh1+"</span>");
  	tableAweekWeatherDivTdsDivTable1[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable1[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable1[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow1+"</span>");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto1+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left1+";' >"+aweekType1+"</span>");
  	$(tableAweekWeatherDivTdsDivTable1[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind1+"&nbsp;"+aweekGrade1+"</span>");
  	 //明天
  	var aweekTime2 = "${requestScope.weather.data.forecast[1].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[1].ymd}".split("-")[2] + "日";//日期
  	var aweekType2 = "${requestScope.weather.data.forecast[1].type}";//天气
  	var aweekPhoto2 = "${requestScope.weather.data.forecast[1].photo}";//天气照片
  	var aweekHigh2 = "${requestScope.weather.data.forecast[1].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow2 = "${requestScope.weather.data.forecast[1].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind2 = "${requestScope.weather.data.forecast[1].fx}";//风向
  	if(aweekWind2.length > 3){
  		aweekWind2 = aweekWind2.split("")[0] + aweekWind2.split("")[1] + aweekWind2.split("")[2];
  	}
  	var aweekGrade2 = "${requestScope.weather.data.forecast[1].fl}".split("")[1] + "${requestScope.weather.data.forecast[1].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds2 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv2 = $(tableAweekWeatherDivTds2[2]).find("div");
  	var tableAweekWeatherDivTdsDivTable2 = tableAweekWeatherDivTdsDiv2.find("table");
  	var left2 = "46px";
  	if(aweekType2.length == 1){
  		left2 = "46px";
  	}else if(aweekType2.length == 2){
  		left2 = "38px";
  	}else if(aweekType2.length == 3){
  		left2 = "28px";
  	}else if(aweekType2.length == 4){
  		left2 = "22px";
  	}else if(aweekType2.length == 5){
  		left2 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >明天</span>");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime2+"</span>");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left2+";' >"+aweekType2+"</span>");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto2+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable2[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh2+"</span>");
  	tableAweekWeatherDivTdsDivTable2[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable2[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable2[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow2+"</span>");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto2+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left2+";' >"+aweekType2+"</span>");
  	$(tableAweekWeatherDivTdsDivTable2[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind2+"&nbsp;"+aweekGrade2+"</span>");
  	 //后天
  	var aweekTime3 = "${requestScope.weather.data.forecast[2].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[2].ymd}".split("-")[2] + "日";//日期
  	var aweekType3 = "${requestScope.weather.data.forecast[2].type}";//天气
  	var aweekPhoto3 = "${requestScope.weather.data.forecast[2].photo}";//天气照片
  	var aweekHigh3 = "${requestScope.weather.data.forecast[2].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow3 = "${requestScope.weather.data.forecast[2].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind3 = "${requestScope.weather.data.forecast[2].fx}";//风向
  	if(aweekWind3.length > 3){
  		aweekWind3 = aweekWind3.split("")[0] + aweekWind3.split("")[1] + aweekWind3.split("")[2];
  	}
  	var aweekGrade3 = "${requestScope.weather.data.forecast[2].fl}".split("")[1] + "${requestScope.weather.data.forecast[2].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds3 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv3 = $(tableAweekWeatherDivTds3[3]).find("div");
  	var tableAweekWeatherDivTdsDivTable3 = tableAweekWeatherDivTdsDiv3.find("table");
  	var left3 = "46px";
  	if(aweekType3.length == 1){
  		left3 = "46px";
  	}else if(aweekType3.length == 2){
  		left3 = "38px";
  	}else if(aweekType3.length == 3){
  		left3 = "28px";
  	}else if(aweekType3.length == 4){
  		left3 = "22px";
  	}else if(aweekType3.length == 5){
  		left3 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >后天</span>");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime3+"</span>");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left3+";' >"+aweekType3+"</span>");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto3+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable3[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh3+"</span>");
  	tableAweekWeatherDivTdsDivTable3[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable3[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable3[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow3+"</span>");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto3+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left3+";' >"+aweekType3+"</span>");
  	$(tableAweekWeatherDivTdsDivTable3[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind3+"&nbsp;"+aweekGrade3+"</span>");
	 //后天 + 1
  	var aweekTime4 = "${requestScope.weather.data.forecast[3].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[3].ymd}".split("-")[2] + "日";//日期
  	var aweekType4 = "${requestScope.weather.data.forecast[3].type}";//天气
  	var aweekPhoto4 = "${requestScope.weather.data.forecast[3].photo}";//天气照片
  	var aweekHigh4 = "${requestScope.weather.data.forecast[3].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow4 = "${requestScope.weather.data.forecast[3].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind4 = "${requestScope.weather.data.forecast[3].fx}";//风向
  	if(aweekWind4.length > 3){
  		aweekWind4 = aweekWind4.split("")[0] + aweekWind4.split("")[1] + aweekWind4.split("")[2];
  	}
  	var aweekGrade4 = "${requestScope.weather.data.forecast[3].fl}".split("")[1] + "${requestScope.weather.data.forecast[3].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds4 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv4 = $(tableAweekWeatherDivTds4[4]).find("div");
  	var tableAweekWeatherDivTdsDivTable4 = tableAweekWeatherDivTdsDiv4.find("table");
  	var left4 = "46px";
  	if(aweekType4.length == 1){
  		left4 = "46px";
  	}else if(aweekType4.length == 2){
  		left4 = "38px";
  	}else if(aweekType4.length == 3){
  		left4 = "28px";
  	}else if(aweekType4.length == 4){
  		left4 = "22px";
  	}else if(aweekType4.length == 5){
  		left4 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+"${requestScope.weather.data.forecast[3].week}".split("")[2]+"</span>");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime4+"</span>");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left4+";' >"+aweekType4+"</span>");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto4+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable4[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh4+"</span>");
  	tableAweekWeatherDivTdsDivTable4[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable4[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable4[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow4+"</span>");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto4+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left4+";' >"+aweekType4+"</span>");
  	$(tableAweekWeatherDivTdsDivTable4[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind4+"&nbsp;"+aweekGrade4+"</span>");
  	 //后天 + 2
  	var aweekTime5 = "${requestScope.weather.data.forecast[4].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[4].ymd}".split("-")[2] + "日";//日期
  	var aweekType5 = "${requestScope.weather.data.forecast[4].type}";//天气
  	var aweekPhoto5 = "${requestScope.weather.data.forecast[4].photo}";//天气照片
  	var aweekHigh5 = "${requestScope.weather.data.forecast[4].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow5 = "${requestScope.weather.data.forecast[4].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind5 = "${requestScope.weather.data.forecast[4].fx}";//风向
  	if(aweekWind5.length > 3){
  		aweekWind5 = aweekWind5.split("")[0] + aweekWind5.split("")[1] + aweekWind5.split("")[2];
  	}
  	var aweekGrade5 = "${requestScope.weather.data.forecast[4].fl}".split("")[1] + "${requestScope.weather.data.forecast[4].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds5 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv5 = $(tableAweekWeatherDivTds5[5]).find("div");
  	var tableAweekWeatherDivTdsDivTable5 = tableAweekWeatherDivTdsDiv5.find("table");
  	var left5 = "46px";
  	if(aweekType5.length == 1){
  		left5 = "46px";
  	}else if(aweekType5.length == 2){
  		left5 = "38px";
  	}else if(aweekType5.length == 3){
  		left5 = "28px";
  	}else if(aweekType5.length == 4){
  		left5 = "22px";
  	}else if(aweekType5.length == 5){
  		left5 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+"${requestScope.weather.data.forecast[4].week}".split("")[2]+"</span>");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime5+"</span>");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left5+";' >"+aweekType5+"</span>");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto5+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable5[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh5+"</span>");
  	tableAweekWeatherDivTdsDivTable5[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable5[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable5[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow5+"</span>");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto5+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left5+";' >"+aweekType5+"</span>");
  	$(tableAweekWeatherDivTdsDivTable5[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind5+"&nbsp;"+aweekGrade5+"</span>");
  	 //后天 + 3
  	var aweekTime6 = "${requestScope.weather.data.forecast[5].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[5].ymd}".split("-")[2] + "日";//日期
  	var aweekType6 = "${requestScope.weather.data.forecast[5].type}";//天气
  	var aweekPhoto6 = "${requestScope.weather.data.forecast[5].photo}";//天气照片
  	var aweekHigh6 = "${requestScope.weather.data.forecast[5].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	var aweekLow6 = "${requestScope.weather.data.forecast[5].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	var aweekWind6 = "${requestScope.weather.data.forecast[5].fx}";//风向
  	if(aweekWind6.length > 3){
  		aweekWind6 = aweekWind6.split("")[0] + aweekWind6.split("")[1] + aweekWind6.split("")[2];
  	}
  	var aweekGrade6 = "${requestScope.weather.data.forecast[5].fl}".split("")[1] + "${requestScope.weather.data.forecast[5].fl}".split("")[2];//风等级
  	var tableAweekWeatherDivTds6 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	var tableAweekWeatherDivTdsDiv6 = $(tableAweekWeatherDivTds6[6]).find("div");
  	var tableAweekWeatherDivTdsDivTable6 = tableAweekWeatherDivTdsDiv6.find("table");
  	var left6 = "46px";
  	if(aweekType6.length == 1){
  		left6 = "46px";
  	}else if(aweekType6.length == 2){
  		left6 = "38px";
  	}else if(aweekType6.length == 3){
  		left6 = "28px";
  	}else if(aweekType6.length == 4){
  		left6 = "22px";
  	}else if(aweekType6.length == 5){
  		left6 = "18px";
  	}
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+"${requestScope.weather.data.forecast[5].week}".split("")[2]+"</span>");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime6+"</span>");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left6+";' >"+aweekType6+"</span>");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto6+"' height='45' width='45' />");
  	tableAweekWeatherDivTdsDivTable6[0].rows[4].cells[0];
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh6+"</span>");
  	tableAweekWeatherDivTdsDivTable6[0].rows[6].cells[0];
  	tableAweekWeatherDivTdsDivTable6[0].rows[7].cells[0];
  	tableAweekWeatherDivTdsDivTable6[0].rows[8].cells[0];
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow6+"</span>");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto6+"' height='45' width='45' />");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left6+";' >"+aweekType6+"</span>");
  	$(tableAweekWeatherDivTdsDivTable6[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind6+"&nbsp;"+aweekGrade6+"</span>");
	 //后天 + 4
  	//var aweekTime7 = "${requestScope.weather.data.forecast[6].ymd}".split("-")[1] + "月" + "${requestScope.weather.data.forecast[6].ymd}".split("-")[2] + "日";//日期
  	//var aweekType7 = "${requestScope.weather.data.forecast[6].type}";//天气
  	//var aweekPhoto7 = "${requestScope.weather.data.forecast[6].photo}";//天气照片
  	//var aweekHigh7 = "${requestScope.weather.data.forecast[6].high}".split(" ")[1].split("℃")[0] + "°";//最高温
  	//var aweekLow7 = "${requestScope.weather.data.forecast[6].low}".split(" ")[1].split("℃")[0] + "°";//最低温
  	//var aweekWind7 = "${requestScope.weather.data.forecast[6].fx}";//风向
  	//if(aweekWind7.length > 3){
  		//aweekWind7 = aweekWind7.split("")[0] + aweekWind7.split("")[1] + aweekWind7.split("")[2];
  	//}
  	//var aweekGrade7 = "${requestScope.weather.data.forecast[6].fl}".split("")[1] + "${requestScope.weather.data.forecast[6].fl}".split("")[2];//风等级
  	//var tableAweekWeatherDivTds7 = $tableAweekWeatherDiv0[0].rows[0].cells;
  	//var tableAweekWeatherDivTdsDiv7 = $(tableAweekWeatherDivTds7[7]).find("div");
  	//var tableAweekWeatherDivTdsDivTable7 = tableAweekWeatherDivTdsDiv7.find("table");
  	//var left7 = "46px";
  	//if(aweekType7.length == 1){
  		//left7 = "46px";
  	//}else if(aweekType7.length == 2){
  		//left7 = "38px";
  	//}else if(aweekType7.length == 3){
  		//left7 = "28px";
  	//}else if(aweekType7.length == 4){
  		//left7 = "22px";
  	//}else if(aweekType7.length == 5){
  		//left7 = "18px";
  	//}
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[0].cells[0]).html("<span style='font-size:16px;position:relative;top:13px;left:40px;color:#C2C2C2;' >周"+"${requestScope.weather.data.forecast[6].week}".split("")[2]+"</span>");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[1].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:2px;left:26px;' >"+aweekTime7+"</span>");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[2].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left7+";' >"+aweekType7+"</span>");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[3].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto7+"' height='45' width='45' />");
  	//tableAweekWeatherDivTdsDivTable7[0].rows[4].cells[0];
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[5].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;top:10px;left:41px;' >"+aweekHigh7+"</span>");
  	//tableAweekWeatherDivTdsDivTable7[0].rows[6].cells[0];
  	//tableAweekWeatherDivTdsDivTable7[0].rows[7].cells[0];
  	//tableAweekWeatherDivTdsDivTable7[0].rows[8].cells[0];
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[9].cells[0]).html("<span style='font-size:20px;color:#C2C2C2;position:relative;left:41px;bottom:5px;' >"+aweekLow7+"</span>");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[10].cells[0]).html("<img style='position:relative;top:6px;left:30px;' src='"+aweekPhoto7+"' height='45' width='45' />");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[11].cells[0]).html("<span style='font-size:16px;color:#C2C2C2;position:relative;top:10px;left:"+left7+";' >"+aweekType7+"</span>");
  	//$(tableAweekWeatherDivTdsDivTable7[0].rows[12].cells[0]).html("<span style='font-size:13px;color:#C2C2C2;position:relative;top:10px;left:26px;' >"+aweekWind7+"&nbsp;"+aweekGrade7+"</span>");
  	
  	//定位城市
  	$($("#locationDiv > table")[0].rows[1].cells[0]).html("<a href='javascript:switchCity("+cityCodeTemp+");' onmouseenter='cityBackgorundColor(this);' onmouseleave='cityBackgorundColor2(this);' style='font-size:16px;text-decoration:none;color:#3B3B40;position:relative;top:3px;' >"+cityName+"</a>");
  	current = cityName;
	currentCode = cityCodeTemp;
  </script>
</body>
</html>