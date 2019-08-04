//
//  CurrentWeather.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
  
  struct currently: Decodable {
    let summary: String
    let icon: String
    let temperatrue: Double // 온도(화씨)
    let apparentTemperature: Double // 체감
    let precipProbability: Double // 강수확률
    let humidity: Double // 습도
    let windSpeed: Double // m/s 풍속
    let precipIntensity: Double // cm 강수량
    let pressure: Double // hPa 기압
    let visibility: Double // km 가시거리
    let uvIndex: Double // 자외선지수
  }
  
  struct hourly: Decodable {
    let time: Double
    let icon: String
    let temperature: Double // 온도(화씨)
  }
  
  struct daily: Decodable {
    let sunriseTime: Double // 시간별 날씨에서 계산할 때 필요하다.
    let sunsetTIme: Double
    let icon: String
    let temperatureMax: Double
    let temperatureMin: Double
  }
}
