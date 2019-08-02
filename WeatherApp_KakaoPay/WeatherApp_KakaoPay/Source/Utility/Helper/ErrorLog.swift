//
//  ErrorConstants.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

enum ErrorLog: String {
  case layout = "Layout Error"
  case coderInit = "init(coder:) has not been implemented"
  
  var message: String {
    return self.rawValue
  }
}
