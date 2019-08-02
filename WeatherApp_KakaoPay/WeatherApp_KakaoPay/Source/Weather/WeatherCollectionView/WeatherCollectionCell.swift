//
//  WeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
  
  let label = UILabel(frame: CGRect(x: 30, y: 200, width: 100, height: 100))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label.text = "test"
    self.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    //makeConstraints()
  }
}
