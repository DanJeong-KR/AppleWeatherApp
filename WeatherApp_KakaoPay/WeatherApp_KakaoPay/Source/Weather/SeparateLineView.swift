//
//  SeparateLineView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SeparateLineView: UIView {

  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .gray
  }
  
  // MARK: - Layout Methods
  internal func makeConstraints(atBottom bottom: NSLayoutYAxisAnchor) {
    self.layout.leading().trailing().height(constant: 0.7).bottom(equalTo: bottom)
  }

}
