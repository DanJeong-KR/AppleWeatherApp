//
//  SubInfo.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct SubInfo {
  let sunriseTime: String // 일출
  let sunsetTime: String // 일몰
  let apparentTemperature: String // 체감
  let precipProbability: String // 강수확률
  let humidity: String // 습도
  let windSpeed: String // miles/s 풍속
  let precipIntensity: String // mm 강수량
  let pressure: String // hPa 기압
  let visibility: String // km 가시거리
  let uvIndex: String // 자외선지수
  
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
    self.sunriseTime = sunriseTime.getHourToString(true)
    self.sunsetTime = sunsetTime.getHourToString(true)
    self.apparentTemperature = apparentTemperature.convertToCelsiusIntoString() + "°"
    self.precipProbability = precipProbability.convertPercentageToStr()
    self.humidity = humidity.convertPercentageToStr()
    self.windSpeed = windSpeed.convertWindFormatToStr()
    self.precipIntensity = precipIntensity.convertMiliToCentiIntoStr()
    self.pressure = String(Int((pressure).rounded(.down))) + "hPa"
    self.visibility = String(Int((visibility).rounded(.down))) + "km"
    self.uvIndex = String(Int(uvIndex))
  }
}

