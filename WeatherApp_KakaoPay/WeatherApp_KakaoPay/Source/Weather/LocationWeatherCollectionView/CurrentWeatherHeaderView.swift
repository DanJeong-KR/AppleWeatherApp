//
//  CurrentWeatherHeaderView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class CurrentWeatherHeaderView: UICollectionReusableView {
  
  // MARK: - Properties
  private lazy var topView: TopView = {
    let tv = TopView(frame: .zero)
    
    addSubview(tv)
    return tv
  }()
  
  private lazy var bottomCollectionView: BottomCollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let bcv = BottomCollectionView(frame: .zero, collectionViewLayout: layout)
    addSubview(bcv)
    return bcv
  }()
  
  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    topView.layout.top().leading().trailing().height(multiplier: 0.75)
    bottomCollectionView.layout.top(equalTo: topView.bottomAnchor).leading().trailing().bottom()
  }
  
  
}
