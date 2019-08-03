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
  
  private lazy var bottomCollectionView: UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let bcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    bcv.dataSource = self
//    bcv.delegate = self
    bcv.backgroundColor = .yellow
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
    topView.layout.top().leading().trailing()
    bottomCollectionView.layout.top(equalTo: topView.bottomAnchor).leading().trailing().bottom()
  }
  
  
}

// MARK: - CollectionView DataSource
extension CurrentWeatherHeaderView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
}
// MARK: - CollectionView FlowLayout
extension CurrentWeatherHeaderView: UICollectionViewDelegateFlowLayout {
  
}
