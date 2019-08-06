//
//  SubInfo.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct SubInfo {
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
  
  init?(from json: [String : Any]) {
    guard let sunriseTime = json["sunriseTime"] as? Double,
      let sunsetTime = json["sunsetTime"] as? Double,
      let apparentTemperature = json["apparentTemperatureHigh"] as? Double,
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
    self.sunriseTime = sunriseTime
    self.sunsetTime = sunsetTime
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
