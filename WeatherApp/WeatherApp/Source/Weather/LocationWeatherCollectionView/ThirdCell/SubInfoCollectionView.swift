//
//  SubInfoCollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SubInfoCollectionView: UICollectionView {
  
  // MARK: - Callback
  internal var subInfoCollectionCellDidLoad: ((SubInfoCollectionCell, IndexPath) -> Void)?
  
  // MARK: - Initializers
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    configureSelf()
    backgroundColor = .clear
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - Configure Self
  private func configureSelf() {
    //main
    dataSource = self
    delegate = self
    register(cell: SubInfoCollectionCell.self)
    
    //trait
    isScrollEnabled = false
    allowsSelection = false
    backgroundColor = .clear
  }

}

// MARK: - CollectionView DataSource
extension SubInfoCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(SubInfoCollectionCell.self, indexPath)
    
    if let subInfoCollectionCellDidLoad = subInfoCollectionCellDidLoad {
      subInfoCollectionCellDidLoad(cell, indexPath)
    } else {
      logger(ErrorLog.callback)
    }
    return cell
  }
}

// MARK: - CollectionView FlowLayout
extension SubInfoCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ScreenBounds.width / 2 -  WeatherLayout.leftPadding,
                  height: self.frame.height / 5)
  }
}
