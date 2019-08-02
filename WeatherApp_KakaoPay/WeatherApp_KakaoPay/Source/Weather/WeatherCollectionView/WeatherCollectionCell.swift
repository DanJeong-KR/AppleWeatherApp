//
//  WeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
  
  private lazy var currentWeatherView: CurrentWeatherView = {
    let v = CurrentWeatherView(frame: .zero)
    v.backgroundColor = .clear
    addSubview(v)
    return v
  }()
  
  internal var weatherViewHeightAnchor: NSLayoutConstraint?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    currentWeatherView.layout.top().leading().trailing()
    weatherViewHeightAnchor = currentWeatherView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.40)
    weatherViewHeightAnchor?.isActive = true
  }
}
