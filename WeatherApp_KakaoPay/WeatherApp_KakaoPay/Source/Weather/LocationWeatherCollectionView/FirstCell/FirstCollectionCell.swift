//
//  FirstCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class FirstCollectionCell: UICollectionViewCell {
  
  // MARK: - Properties
  internal lazy var dailyWeatherCollectionView: DailyWeatherCollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    let cv = DailyWeatherCollectionView(frame: .zero, collectionViewLayout: layout)

    addSubview(cv)
    return cv
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
    makeConstraints()
  }
  
  private func makeConstraints() {
    dailyWeatherCollectionView.layout.equalToSuperView()
  }
}
