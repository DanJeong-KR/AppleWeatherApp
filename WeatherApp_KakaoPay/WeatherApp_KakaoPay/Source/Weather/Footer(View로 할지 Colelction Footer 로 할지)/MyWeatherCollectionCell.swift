//
//  MyWeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 07/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class MyWeatherCollectionCell: UICollectionViewCell {
  
  private lazy var locationLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = ""
    lb.font = WeatherFont.location
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var timeLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = ""
    lb.font = WeatherFont.mini
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = ""
    lb.font = UIFont.systemFont(ofSize: 60, weight: .light)
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  
  
  // MARK: - Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    makeConstrains()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  private func makeConstrains() {
    timeLabel.layout.top(constant: 20).leading(constant: WeatherLayout.leftPadding)
    locationLabel.layout.top(equalTo: timeLabel.bottomAnchor).leading(constant: WeatherLayout.leftPadding)
    temperatureLabel.layout.centerY().trailing(constant: WeatherLayout.rightPadding)
  }
  
  internal func configureCell
    (_ locationLabel: String?,
     _ timeLabel: String,
     _ temperatureLabel: String) {
    self.locationLabel.text = locationLabel ?? ""
    self.timeLabel.text = timeLabel
    self.temperatureLabel.text = temperatureLabel
  }
  
}
