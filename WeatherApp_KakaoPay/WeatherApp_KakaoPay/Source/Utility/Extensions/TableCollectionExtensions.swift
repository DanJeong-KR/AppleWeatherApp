//
//  TableCollectionExtensions.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

// 두 셀 타입 모두 Identifiable 프로토콜 채택시킨다.
extension UITableViewCell: Identifiable { }
//extension UICollectionViewCell: Identifiable { }
extension UICollectionReusableView: Identifiable { }


// register : 타입만 받아서 cell 간편하게 등록해줌
// dequeue : as? 쓰지 않아도 자기 자신의 타입과 cell id 로 자동으로 반환하게 해주는 아이
extension UITableView {
  // regiser 가 제네릭 타입 이라 Identifiable 프로토콜 을 채택하지 않은 Cell 이 들어올 수 있는 변수 때문에 where 로 제한할 것.
  func register<Cell>(
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
    ) where Cell: UITableViewCell {
    register(cell, forCellReuseIdentifier: reuseIdentifier)
  }
  
  func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell where Cell: UITableViewCell {
    guard let cell = dequeueReusableCell(
      withIdentifier: reusableCell.identifier
      ) as? Cell else { fatalError("Could not find cell with identifier") }
    return cell
  }
}

extension UICollectionView {
  func register<Cell> (
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
    ) where Cell: UICollectionViewCell {
    register(cell, forCellWithReuseIdentifier: reuseIdentifier)
  }
  
  func dequeue<Cell>(
    _ reusableCell: Cell.Type,
    _ indexpath: IndexPath) -> Cell where Cell: UICollectionViewCell {
    guard let cell = dequeueReusableCell(withReuseIdentifier: reusableCell.identifier, for: indexpath) as? Cell else { fatalError("Could not find cell with identifier") }
    return cell
  }
}

