//
//  WeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    makeConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    //makeConstraints()
  }
  
  private func makeConstraints() {
    guard let superView = self.superview else {
      return logger("SuperView of WeatherCollectionCell is nil")
    }
    self.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
      self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
      self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
      self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 200)
      ])
  }
}
