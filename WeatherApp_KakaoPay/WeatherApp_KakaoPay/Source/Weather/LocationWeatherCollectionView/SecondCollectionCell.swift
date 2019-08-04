//
//  SecondCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

// Label 이나 TextView 들어갈 것
import UIKit

class SecondCollectionCell: UICollectionViewCell {
  
  // MARK: - Properties
  internal lazy var descriptionLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "오늘 : 대체로 흐림, 현재 기온은 26°이며 최고 기온은 28°입니다. 오늘 밤 날씨 대체로 청명함, 최저 기온은 24°입니다"
    lb.textColor = .white
    lb.font = WeatherFont.description
    lb.numberOfLines = 0
    addSubview(lb)
    return lb
  }()
  
  private lazy var separateLineView: SeparateLineView = {
    let slv = SeparateLineView(frame: .zero)
    addSubview(slv)
    return slv
  }()
  
  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraint()
  }

  private func makeConstraint() {
    descriptionLabel.layout.leading(constant: WeatherLayout.leftPadding).trailing(constant: WeatherLayout.rightPadding).centerX().centerY()
    separateLineView.makeConstraints(atBottom: self.bottomAnchor)
  }
}
