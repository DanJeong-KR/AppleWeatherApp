//
//  LocationWeatherCollectionView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class LocationWeatherCollectionView: UICollectionView {
  
  // MARK: - Callback
  internal var headerDidLoad: ((LocationWeatherHeaderView) -> Void)?
  internal var firstCollectionCellDidLoad: ((DailyCell) -> Void)?
  internal var secondCollectionCellDidLoad: ((SummaryCell) -> Void)?
  internal var thirdCollectionCellDidLoad: ((SubInfoCell) -> Void)?
  
  // MARK: - Initializers
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  deinit {
    headerDidLoad = nil
    firstCollectionCellDidLoad = nil
    secondCollectionCellDidLoad = nil
    thirdCollectionCellDidLoad = nil
  }
  
  // MARK: - Configure
  private func configure() {
    register(LocationWeatherHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LocationWeatherHeaderView.identifier)
    register(cell: DailyCell.self)
    register(cell: SummaryCell.self)
    register(cell: SubInfoCell.self)
    dataSource = self
    delegate = self
    // configure
    backgroundColor = .clear
    showsVerticalScrollIndicator = false
    
  }
  
}

// MARK: - CollectionView DataSource
extension LocationWeatherCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.item {
    case 0:
      let cell = collectionView.dequeue(DailyCell.self, indexPath)
      if let firstCollectionCellDidLoad  = firstCollectionCellDidLoad {
        firstCollectionCellDidLoad(cell)
      } else {
        logger(ErrorLog.callback)
      }
      return cell
    case 1:
      let cell = collectionView.dequeue(SummaryCell.self, indexPath)
      if let secondCollectionCellDidLoad  = secondCollectionCellDidLoad {
        secondCollectionCellDidLoad(cell)
      } else {
        logger(ErrorLog.callback)
      }
      return cell
    case 2:
      let cell = collectionView.dequeue(SubInfoCell.self, indexPath)
      if let thirdCollectionCellDidLoad  = thirdCollectionCellDidLoad {
        thirdCollectionCellDidLoad(cell)
      } else {
        logger(ErrorLog.callback)
      }
      return cell
    default:
      break
    }
    
    logger("Invalid return Cell")
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LocationWeatherHeaderView.identifier, for: indexPath) as! LocationWeatherHeaderView
    
    if let headerDidLoad = headerDidLoad {
      headerDidLoad(header)
    } else {
      logger(ErrorLog.callback)
    }
    return header
  }
}

// MARK: - Collection FlowLayout and Delegate
extension LocationWeatherCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.item {
    case 0:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.40)
    case 1:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.1)
    case 2:
      return CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.40)
    default:
      break
    }
    
    return CGSize(width: ScreenBounds.width, height: 100)
  }
  
  // ScrollView Delegate
  // FIXME: - 상단 애니메이션 고민해보자
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // 아랫쪽으로 보려고 위로 슬라이드 해서 스크롤 내리면 y + 로 커짐
    //print("Content Offset : \(scrollView.contentOffset)")
    
  }
 
 
}
