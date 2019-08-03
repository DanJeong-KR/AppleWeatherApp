//
//  WeatherCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//
import UIKit

class WeatherCollectionCell: UICollectionViewCell {

  // MARK: - Properties
  private lazy var locationWeatherCollectionView: UICollectionView = {
    // layout
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.headerReferenceSize = CGSize(width: ScreenBounds.width,
                                        height: ScreenBounds.height * 0.4)
    // init
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    cv.register(CurrentWeatherTopView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CurrentWeatherTopView.identifier)
//    cv.register(cell: SecondCollectionCell.self)
    cv.dataSource = self
    cv.delegate = self
    // configure
    cv.backgroundColor = .clear
    addSubview(cv)
    return cv
  }()
  

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  internal var currentWeatherTopViewHeight: NSLayoutConstraint?
  
  private func makeConstraints() {
    currentWeatherTopView.layout.top().leading().trailing()
    currentWeatherTopViewHeight = currentWeatherTopView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
    currentWeatherTopViewHeight?.isActive = true
    locationWeatherCollectionView.layout.top(equalTo: <#T##NSLayoutYAxisAnchor?#>, constant: <#T##CGFloat#>).bottom().leading().trailing()
  }
}

extension WeatherCollectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(SecondCollectionCell.self, indexPath)
    return cell
  }
  
//  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CurrentWeatherTopView.identifier, for: indexPath) as! CurrentWeatherTopView
//    return header
//  }
}

extension WeatherCollectionCell: UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let cellHeight = self.frame.height - self.
//    return CGSize(width: ScreenBounds.width, height: self.frame)
//  }
}
