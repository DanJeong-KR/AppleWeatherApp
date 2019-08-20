//
//  MyWeatherTableView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

final class MyWeatherListViewController: UIViewController {
  
  // MARK: - Data
  private var weather: [Weather]? {
    return DataManager.shared.getWeather()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  private lazy var myWeatherCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.itemSize = CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.1)
    layout.footerReferenceSize = CGSize(width: ScreenBounds.width, height: ScreenBounds.height * 0.13)
    
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.register(cell: MyWeatherCollectionCell.self)
    cv.register(MyWeatherListFooterView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: MyWeatherListFooterView.identifier)
    
    cv.isScrollEnabled = false
    cv.backgroundColor = .clear
    view.addSubview(cv)
    return cv
  }()
  
  private let backgroundImageView: UIImageView = {
    let iv = UIImageView(frame: ScreenBounds.bounds)
    iv.image = UIImage(named: "night")
    iv.contentMode = .scaleToFill
    return iv
  }()
  
  // MARK: - ViewController LifeCyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(backgroundImageView) // 이미지 뷰 가장 아래쪽에 위치하게
    configureReloadObserver()
    makeConstraints()
  }
  
  deinit {
    DataManager.shared.noti.removeObserver(self, name: NotificationID.DataDidChanged, object: nil)
  }
  
  // MARK: - Reload Notifications
  private func configureReloadObserver() {
    DataManager.shared.noti.addObserver(self, selector: #selector(reloadObserver(_:)), name: NotificationID.DataDidChanged, object: nil)
  }
  
  @objc func reloadObserver(_ sender: Any) {
    logger("Reload")
    DispatchQueue.main.async {
      self.myWeatherCollectionView.reloadData()
    }
  }
  
  // MARK: - Layout Methods
  private func makeConstraints() {
    myWeatherCollectionView.layout.top().leading().trailing().bottom()
  }
}

// MARK: - CollectionView DataSource
extension MyWeatherListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weather?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(MyWeatherCollectionCell.self, indexPath)
    if let weather = weather {
      cell.configureCell(weather[indexPath.row].locationInfo,
                         weather[indexPath.row].currently.time.getHourToString(true),
                         weather[indexPath.row].currently.temperature.convertToCelsiusIntoString())
    }
    logger(ErrorLog.unwrap)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                 withReuseIdentifier: MyWeatherListFooterView.identifier,
                                                                 for: indexPath) as! MyWeatherListFooterView
    footer.plusButtonDidTap = {
      self.present(SearchLocationViewController(), animated: true, completion: nil)
    }
    return footer
  }
}

// MARK: - Collection FlowLayout and Delegate
extension MyWeatherListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let weatherVC = self.presentingViewController as? WeatherViewController {
      weatherVC.pageControl.currentPage = indexPath.row
      weatherVC.weatherCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    self.dismiss(animated: true, completion: nil)
  }
}
