//
//  ThirdCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

// CollectionView 들어갈 것
import UIKit

class ThirdCollectionCell: UICollectionViewCell {
  
  private lazy var subInfoCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.register(cell: SubInfoCollectionCell.self)
    
    cv.isScrollEnabled = false
    cv.allowsSelection = false
    cv.backgroundColor = .clear
    addSubview(cv)
    return cv
  }()
  
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
    subInfoCollectionView.layout.leading(constant: WeatherLayout.leftPadding).trailing(constant: WeatherLayout.rightPadding).top().bottom()
  }
}

// MARK: - CollectionView DataSource
extension ThirdCollectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(SubInfoCollectionCell.self, indexPath)
    
    return cell
  }
}

// MARK: - CollectionView FlowLayout
extension ThirdCollectionCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ScreenBounds.width / 2 -  WeatherLayout.leftPadding,
                  height: self.frame.height / 5)
  }
}
