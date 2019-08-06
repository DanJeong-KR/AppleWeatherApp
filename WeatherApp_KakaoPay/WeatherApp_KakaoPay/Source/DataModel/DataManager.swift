//
//  DataManager.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

final class DataManager {
  static let shared = DataManager()
  private init() { }
  
  static let weatherService: WeatherServiceType = WeatherService()
  
  private let weather: [Weather] = []
  
  
}
