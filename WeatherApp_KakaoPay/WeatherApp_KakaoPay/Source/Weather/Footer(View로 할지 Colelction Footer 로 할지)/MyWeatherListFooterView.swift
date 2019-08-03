//
//  MyWeatherListFooterView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class MyWeatherListFooterView: UICollectionReusableView {
  
  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit.message)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .yellow
  }
}
