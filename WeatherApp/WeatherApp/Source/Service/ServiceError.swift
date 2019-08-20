//
//  ServiceError.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import Foundation

enum ServiceError: Error {
  case clientError
  case invalidStatusCode
  case noData
  case invalidFormat
}
