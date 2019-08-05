//
//  Currently.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 05/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation


struct Currently {
  let summary: String
  let icon: String // clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night
  let temperature: Double // 온도(화씨)
  let apparentTemperature: Double // 체감
  let precipProbability: Double // 강수확률
  let humidity: Double // 습도
  let windSpeed: Double // miles/s 풍속
  let precipIntensity: Double // mm 강수량
  let pressure: Double // hPa 기압
  let visibility: Double // km 가시거리
  let uvIndex: Double // 자외선지수
  
  init?(from json: [String : Any]) {
    guard let summary = json["summary"] as? String,
      let icon = json["icon"] as? String,
      let temperature = json["temperature"] as? Double,
      let apparentTemperature = json["apparentTemperature"] as? Double,
      let precipProbability = json["precipProbability"] as? Double,
      let humidity = json["humidity"] as? Double,
      let windSpeed = json["windSpeed"] as? Double,
      let precipIntensity = json["precipIntensity"] as? Double,
      let pressure = json["pressure"] as? Double,
      let visibility = json["visibility"] as? Double,
      let uvIndex = json["uvIndex"] as? Double
      else {
        logger(ErrorLog.json)
        return nil
      }
    
    self.summary = summary
    self.icon = icon
    self.temperature = temperature
    self.apparentTemperature = apparentTemperature
    self.precipProbability = precipProbability
    self.humidity = humidity
    self.windSpeed = windSpeed
    self.precipIntensity = precipIntensity
    self.pressure = pressure
    self.visibility = visibility
    self.uvIndex = uvIndex
  }
}
