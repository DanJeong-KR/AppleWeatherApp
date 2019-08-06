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
    completionHandler: @escaping (Result<Weather, ServiceError>) -> Void
  )
  
//  func fetchCurrentlyData(
//    latitude: Double,
//    longitude: Double,
//    completionHandler: @escaping (Result<Currently, ServiceError>) -> Void
//  )
//  
//  func fetchHourlyData(
//    latitude: Double,
//    longitude: Double,
//    completionHandler: @escaping (Result<[Hourly], ServiceError>) -> Void
//  )
//  
//  func fetchDailyData(
//    latitude: Double,
//    longitude: Double,
//    completionHandler: @escaping (Result<[Daily], ServiceError>) -> Void
//  )
//  
//  func fetchSubInfoData(
//    latitude: Double,
//    longitude: Double,
//    completionHandler: @escaping (Result<SubInfo, ServiceError>) -> Void
//  )
  
}
