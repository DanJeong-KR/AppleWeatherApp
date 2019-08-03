//
//  SecondCollectionCell.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SecondCollectionCell: UICollectionViewCell {
  
  // MARK: - Properties
  private lazy var weatherTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.backgroundColor = .yellow
    
    tv.dataSource = self
    addSubview(tv)
    return tv
  }()
  
  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }
  private func makeConstraints() {
    weatherTableView.layout.top().bottom().leading().trailing()
  }
}


extension SecondCollectionCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "test"
    
    return cell
  }
  
  
}
