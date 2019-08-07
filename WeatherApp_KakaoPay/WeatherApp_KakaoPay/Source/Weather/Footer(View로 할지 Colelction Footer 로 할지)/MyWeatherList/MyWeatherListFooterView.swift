//
//  MyWeatherListFooterView.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 03/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class MyWeatherListFooterView: UICollectionReusableView {
  
  // MARK: - Properties
  private lazy var celsiusButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.setTitle("°C", for: .normal)
    bt.setTitleColor(WeatherColor.mainTextColor, for: .selected)
    bt.setTitleColor(WeatherColor.subTextColor, for: .normal)
    bt.titleLabel?.font = WeatherFont.day
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    bt.id = ButtonID.celsiusButton.id
    addSubview(bt)
    return bt
  }()
  
  private lazy var fahrenheitButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.setTitle("°F", for: .normal)
    bt.setTitleColor(WeatherColor.mainTextColor, for: .selected)
    bt.setTitleColor(WeatherColor.subTextColor, for: .normal)
    bt.titleLabel?.font = WeatherFont.day
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    bt.id = ButtonID.fahrenheitButton.id
    addSubview(bt)
    return bt
  }()
  
  private lazy var plusButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.setTitle("+", for: .normal)
    bt.setTitleColor(WeatherColor.subTextColor, for: .normal)
    bt.titleLabel?.font = WeatherFont.day
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    bt.id = ButtonID.plusButton.id
    addSubview(bt)
    return bt
  }()
  
  private lazy var detailWeatherButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.backgroundColor = .yellow
    bt.setTitle("test", for: .normal)
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    bt.id = ButtonID.detailWeatherButton.id
    addSubview(bt)
    return bt
  }()
  
  // MARK: - Callbacks
  internal var plusButtonDidTap: (() -> ())?
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    makeConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - Layout Methods
  private func makeConstraints() {
    celsiusButton.layout.top(constant: WeatherLayout.topPadding).leading(constant: WeatherLayout.leftPadding)
    fahrenheitButton.layout.top(constant: WeatherLayout.topPadding).leading(equalTo: celsiusButton.trailingAnchor, constant: 20)
    detailWeatherButton.layout.centerX().centerY()
    plusButton.layout.top(constant: WeatherLayout.topPadding).trailing(constant: WeatherLayout.rightPadding)
  }
  
  // MARK: - Action Methods
  @objc private func buttonDidTap(_ sender: UIButton) {
    switch sender.id {
    case ButtonID.celsiusButton.id:
      print("celsiusButton 클릭")
    case ButtonID.fahrenheitButton.id:
      print("fahrenheitButton 클릭")
    case ButtonID.detailWeatherButton.id:
      print("detailWeatherButton 클릭")
      openSafariForDetial()
    case ButtonID.plusButton.id:
      print("plusButton 클릭")
      if let plusButtonDidTap = plusButtonDidTap {
        plusButtonDidTap()
      } else {
        logger(ErrorLog.callback)
      }
      
    default:
      break
    }
  }
  
  private func openSafariForDetial() {
    guard let url = URL(string: "https://weather.com/ko-KR/weather/today/l/Seodaemun+gu+Seoul?canonicalCityId=41c20b9e59a1464c5b8d316200c6deb511ff191cf1fadb295f52bf3b6b7b5642"),
      UIApplication.shared.canOpenURL(url) else {
        return logger("Can't open Safari App")
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
}
