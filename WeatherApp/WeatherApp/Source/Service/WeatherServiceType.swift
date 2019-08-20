//
//  WeatherServiceType.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

protocol WeatherServiceType {
  
  func fetchWeatherData(
    latitude: Double,
    longitude: Double,
    locationInfo: String?,
    completionHandler: @escaping (Result<Weather, ServiceError>) -> Void
  )
  
}
