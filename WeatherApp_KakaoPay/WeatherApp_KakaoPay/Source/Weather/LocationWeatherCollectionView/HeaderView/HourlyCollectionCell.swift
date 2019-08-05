//
//  HourlyCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class HourlyCollectionCell: UICollectionViewCell {
  
  // MARK: - Properties
  private lazy var hourLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오전 10시"
    lb.font = WeatherFont.timeLabel
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var weatherIconImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "cloudy")
    iv.contentMode = .scaleAspectFit
    addSubview(iv)
    return iv
  }()
  
  private lazy var tempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "32°"
    lb.font = WeatherFont.temperature
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    makeConstraints()
    backgroundColor = .clear
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  private func makeConstraints() {
    hourLabel.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.05)
    weatherIconImageView.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.4).setImageSize(with: 30)
    tempLabel.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.7)
  }
  
  // MARK: - Configure Cell
  internal func configureCell(
    hour: Double,
    icon: String,
    temperature: Double
    ) {
    self.hourLabel.text = hour.getHourToString() + "시"
    self.weatherIconImageView.image = UIImage(named: icon)
    self.tempLabel.text = temperature.convertToCelsiusIntoString()
  }
}
