//
//  FirstCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
  
  // MARK: - Properties
  private lazy var locationLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "성동구"
    lb.font = UIFont.systemFont(ofSize: 35, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var outLineLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "청명함"
    lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "27°"
    lb.font = UIFont.systemFont(ofSize: 95, weight: .thin)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var dayLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "금요일"
    lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var todayLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오늘"
    lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var tempStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [maxTempLabel, minTempLabel])
    sv.axis = .horizontal
    sv.spacing = 5
    sv.alignment = .fill
    sv.distribution = .fill
    addSubview(sv)
    return sv
  }()
  
  private lazy var maxTempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "34"
    lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    lb.textColor = .white
    return lb
  }()
  
  private lazy var minTempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "25"
    lb.font = UIFont.systemFont(ofSize: 20, weight:  .regular)
    lb.textColor = .gray
    return lb
  }()
  
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
    //print("haha",self.frame)
  }
  
  private func makeConstraints() {
    locationLabel.layout.centerX().top(constant: self.frame.height * 0.2)
    outLineLabel.layout.centerX().top(equalTo: locationLabel.bottomAnchor)
    temperatureLabel.layout.centerX().top(equalTo: outLineLabel.bottomAnchor, constant: 5)
    
    dayLabel.layout.leading(constant: 10).bottom(constant: -5)
    todayLabel.layout.leading(equalTo: dayLabel.trailingAnchor, constant: 5).bottom(constant: -5)
    
    tempStackView.layout.trailing(constant: -10).bottom(constant: -5)
  }
}


