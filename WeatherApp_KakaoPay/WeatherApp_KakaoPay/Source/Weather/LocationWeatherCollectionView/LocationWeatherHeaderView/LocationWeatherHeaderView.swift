//
//  CurrentWeatherHeaderView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class LocationWeatherHeaderView: UICollectionReusableView {
  
  // MARK: - Properties
  private lazy var currentWeatherView: CurrentLocationWeatherView = {
    let tv = CurrentLocationWeatherView(frame: .zero)
    
    addSubview(tv)
    return tv
  }()
  
  private lazy var hourlyCollectionView: HourlyCollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //layout.minimumLineSpacing = 0
    let bcv = HourlyCollectionView(frame: .zero, collectionViewLayout: layout)
    addSubview(bcv)
    return bcv
  }()
  
  private lazy var firstSeparateLineView: SeparateLineView = {
    let slv = SeparateLineView(frame: .zero)
    addSubview(slv)
    return slv
  }()
  private lazy var secondSeparateLineView: SeparateLineView = {
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
    makeConstraints()
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    print("Haha")
    //makeConstraints()
  }
  
  internal var currentWeatherViewHeightConstraint: NSLayoutConstraint!
  private func makeConstraints() {
    // currentWeatherView
    currentWeatherView.layout.top().leading().trailing()
    currentWeatherViewHeightConstraint = currentWeatherView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75)
    currentWeatherViewHeightConstraint?.isActive = true
    
    // 구분선
    firstSeparateLineView.makeConstraints(atBottom: currentWeatherView.bottomAnchor)
    
    // hourlyCollectionView
    hourlyCollectionView.layout.leading().trailing().bottom().height(equalTo: self.heightAnchor, multiplier: 0.25)
    
    // 구분선
    secondSeparateLineView.makeConstraints(atBottom: hourlyCollectionView.bottomAnchor)
  }
  
  
}
