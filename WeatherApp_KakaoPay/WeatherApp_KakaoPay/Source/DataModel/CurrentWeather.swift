//
//  CurrentWeather.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct Weather: Decodable, CustomStringConvertible {
  
  let currently: Currently
  let hourly: [Hourly]
  let daily: [Daily]
  
  struct Currently: Decodable {
    let summary: String
    let icon: String // clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night
    let temperatrue: Double // 온도(화씨)
    let apparentTemperature: Double // 체감
    let precipProbability: Double // 강수확률
    let humidity: Double // 습도
    let windSpeed: Double // miles/s 풍속
    let precipIntensity: Double // mm 강수량
    let pressure: Double // hPa 기압
    let visibility: Double // km 가시거리
    let uvIndex: Double // 자외선지수
  }
  
  struct Hourly: Decodable {
    let time: Double
    let icon: String
    let temperature: Double // 온도(화씨)
  }
  
  // FIXME: - 일출 일몰 codable 에서 뺄까 고민중
  struct Daily: Decodable {
    let sunriseTime: Double // 시간별 날씨에서 계산할 때 필요하다.
    let sunsetTIme: Double
    let time: Double
    let icon: String
    let temperatureMax: Double
    let temperatureMin: Double
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
  
  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    // currently
    let currently = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .currently)
    
    // hourly
    let hourly = try container.nestedContainer(keyedBy: HourlyKeys.self, forKey: .hourly)
    // nestedUnKeyedContainer는 변수!
    var hourlyData = try hourly.nestedUnkeyedContainer(forKey: .data)
    
    // daily
    let daily = try container.nestedContainer(keyedBy: DailyKeys.self, forKey: .daily)
    var dailyData = try daily.nestedUnkeyedContainer(forKey: .data)
    
    
    self.currently = try currently.decode(Currently.self, forKey: .currently)
    self.hourly = try hourlyData.decode([Hourly].self)
    self.daily = try dailyData.decode([Daily].self)
  }
  
  var description: String {
    return """
    Currently : \(self.currently)
    Hourly : \(self.hourly)
    Daily : \(self.daily)
    """
  }
}
