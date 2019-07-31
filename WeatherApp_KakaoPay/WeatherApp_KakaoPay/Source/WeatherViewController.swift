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
  private lazy var weatherCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
    c.register(cell: WeatherCollectionCell.self)
    c.dataSource = self
    c.delegate = self
    view.addSubview(c)
    return c
  }()

  // MARK: - VC LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - AutoLayout
  private func makeConstraints() {
    let guide = view.safeAreaLayoutGuide
    weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      weatherCollectionView.topAnchor.constraint(equalTo: guide.topAnchor),
      weatherCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      weatherCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      weatherCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      ])
  }

}


// MARK: - Collection DataSource
extension WeatherViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  
}

// MARK: - Collection FlowLayout and Delegate
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    
}
