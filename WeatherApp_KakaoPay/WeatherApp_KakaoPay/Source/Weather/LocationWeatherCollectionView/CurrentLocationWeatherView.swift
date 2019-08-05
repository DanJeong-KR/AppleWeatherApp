//
//  FirstCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class CurrentLocationWeatherView: UIView {
  
  // MARK: - Properties
  private lazy var locationLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "성동구"
    lb.font = WeatherFont.location
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var summaryLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "청명함"
    lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "27°"
    lb.font = WeatherFont.currentTemp
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var dayLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "금요일"
    lb.font = WeatherFont.day
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var todayLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오늘"
    lb.font = WeatherFont.mini
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
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
    lb.textColor = WeatherColor.mainTextColor
    return lb
  }()
  
  private lazy var minTempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "25"
    lb.font = WeatherFont.temperature
    lb.textColor = #colorLiteral(red: 0.5449205637, green: 0.5544300675, blue: 0.6000839472, alpha: 1)
    return lb
  }()
  
  private lazy var separateLineView: SeparateLineView = {
    let slv = SeparateLineView(frame: .zero)
    addSubview(slv)
    return slv
  }()
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    makeConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  private func makeConstraints() {
    locationLabel.layout.centerX().top(constant: ScreenBounds.height * 0.1)
    summaryLabel.layout.centerX().top(equalTo: locationLabel.bottomAnchor, constant: 5)
    temperatureLabel.layout.centerX().top(equalTo: summaryLabel.bottomAnchor, constant: 5)
    
    dayLabel.layout.leading(constant: 10).bottom(constant: -10)
    todayLabel.layout.leading(equalTo: dayLabel.trailingAnchor, constant: 10).bottom(constant: -10)
    
    tempStackView.layout.trailing(constant: -10).bottom(constant: -10)
    
     separateLineView.makeConstraints(atBottom: self.bottomAnchor)
  }
  
  internal func configureCurrentWeather(
    location: String,
    summary: String,
    temperature: Double,
    day: Double, // 요일
    maxTemperature: Double,
    minTemperature: Double
    ) {
    locationLabel.text = location
    summaryLabel.text = summary
    temperatureLabel.text = temperature.convertToCelsiusIntoString() + "°"
    dayLabel.text = day.getWeekDayToString() ?? "Error"
    maxTempLabel.text = maxTemperature.convertToCelsiusIntoString()
    minTempLabel.text = minTemperature.convertToCelsiusIntoString()
  }
}

