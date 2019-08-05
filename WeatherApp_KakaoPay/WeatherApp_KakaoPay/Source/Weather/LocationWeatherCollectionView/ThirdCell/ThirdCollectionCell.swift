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
  
  internal lazy var subInfoCollectionView: SubInfoCollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let cv = SubInfoCollectionView(frame: .zero, collectionViewLayout: layout)
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


