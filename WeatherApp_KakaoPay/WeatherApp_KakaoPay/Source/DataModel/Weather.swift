//
//  Weather.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 07/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation


struct Weather {
  //var locationInfo: String?
  let currently: Currently
  let hourly: [Hourly]
  let daily: [Daily]
  let subInfo: SubInfo
  
//  mutating func setLocationName(to location: String) {
//    self.locationInfo = location
//  }
}
