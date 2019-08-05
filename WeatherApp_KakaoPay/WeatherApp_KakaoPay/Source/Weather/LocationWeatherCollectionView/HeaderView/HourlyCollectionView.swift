//
//  CollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class HourlyCollectionView: UICollectionView {
  
  // MARK: - CallBack
  internal var hourlyCellDidLoad: ((HourlyCollectionCell, IndexPath) -> Void)?
  
  // MARK: - Initializers
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    backgroundColor = .clear
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - configure
  private func configure() {
    showsHorizontalScrollIndicator = false
    self.dataSource = self
    self.delegate = self
    self.register(cell: HourlyCollectionCell.self)
  }
}

// MARK: - CollectionView DataSource
extension HourlyCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 24
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(HourlyCollectionCell.self, indexPath)
    
    // Callback
    if let hourlyCellDidLoad = self.hourlyCellDidLoad {
      hourlyCellDidLoad(cell, indexPath)
    } else {
      logger(ErrorLog.callback)
    }
    
    return cell
  }
  
}
// MARK: - CollectionView FlowLayout
extension HourlyCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: self.frame.height)
  }
}
