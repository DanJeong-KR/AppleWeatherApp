//
//  ViewController.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
  // MARK: - Properties
  
  private let weatherService: WeatherServiceType = WeatherService()
  private var weather: Weather? {
    didSet {
      print("weather : ",self.weather ?? "weather 비어있음")
    }
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  private let backgroundImageView: UIImageView = {
    let screenBounds = UIScreen.main.bounds
    let iv = UIImageView(frame: screenBounds)
    iv.image = UIImage(named: "night")
    iv.contentMode = .scaleToFill
    return iv
  }()
  
  private lazy var weatherCollectionView: UICollectionView = {
    // init
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.scrollDirection = .horizontal
    let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    // collection 설정
    c.register(cell: WeatherCollectionCell.self)
    
    c.dataSource = self
    c.delegate = self
    
    // 레이아웃 설정
    c.isPagingEnabled = true
    c.backgroundColor = .clear
    
    view.addSubview(c)
    return c
  }()
  
  
  private lazy var weatherToolBar: WeatherToolBar = {
    let tb = WeatherToolBar(frame: .zero)
    view.addSubview(tb)
    return tb
  }()

  // MARK: - VC LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(backgroundImageView)
    makeConstraints()
    
    //test
    weatherService.fetchWeather(latitude: 37.11776, longitude: 127.09776) {
      [weak self] result in
      guard let self = self else {return logger(ErrorLog.weakRef)}
      switch result {
      case .success(let value):
        self.weather = value
      case .failure(let error):
        logger(error.localizedDescription)
      }
    }
  }
  
  // MARK: - AutoLayout
  private func makeConstraints() {
    weatherCollectionView.layout.top().leading().trailing()
    weatherToolBar.layout.top(equalTo: weatherCollectionView.bottomAnchor).leading().trailing().bottom()
    
  }

}


// MARK: - Collection DataSource
extension WeatherViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeue(WeatherCollectionCell.self, indexPath)
    return cell
  }
  
  
}

// MARK: - Collection FlowLayout and Delegate
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = (self.weatherCollectionView.bounds.width,
                self.weatherCollectionView.bounds.height)
    return CGSize(width: size.0, height: size.1)
  }
}

