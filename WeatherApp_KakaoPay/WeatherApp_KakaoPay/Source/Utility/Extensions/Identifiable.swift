//
//  Identifiable.swift
//  WeatherForecast
//
//  Created by chang sic jung on 18/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

protocol Identifiable {
    static var identifier: String { get }
    
}
// id 값을 자신의 타입 이름으로 설정되도록 하기 (class SomeCell: UITableViewCell 의 id 는 SomeCell)
extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}