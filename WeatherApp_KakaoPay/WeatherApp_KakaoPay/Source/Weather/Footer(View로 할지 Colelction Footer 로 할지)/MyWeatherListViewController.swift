//
//  MyWeatherTableView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class MyWeatherListViewController: UIViewController {
  
  private lazy var myWeatherCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: ScreenBounds.width, height: 80)
    layout.footerReferenceSize = CGSize(width: ScreenBounds.width, height: 100)
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.isScrollEnabled = false
    
    cv.dataSource = self
    cv.register(cell: UICollectionViewCell.self)
    cv.register(MyWeatherListFooterView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: MyWeatherListFooterView.identifier)
    
    view.addSubview(cv)
    return cv
  }()
  
  // MARK: - ViewController LifeCyle
  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
  }
  
  
  // MARK: - Layout Methods
  private func makeConstraints() {
    myWeatherCollectionView.layout.top().leading().trailing().bottom()
  }
}

// MARK: - CollectionView DataSource
extension MyWeatherListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(UICollectionViewCell.self, indexPath)
    cell.backgroundColor = .red
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                 withReuseIdentifier: MyWeatherListFooterView.identifier,
                                                                 for: indexPath) as! MyWeatherListFooterView
    footer.plusButtonDidTap = {
      self.present(UINavigationController(rootViewController: SearchLocationViewController()), animated: true, completion: nil)
    }
    return footer
  }
}
