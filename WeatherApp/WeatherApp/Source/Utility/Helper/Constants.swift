//
//  Constants.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

internal struct ScreenBounds {
  static let width = UIScreen.main.bounds.width
  static let height = UIScreen.main.bounds.height
  static let bounds = UIScreen.main.bounds
}

internal struct WeatherFont {
  static let location = UIFont.systemFont(ofSize: 35, weight: .regular)
  static let currentTemp = UIFont.systemFont(ofSize: 105, weight: .thin)
  static let day = UIFont.systemFont(ofSize: 22, weight: .regular)
  static let temperature = UIFont.systemFont(ofSize: 22, weight: .regular)
  static let timeLabel = UIFont.systemFont(ofSize: 20, weight: .regular)
  static let description = UIFont.systemFont(ofSize: 20, weight: .regular)
  static let mini = UIFont.systemFont(ofSize: 16, weight: .regular)
  static let subInfo = UIFont.systemFont(ofSize: 30, weight: .regular)
}

internal struct WeatherColor {
  static let mainTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  static let subTextColor = #colorLiteral(red: 0.5449205637, green: 0.5544300675, blue: 0.6000839472, alpha: 1)
  static let separateLineColor = #colorLiteral(red: 0.5449205637, green: 0.5544300675, blue: 0.6000839472, alpha: 1)
}

internal struct WeatherLayout {
  static let leftPadding: CGFloat = 10
  static let rightPadding: CGFloat = -10
  
  static let topPadding: CGFloat = 10
}
