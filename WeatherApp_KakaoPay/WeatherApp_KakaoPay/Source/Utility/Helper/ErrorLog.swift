//
//  ErrorConstants.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

public enum ErrorLog {
  static let layout = "Layout Error"
  static let coderInit = "init(coder:) has not been implemented"
  static let unwrap = "Can't be unwrapped"
  static let retainCycle = "Retain Cycle Error : There is a possibility of memory leaks."
  static let json = "Json Parsing Error"
  static let callback = " Callback did not capture the context. "
  static let userDefaults = "Invalid UserDefaults Data Error"
}
