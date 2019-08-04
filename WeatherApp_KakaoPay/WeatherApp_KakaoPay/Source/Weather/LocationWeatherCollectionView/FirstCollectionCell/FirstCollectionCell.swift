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
  private lazy var separateLineView: SeparateLineView = {
    let slv = SeparateLineView(frame: .zero)
    addSubview(slv)
    return slv
  }()
  
  private lazy var dailyWeatherCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.register(cell: DailyWeatherCollectionCell.self)
    
    cv.backgroundColor = .clear
    cv.allowsSelection = false
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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    dailyWeatherCollectionView.layout.equalToSuperView()
    separateLineView.makeConstraints(atBottom: dailyWeatherCollectionView.bottomAnchor)
  }
}

extension FirstCollectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 9
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(DailyWeatherCollectionCell.self, indexPath)
    return cell
  }
}

extension FirstCollectionCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ScreenBounds.width,
                  height: ScreenBounds.height * 0.05)
  }
}

