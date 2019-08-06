//
//  DataManager.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit
import CoreLocation

final class DataManager {
  static let shared = DataManager()
  private init(){}
  
  let weatherService: WeatherServiceType = WeatherService()
  
  // MAKR: - Weather Data
  private var weather: [Weather] = [] 
  
  // MARK: - Tools for manipulate Data
  internal func getWeather() -> [Weather] {
    return weather
  }
  
  internal func addWeather(_ weather: Weather) {
    self.weather.append(weather)
  }
  
  internal func syncCurrentWeather(into weather: Weather) {
    if self.weather.first == nil { // 비어있으면
      self.weather.append(weather)
    }else {
      self.weather[0] = weather // sync
    }
  }
  
  // SubInfo 데이터는 데이터매니져에서 단위 변환 해준다.
  internal func getSubInfoValues() -> [[String]] {
    var result: [[String]] = []
    self.weather.forEach {
      var subInfoValue: [String] = []
      subInfoValue.append($0.subInfo.sunriseTime)
      subInfoValue.append($0.subInfo.precipProbability)
      subInfoValue.append($0.subInfo.windSpeed)
      subInfoValue.append($0.subInfo.precipIntensity)
      subInfoValue.append($0.subInfo.visibility)
      subInfoValue.append($0.subInfo.sunsetTime)
      subInfoValue.append($0.subInfo.humidity)
      subInfoValue.append($0.subInfo.apparentTemperature)
      subInfoValue.append($0.subInfo.pressure)
      subInfoValue.append($0.subInfo.uvIndex)
      result.append(subInfoValue)
    }
    return result
  }
  
  // MARK: - Networking
  internal func fetchCurrentWeather(from location: CLLocation, completionHandler: (() -> ())? ){
    weatherService.fetchWeatherData(latitude: location.coordinate.latitude,
                                    longitude: location.coordinate.longitude) {
      [weak self] result in
      guard let `self` = self else { return logger(ErrorLog.retainCycle)}
      
      switch result {
      case .success(let weather):
        self.syncCurrentWeather(into: weather)
      case .failure(let error):
        print(error.localizedDescription)
      }
      if let completionHandler = completionHandler {
        completionHandler()
      }
    }
  }
}
