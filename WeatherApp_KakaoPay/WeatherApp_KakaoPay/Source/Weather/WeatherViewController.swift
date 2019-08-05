//
//  ViewController.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
  
  // MARK: Networking
  private let weatherService: WeatherServiceType = WeatherService()
  private var weather: Weather? {
    didSet {
      //print("weather : ",self.weather ?? "weather 비어있음")
    }
  }
  
  private var currently: Currently? {
    didSet {
      //print("currently 값 들어옴 / \(self.currently)")
      weatherCollectionView.reloadData()
      
    }
  }
  
  private var hourly: [Hourly]? {
    didSet {
      //print("hourly 값 들어옴 / \(self.hourly)")
      weatherCollectionView.reloadData()
    }
  }
  
  private var daily: [Daily]? {
    didSet {
      print("daily 값 들어옴 / \(self.daily)")
      weatherCollectionView.reloadData()
    }
  }
  
  // MARK: - Properties
  
  let subInfoTitles = ["일출", "일몰", "비 올 확률", "습도", "바람", "체감", "강수량", "기압", "가시거리", "자외선 지수"]
  
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
    weatherService.fetchCurrentlyData(latitude: 37.54335, longitude: 127.06062) {
      [weak self] result in
      guard let self = self else { return logger(ErrorLog.weakRef) }
      switch result {
      case .success(let value):
        self.currently = value
      case .failure(let error):
        logger(error.localizedDescription)
      }
    }
    
    weatherService.fetchHourlyData(latitude: 37.54335, longitude: 127.06062) {
      [weak self] result in
      guard let self = self else { return logger(ErrorLog.weakRef) }
      switch result {
      case .success(let value):
        self.hourly = value
      case .failure(let error):
        logger(error.localizedDescription)
      }
    }
    
    weatherService.fetchDailyData(latitude: 37.54335, longitude: 127.06062) {
      [weak self] result in
      guard let self = self else { return logger(ErrorLog.weakRef) }
      switch result {
      case .success(let value):
        self.daily = value
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
    if let currently = currently,
      let daily = daily,
      let hourly = hourly {
      // Currently
      cell.currentLocationWeatherView.configureCurrentWeather(location: "창식동",
                                                              summary: currently.summary,
                                                              temperature: currently.temperature,
                                                              day: currently.time,
                                                              maxTemperature: daily.first!.temperatureMax,
                                                              minTemperature: daily.first!.temperatureMin
      )
      // Hourly
      cell.locationWeatherCollectionView.headerDidLoad = {
        header in
        header.hourlyCollectionView.hourlyCellDidLoad = {
          hourlycell, hourlyIndexPath in
          hourlycell.configureCell(hour: hourly[hourlyIndexPath.item].time,
                             icon: hourly[hourlyIndexPath.item].icon,
                             temperature: hourly[hourlyIndexPath.item].temperature)
        }
      }
      
      // Daily
      cell.locationWeatherCollectionView.firstCollectionCellDidLoad = {
        firstCell in
        firstCell.dailyWeatherCollectionView.dailyWeatherCollectionCellDidLoad = {
          dailyCell, dailyIndexPath in
          dailyCell.configureCell(day: daily[dailyIndexPath.item].time,
                                  icon: daily[dailyIndexPath.item].icon,
                                  maxTemperature: daily[dailyIndexPath.item].temperatureMax,
                                  minTemperature: daily[dailyIndexPath.item].temperatureMin)
        }
      }
      
      // Summary
      cell.locationWeatherCollectionView.secondCollectionCellDidLoad = {
        secondCell in
        secondCell.configureCell(summary: currently.summary,
                                 temperature: currently.temperature,
                                 maxTemperature: daily.first!.temperatureMax)
      }
      
      // SubInfo
      cell.locationWeatherCollectionView.thirdCollectionCellDidLoad = {
        thirdCell in
        thirdCell.subInfoCollectionView.subInfoCollectionCellDidLoad = {
          infoCell, infoIndexPath in
          infoCell.configureCell(topText: self.subInfoTitles[infoIndexPath.item],
                                 bottomText: "오전 5:38")
        }
      }
      
      
    }
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

