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
  let noti = NotificationCenter.default
  
  // MAKR: - Weather Data
  private var weather: [Weather] = [] {
    didSet {
      noti.post(name: NotificationID.DataDidChanged, object: nil)
    }
  }
  
  // MARK: - Tools for manipulate Data
  internal func getWeather() -> [Weather] {
    return weather
  }
  
  internal func addWeather(_ weather: Weather) {
    self.weather.append(weather)
  }
  
  internal func setCurrentLocationInfo(_ locationInfo: String){
    guard let _ = weather.first else { return logger("Weather Data is Empty") }
    self.weather[0].setLocationName(to: locationInfo)
  }
  
  // SubInfo 데이터는 매니저에서 단위 변환 해준다.
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
  
  // MARL: - Location Data 
  private var location: [Location] = [] {
    didSet{
      print("location update :",self.location)
    }
  }
  
  internal func addLocation(_ location: Location) {
    self.location.append(location)
  }
  
  internal func getLocation() -> [Location] {
    return self.location
  }
  
  // 대체하기
  internal func setLocation(_ location: [Location]) {
    self.location = location
  }
  
  internal func synchronizeData() {
    if !self.location.isEmpty {
      self.location.forEach {
        fetchWeather(from: CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude), with: $0.location, completionHandler: nil)
      }
    }else {
      logger("Location is Empty")
    }
  }

  
  // MARK: - Networking
  // 현재위치 날씨정보 가져오기 (갱신기능)
  internal func fetchCurrentWeather(from coordinate: CLLocationCoordinate2D, completionHandler: (() -> ())? ){
    weatherService.fetchWeatherData(latitude: coordinate.latitude,
                                    longitude: coordinate.longitude,
                                    locationInfo: nil) {
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
  
  private func syncCurrentWeather(into weather: Weather) {
    if self.weather.first == nil { // 비어있으면
      self.weather.append(weather)
    }else {
      self.weather[0] = weather // sync
    }
  }
  
  // 검색한 위치 날씨정보 가져오기
  internal func fetchWeather(from coordinate: CLLocationCoordinate2D,
                             with locationInfo: String,
                             completionHandler: (() -> ())? ){
    weatherService.fetchWeatherData(latitude: coordinate.latitude,
                                    longitude: coordinate.longitude,
                                    locationInfo: locationInfo) {
      [weak self] result in
      guard let `self` = self else { return logger(ErrorLog.retainCycle)}
      
      switch result {
      case .success(let weather):
        self.weather.append(weather)
      case .failure(let error):
        print(error.localizedDescription)
      }
      if let completionHandler = completionHandler {
        completionHandler()
      }
    }
  }
}
