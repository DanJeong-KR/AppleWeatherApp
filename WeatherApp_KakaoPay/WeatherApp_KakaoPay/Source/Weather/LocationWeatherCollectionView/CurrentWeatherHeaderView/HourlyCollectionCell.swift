//
//  HourlyCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class HourlyCollectionCell: UICollectionViewCell {
  
  private lazy var hourLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오전 10시"
    lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  private lazy var weatherImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "cloudy")
    iv.contentMode = .scaleAspectFill
    addSubview(iv)
    return iv
  }()
  
  private lazy var tempLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "32°"
    lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    lb.textColor = .white
    addSubview(lb)
    return lb
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    backgroundColor = .clear
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    hourLabel.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.05)
    weatherImageView.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.4).height(equalTo: self.heightAnchor, multiplier: 0.2).width(equalTo: self.widthAnchor, multiplier: 0.4)
    tempLabel.layout.centerX().top(equalTo: self.topAnchor, constant: self.frame.height * 0.7)
  }
}
