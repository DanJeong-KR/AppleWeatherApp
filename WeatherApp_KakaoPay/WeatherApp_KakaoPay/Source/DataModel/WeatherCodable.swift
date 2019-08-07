//
//  CurrentWeather.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation



struct WeatherCodable: Decodable, CustomStringConvertible {
  
//  let weather: Weather
  
  var currently: Currently
  let hourly: [Hourly]
  let daily: [Daily]
  let subInfo: SubInfo
  
  struct Currently: Decodable {
    let time: Double
    let summary: String
    let icon: String
    let temperature: Double // 온도(화씨)
  }
  
  struct Hourly: Decodable {
    let time: Double
    let icon: String
    let temperature: Double // 온도(화씨)
  }

  struct Daily: Decodable {
    let time: Double
    let icon: String
    let temperatureMax: Double
    let temperatureMin: Double
  }
//
  struct SubInfo: Decodable {
    let sunriseTime: Double // 일출
    let sunsetTime: Double // 일몰
    let apparentTemperature: Double // 체감
    let precipProbability: Double // 강수확률
    let humidity: Double // 습도
    let windSpeed: Double // miles/s 풍속
    let precipIntensity: Double // mm 강수량
    let pressure: Double // hPa 기압
    let visibility: Double // km 가시거리
    let uvIndex: Double // 자외선지수
  }
  
  private enum CodingKeys: String, CodingKey {
    case currently, hourly, daily
  }
  
  
  private enum HourlyKeys: String, CodingKey {
    case data
  }



  private enum DailyKeys: String, CodingKey {
    case data
  }
//
  private enum DailyDataKeys: String, CodingKey {
    case sumriseTime, sunsetTime, apparentTemperature, precipProbability, humidity, windSpeed, precipIntensity, pressure, visibility, uvIndex
  }
//
  
  
  init(from decoder: Decoder) throws {
    
    // currently
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    // hourly
    let hourly = try container.nestedContainer(keyedBy: HourlyKeys.self, forKey: .hourly)
    
    // daily
    let daily = try container.nestedContainer(keyedBy: DailyKeys.self, forKey: .daily)
    var dailyData = try daily.nestedUnkeyedContainer(forKey: .data)
    let dailyArr = try dailyData.nestedContainer(keyedBy: DailyDataKeys.self)

    
    self.currently = try container.decode(Currently.self, forKey: .currently)
    self.hourly = try hourly.decode([Hourly].self, forKey: .data)
    self.daily = try daily.decode([Daily].self, forKey: .data)
    self.subInfo = SubInfo(sunriseTime: try dailyArr.decode(Double.self, forKey: .sumriseTime),
                           sunsetTime: try dailyArr.decode(Double.self, forKey: .sunsetTime),
                           apparentTemperature: try dailyArr.decode(Double.self, forKey: .apparentTemperature),
                           precipProbability: try dailyArr.decode(Double.self, forKey: .precipProbability),
                           humidity: try dailyArr.decode(Double.self, forKey: .humidity),
                           windSpeed: try dailyArr.decode(Double.self, forKey: .windSpeed),
                           precipIntensity: try dailyArr.decode(Double.self, forKey: .precipIntensity),
                           pressure: try dailyArr.decode(Double.self, forKey: .pressure),
                           visibility: try dailyArr.decode(Double.self, forKey: .visibility),
                           uvIndex: try dailyArr.decode(Double.self, forKey: .uvIndex))
//    self.subInfo = try dailyData.decode(SubInfo.self)
//    self.subInfo = try daily.decode([SubInfo].self, forKey: .data).first!
//    self.subInfo = SubInfo(sunriseTime: try dailyData.decode(Double.self),
//                           sunsetTime: try dailyData.decode(Double.self),
//                           apparentTemperature: try dailyData.decode(Double.self),
//                           precipProbability: try dailyData.decode(Double.self),
//                           humidity: try dailyData.decode(Double.self),
//                           windSpeed: try dailyData.decode(Double.self),
//                           precipIntensity: try dailyData.decode(Double.self),
//                           pressure: try dailyData.decode(Double.self),
//                           visibility: try dailyData.decode(Double.self),
//                           uvIndex: try dailyData.decode(Double.self))
//    self.subInfo = try dailyData.decode(SubInfo.self)


  }
  
  var description: String {
    return """
    Currently : \(self.currently)
    Hourly : \(self.hourly)
    Daily : \(self.daily)
    subInfo : \(self.subInfo)
    """
  }
}

