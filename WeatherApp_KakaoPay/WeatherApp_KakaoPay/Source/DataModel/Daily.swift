//
//  Daily.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 05/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct Daily {
  //let sunriseTime: Double // 시간별 날씨에서 계산할 때 필요하다.
  //let sunsetTime: Double
  let time: Double
  let icon: String
  let temperatureMax: Double
  let temperatureMin: Double
  
  init?(from json: [String : Any]) {
    guard let time = json["time"] as? Double,
      let icon = json["icon"] as? String,
      let temperatureMax = json["temperatureMax"] as? Double,
      let temperatureMin = json["temperatureMin"] as? Double
      else {
        logger(ErrorLog.json)
        return nil
    }
    self.time = time
    self.icon = icon
    self.temperatureMax = temperatureMax
    self.temperatureMin = temperatureMin
  }
}
