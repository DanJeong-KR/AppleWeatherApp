//
//  DailyWeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class DailyWeatherCollectionCell: UICollectionViewCell {
  
  // MARK: - Properties
  private lazy var dayLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "금요일"
    lb.textColor = .white
    lb.font = WeatherFont.day
    addSubview(lb)
    return lb
  }()
  
  private lazy var weatherIconImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "cloudy")
    iv.contentMode = .scaleAspectFit
    iv.layer.masksToBounds = true
    addSubview(iv)
    return iv
  }()
  
  private lazy var tempStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [maxTempLabel, minTempLabel])
    sv.axis = .horizontal
    sv.spacing = 25
    sv.alignment = .fill
    sv.distribution = .fill
    addSubview(sv)
    return sv
  }()
  
  private lazy var maxTempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "34"
    lb.font = WeatherFont.temperature
    lb.textColor = .white
    return lb
  }()
  
  private lazy var minTempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "25"
    lb.font = WeatherFont.temperature
    lb.textColor = .gray
    return lb
  }()
  
  // MARK: - Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    dayLabel.layout.centerY().leading(constant: WeatherLayout.leftPadding)
    weatherIconImageView.layout.centerX().centerY().setImageSize(with: 30)
    tempStackView.layout.centerY().trailing(constant: WeatherLayout.rightPadding)
  }
  
  
}

