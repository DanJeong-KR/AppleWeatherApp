//
//  WeatherToolBar.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class WeatherToolBar: UIToolbar {
  
  // MARK: - Properties
  private lazy var detailWeatherButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.backgroundColor = .yellow
    bt.setTitle("test", for: .normal)
    bt.id = ButtonID.detailWeatherButton.id
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    addSubview(bt)
    return bt
  }()
  
  private lazy var locationListButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.backgroundColor = .yellow
    bt.setTitle("test", for: .normal)
    bt.id = ButtonID.locationListButton.id
    bt.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    addSubview(bt)
    return bt
  }()
  
  private lazy var pageControl: UIPageControl = {
    let pc = UIPageControl(frame: .zero)
    pc.numberOfPages = 3
    pc.currentPageIndicatorTintColor = .white
    pc.pageIndicatorTintColor = .gray
    addSubview(pc)
    return pc
  }()
  
  // MARK: - Callback
  internal var detailWeatherButtonDidTap: (() -> ())?
  internal var locationListButtonDidTap: (() -> ())?
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    barTintColor = #colorLiteral(red: 1.034923662e-05, green: 0.0002555906831, blue: 0.007866344415, alpha: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit)
  }
  
  // MARK: - Layout Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  
  private func makeConstraints() {
    let guide = self.safeAreaLayoutGuide
    detailWeatherButton.layout.centerY().leading(equalTo: guide.leadingAnchor, constant: 10)
    locationListButton.layout.centerY().trailing(equalTo: guide.trailingAnchor, constant: -10)
    pageControl.layout.centerX().centerY()
  }
  
  // MARK: - Action Methods
  @objc private func buttonDidTap(_ sender: UIButton) {
    switch sender.id {
    case ButtonID.detailWeatherButton.id:
      print("detailWeatherButton 버튼 클릭")
      if let detailWeatherButtonDidTap = detailWeatherButtonDidTap {
        detailWeatherButtonDidTap()
      }else {
        logger(ErrorLog.callback)
      }
    case ButtonID.locationListButton.id:
      print("locationListButton 버튼 클릭")
      if let locationListButtonDidTap = locationListButtonDidTap {
        locationListButtonDidTap()
      }else {
        logger(ErrorLog.callback)
      }
    default:
      break
    }
  }
}
