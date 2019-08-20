//
//  DailyWeatherCollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class DailyWeatherCollectionView: UICollectionView {

  internal var dailyWeatherCollectionCellDidLoad: ((DailyWeatherCollectionCell, IndexPath) -> Void)?
  
  // MARK: - Initializers
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    backgroundColor = .clear
    configureSelf()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - Configure Self
  private func configureSelf() {
    dataSource = self
    delegate = self
    register(cell: DailyWeatherCollectionCell.self)
    
    backgroundColor = .clear
    allowsSelection = false
  }

}


// MARK: - CollectionView DataSource
extension DailyWeatherCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(DailyWeatherCollectionCell.self, indexPath)
    if let dailyWeatherCollectionCellDidLoad = dailyWeatherCollectionCellDidLoad {
      dailyWeatherCollectionCellDidLoad(cell, indexPath)
    } else {
      logger(ErrorLog.callback)
    }
    return cell
  }
}


extension DailyWeatherCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ScreenBounds.width,
                  height: ScreenBounds.height * 0.05)
  }
}


