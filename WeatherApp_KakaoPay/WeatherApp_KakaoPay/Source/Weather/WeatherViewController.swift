//
//  ViewController.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit
import CoreLocation

final class WeatherViewController: UIViewController {
  
  // MARK: - DataModel Properties
  private var weather: [Weather]? {
    return DataManager.shared.getWeather()
  }
  
  internal var subInfoTitles = ["일출", "비 올 확률", "바람", "강수량", "가시거리", "일몰", "습도", "체감", "기압", "자외선 지수"]
  
  internal var subInfoValues: [[String]] {
    return DataManager.shared.getSubInfoValues()
  }
  
  // MARK: - Location Properties
  private let locationManager = CLLocationManager()
  
  // 지금으로 부터 10초 전 (특정 시점의 위치 정보를 받기 위함)
  private var lastRequestDate = Date(timeIntervalSinceNow: -10)
  
  // MARK: - Properties
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  private let backgroundImageView: UIImageView = {
    let iv = UIImageView(frame: ScreenBounds.bounds)
    iv.image = UIImage(named: "night")
    iv.contentMode = .scaleToFill
    return iv
  }()
  
  internal lazy var weatherCollectionView: UICollectionView = {
    // init
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.scrollDirection = .horizontal
    let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    c.register(cell: WeatherCollectionCell.self)
    c.dataSource = self
    c.delegate = self
    
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
  
  internal lazy var pageControl: UIPageControl = {
    let pc = UIPageControl(frame: .zero)
    pc.numberOfPages = 1
    pc.currentPageIndicatorTintColor = .white
    pc.pageIndicatorTintColor = .gray
    weatherToolBar.addSubview(pc)
    return pc
  }()

  // MARK: - VC LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(backgroundImageView) // 가장 처음에 addsubView 하기 위해 앞에 배치.
    configureLocationManager()
    weatherToolBarCallback()
    configureReloadObserver()
    makeConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 사용자 위치정보 체크
    requestLocationAuthorization()
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
      self.weatherCollectionView.reloadData()
      self.pageControl.numberOfPages = self.weather?.count ?? 1
    }
  }
  
  // MARK: - Callbacks : ToolBar Button Action
  private func weatherToolBarCallback() {
    weatherToolBar.locationListButtonDidTap = {
      self.present(MyWeatherListViewController(), animated: true, completion: nil)
    }
    weatherToolBar.detailWeatherButtonDidTap = {
      guard let url = URL(string: "https://weather.com/ko-KR/weather/today/l/Seodaemun+gu+Seoul?canonicalCityId=41c20b9e59a1464c5b8d316200c6deb511ff191cf1fadb295f52bf3b6b7b5642"),
        UIApplication.shared.canOpenURL(url) else {
          return logger("Can't open Safari App")
      }
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
  
  // MARK: - Location Methods
  private func configureLocationManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    locationManager.delegate = self
  }
  
  // 위치서비스 권한 받기
  private func requestLocationAuthorization() {
    guard CLLocationManager.locationServicesEnabled() else {
      return self.showAlert("앱을 사용하기 위해서는 위치 권한이 필요합니다.")
    }
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      break
    case .authorizedAlways, .authorizedWhenInUse:
      break
    default:
      self.showAlert("앱을 사용하기 위해서는 위치 권한이 필요합니다.")
    }
  }
  
  // MARK: - Layout
  private func makeConstraints() {
    weatherCollectionView.layout.top().leading().trailing()
    weatherToolBar.layout.top(equalTo: weatherCollectionView.bottomAnchor).leading().trailing().bottom()
    pageControl.layout.centerX().centerY()
  }

}


// MARK: - Collection DataSource
extension WeatherViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weather?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeue(WeatherCollectionCell.self, indexPath)
    if let weather = weather, let dailyFirst = weather[indexPath.row].daily.first {
      let weatherIndex = weather[indexPath.row]
      let currently = weather[indexPath.row].currently
      let hourly = weather[indexPath.row].hourly
      let daily = weather[indexPath.row].daily
      // Currently
      cell.currentLocationWeatherView.configureCurrentWeather(
        location: weatherIndex.locationInfo ?? "",
        summary: currently.summary,
        temperature: currently.temperature,
        day: currently.time,
        maxTemperature: dailyFirst.temperatureMax,
        minTemperature: daily.first!.temperatureMin
      )
      
      // Hourly CallBack
      cell.locationWeatherCollectionView.headerDidLoad = {
        header in
        header.hourlyCollectionView.hourlyCellDidLoad = {
          hourlycell, hourlyIndexPath in
          hourlycell.configureCell(hour: hourly[hourlyIndexPath.item].time,
                             icon: hourly[hourlyIndexPath.item].icon,
                             temperature: hourly[hourlyIndexPath.item].temperature)
        }
      }
      
      // Daily Callback
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
      
      // Summary Callback
      cell.locationWeatherCollectionView.secondCollectionCellDidLoad = {
        secondCell in
        secondCell.configureCell(summary: currently.summary,
                                 temperature: currently.temperature,
                                 maxTemperature: dailyFirst.temperatureMax)
      }
      
      // SubInfo Callback
      cell.locationWeatherCollectionView.thirdCollectionCellDidLoad = {
        thirdCell in
        thirdCell.subInfoCollectionView.subInfoCollectionCellDidLoad = {
          [weak self] infoCell, infoIndexPath in // 클로저 안에서 self 참조하면 Retain Cycle Issue 가능성
          guard let self = self else { return logger(ErrorLog.retainCycle) }
          infoCell.configureCell(topText: self.subInfoTitles[infoIndexPath.item],
                                 bottomText: self.subInfoValues[indexPath.item][infoIndexPath.item])
        }
      }
      cell.locationWeatherCollectionView.reloadData()
      
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
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let currentPageIndex = Int(scrollView.contentOffset.x / ScreenBounds.width)
    print("currentPageIndex : \(currentPageIndex)")
    pageControl.currentPage = currentPageIndex
  }
}

// MARK: - Location Delegate
extension WeatherViewController: CLLocationManagerDelegate {
  
  // location 받지 못했을 때
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    logger(error.localizedDescription)
  }
  
  // 위치 권한이 바뀌는 상황 대비
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      manager.startUpdatingLocation()
    default:
      break
    }
  }
  
  // 위치 정보 받기
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // 정보 배열로(여러 개) 들어오니까 가장 최신인 마지막 것 쓰자
    guard let location = locations.last else { return logger(ErrorLog.unwrap) }
    
    guard abs(location.timestamp.timeIntervalSinceNow) < 5 else {
      return logger("5초가 지난 위치 정보는 버립니다.")
    }
    manager.stopUpdatingLocation()
    
    let currentDate = Date()
    
    // 최초 정보와 시간 차가 2초 이상 날 때만 데이터 업데이트 시킬 생각
    if abs(lastRequestDate.timeIntervalSince(currentDate)) > 2 {
      // location 정보를 통해 네트워크로 날씨정보 가져오기
      DataManager.shared.fetchCurrentWeather(from: location.coordinate) {
        // 날씨 정보 먼저 받고 이후에 위치 정보 받는다. (weather 데이터의 첫 데이터는 현재위치로 설정하기 위함)
        self.getLocationInfoByreverseGeocoding(location: location) // 현재위치 지역이름 가져오기
        DataManager.shared.synchronizeData()
      }
      lastRequestDate = currentDate
    }
  }
  
  private func getLocationInfoByreverseGeocoding(location: CLLocation){
    
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
      guard error == nil else { return logger(error!.localizedDescription) }
      guard let place = placemarks?.first else { return }
      
      let locality = place.locality //  중구
      let subLocality = place.subLocality // 신당동
      DataManager.shared.setCurrentLocationInfo(locality ?? subLocality ?? "")

    }
  }
  
  
}
