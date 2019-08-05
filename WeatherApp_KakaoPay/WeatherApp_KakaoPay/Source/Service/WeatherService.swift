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
}
