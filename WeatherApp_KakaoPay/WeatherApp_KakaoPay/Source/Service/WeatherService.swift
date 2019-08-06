//
//  WeatherService.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 05/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

final class WeatherService: WeatherServiceType {
  
  private let baseURL = "https://api.darksky.net"
  private let appKey = "c857ff3aef911d31170756138e39fb80"

  /*
  func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Result<Weather, ServiceError>) -> Void) {
    
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
            (200..<300) ~= header.statusCode else {
              logger(ServiceError.invalidStatusCode.localizedDescription)
              return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      if let weather = try? JSONDecoder().decode(Weather.self, from: data) {
        completionHandler(.success(weather))
      } else {
        logger(ServiceError.invalidFormat.localizedDescription)
        completionHandler(.failure(.invalidFormat))
      }
    }
    task.resume()
  }
  */
 
  func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Result<Weather, ServiceError>) -> Void) {
    
    /*
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {
          logger(ServiceError.invalidStatusCode.localizedDescription)
          return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      // JSON Parsing
      guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any],
        // currently parsing
        let currently = try? json["currently"] as? [String : Any],
        // hourly parsing
        let hourly = try? json["hourly"] as? [String : Any],
        let hourlyData = try? hourly["data"] as? [[String : Any]],
        // daily parsing
        let daily = try? json["daily"] as? [String : Any],
        let dailyData = try? daily["data"] as? [[String : Any]]
        else {
          logger(ErrorLog.json)
          return completionHandler(.failure(.invalidFormat))
        }
      
      let currentlyData = Currently(from: currently)
      
      let hourlyArr = hourlyData.map {
        Hourly(from: $0)
      }
      
      let dailyArr = dailyData.map {
        Daily(from: $0)
      }
      // sunrise and sunset time parsing
      guard let dailyFirst = dailyData.first,
        let sunriseTime = dailyFirst["sunriseTime"] as? Double,
        let sunsetTime = dailyFirst["sunsetTime"] as? Double
        else { return logger(ErrorLog.json) }
      
      print("sun :",sunsetTime, sunsetTime)
    }
    task.resume()
 */
  }
  
  func fetchCurrentlyData(latitude: Double, longitude: Double, completionHandler: @escaping (Result<Currently, ServiceError>) -> Void) {
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {
          logger(ServiceError.invalidStatusCode.localizedDescription)
          return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      // JSON Parsing
      guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any],
        // currently parsing
        let currently = json["currently"] as? [String : Any]
        else {
          logger(ErrorLog.json)
          return completionHandler(.failure(.invalidFormat))
      }
      
      // JSON Parsing Success
      if let currentlyData = Currently(from: currently) {
        completionHandler(.success(currentlyData))
      } else {
        logger(ErrorLog.unwrap)
      }
    }
    task.resume()
  }
  
  func fetchHourlyData(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[Hourly], ServiceError>) -> Void) {
    
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {
          logger(ServiceError.invalidStatusCode.localizedDescription)
          return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      // JSON Parsing
      guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any],
        // hourly parsing
        let hourly = json["hourly"] as? [String : Any],
        let hourlyData = hourly["data"] as? [[String : Any]]
        else {
          logger(ErrorLog.json)
          return completionHandler(.failure(.invalidFormat))
      }
      
      let hourlyArr = hourlyData.compactMap {
        Hourly(from: $0)
      }
      // Parsing Success
      completionHandler(.success(hourlyArr))
    }
    task.resume()
  }
  
  func fetchDailyData(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[Daily], ServiceError>) -> Void) {
    
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {
          logger(ServiceError.invalidStatusCode.localizedDescription)
          return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      // JSON Parsing
      guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any],
        // daily parsing
        let daily = json["daily"] as? [String : Any],
        let dailyData = daily["data"] as? [[String : Any]]
        else {
          logger(ErrorLog.json)
          return completionHandler(.failure(.invalidFormat))
      }
      
      let dailyArr = dailyData.compactMap {
        Daily(from: $0)
      }
      completionHandler(.success(dailyArr))
    }
    task.resume()
  }
  
  func fetchSubInfoData(latitude: Double, longitude: Double, completionHandler: @escaping (Result<SubInfo, ServiceError>) -> Void) {
    
    var urlComponent = URLComponents(string: baseURL)
    urlComponent?.path = "/forecast/\(appKey)/\(latitude),\(longitude)"
    urlComponent?.queryItems = [
      URLQueryItem(name: "lang", value: "ko")
    ]
    
    guard let url = urlComponent?.url else {
      return logger(ErrorLog.unwrap)
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      
      guard error == nil else {
        logger(ServiceError.clientError.localizedDescription)
        return completionHandler(.failure(.clientError))
      }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {
          logger(ServiceError.invalidStatusCode.localizedDescription)
          return completionHandler(.failure(.invalidStatusCode))
      }
      guard let data = data else {
        logger(ServiceError.noData.localizedDescription)
        return completionHandler(.failure(.noData))
      }
      
      // JSON Parsing
      guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any],
        // daily parsing
        let daily = json["daily"] as? [String : Any],
        let dailyData = daily["data"] as? [[String : Any]]
        else {
          logger(ErrorLog.json)
          return completionHandler(.failure(.invalidFormat))
      }
      
      if let dailyFirst = dailyData.first,
        let subInfo = SubInfo(from: dailyFirst) {
        completionHandler(.success(subInfo))
      } else {
        logger(ErrorLog.unwrap)
      }
    }
    task.resume()
  }
}



