//
//  WeatherToolBar.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class WeatherToolBar: UIToolbar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  private lazy var detailWeatherButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.backgroundColor = .yellow
    bt.setTitle("test", for: .normal)
    addSubview(bt)
    return bt
  }()
  
  private lazy var locationListButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.backgroundColor = .yellow
    bt.setTitle("test", for: .normal)
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    barTintColor = #colorLiteral(red: 1.034923662e-05, green: 0.0002555906831, blue: 0.007866344415, alpha: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLog.coderInit.message)
  }
  
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

}
