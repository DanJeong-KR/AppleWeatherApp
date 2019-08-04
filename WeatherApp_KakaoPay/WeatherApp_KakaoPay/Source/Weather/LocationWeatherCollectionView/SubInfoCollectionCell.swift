//
//  SubInfoCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SubInfoCollectionCell: UICollectionViewCell {
  
  private lazy var topLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "일출"
    lb.font = WeatherFont.mini
    lb.textColor = WeatherColor.subTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var bottomLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오전 5:33"
    lb.font = WeatherFont.subInfo
    lb.textColor = WeatherColor.mainTextColor
    addSubview(lb)
    return lb
  }()
  
  private lazy var separateLineView: SeparateLineView = {
    let slv = SeparateLineView(frame: .zero)
    addSubview(slv)
    return slv
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
    makeConstaints()
  }
  
  private func makeConstaints() {
    topLabel.layout.top(constant: 5).leading()
    bottomLabel.layout.bottom(constant: -5).leading()
    separateLineView.makeConstraints(atBottom: self.bottomAnchor)
  }
  
}
