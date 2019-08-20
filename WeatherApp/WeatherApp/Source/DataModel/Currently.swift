//
//  Currently.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 05/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

struct Currently {
  let time: Double
  let summary: String
  let icon: String
  let temperature: Double // 온도(화씨)
  
  init?(from json: [String : Any]) {
    guard let time = json["time"] as? Double,
      let summary = json["summary"] as? String,
      let icon = json["icon"] as? String,
      let temperature = json["temperature"] as? Double
      else {
        logger(ErrorLog.json)
        return nil
      }
    
    self.time = time
    self.summary = summary
    self.icon = icon
    self.temperature = temperature
  }
}
