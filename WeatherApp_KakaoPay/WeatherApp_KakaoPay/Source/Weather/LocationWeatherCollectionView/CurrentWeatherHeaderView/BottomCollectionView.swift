//
//  CollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class BottomCollectionView: UICollectionView {
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    backgroundColor = .yellow
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit.message)
  }
  
  private func configure() {
    showsHorizontalScrollIndicator = false
    self.dataSource = self
    self.delegate = self
    self.register(cell: UICollectionViewCell.self)
  }

}

// MARK: - CollectionView DataSource
extension BottomCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(UICollectionViewCell.self, indexPath)
    cell.backgroundColor = .green
    return cell
  }
  
}
// MARK: - CollectionView FlowLayout
extension BottomCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ScreenBounds.width / 3, height: self.frame.height)
  }
}
