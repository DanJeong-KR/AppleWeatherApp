//
//  ButtonType.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

enum ButtonID: Int {
  case detailWeatherButton
  case locationListButton
  
  var id: Int {
    return self.rawValue
  }
}

extension UIControl {
  var id: Int {
    get {
      return self.tag
    } set {
      self.tag = newValue
    }
  }
}
