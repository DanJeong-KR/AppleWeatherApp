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
  private lazy var currentWeatherView: CurrentWeatherHeaderView = {
    let v = CurrentWeatherHeaderView(frame: .zero)
    addSubview(v)
    return v
  }()
  
  private lazy var weatherTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.backgroundColor = .clear
    tv.rowHeight = 100
    tv.showsVerticalScrollIndicator = false
    tv.dataSource = self
    addSubview(tv)
    return tv
  }()
  
  internal var weatherViewHeightAnchor: NSLayoutConstraint?
  
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
  
  private func makeConstraints() {
//    currentWeatherView.layout.top().leading().trailing()
//    weatherViewHeightAnchor = currentWeatherView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.40)
//    weatherViewHeightAnchor?.isActive = true
    
    weatherTableView.layout.top().leading().trailing().bottom()
  }
}

// MARK: - TableView DataSource
extension WeatherCollectionCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "test"
    return cell
  }
  
  
}
