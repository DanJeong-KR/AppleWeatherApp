//
//  UIVIew.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 04/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

// MARK: - AutoLayoutAnchor
/* 큰 구성
 - translatesAutoresizingMaskIntoConstraints 실수 방지하려고 layout 만들기
 - SnapKit 처럼 오토레이웃 잡으려고 반환값을 self 로 해서 만들기
 */
public extension UIView {
  var layout: UIView {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
  
  // warning(노란색) 이 뜨지 않게 하려구
  @discardableResult
  func top(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.topAnchor
      topAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  @discardableResult
  func leading(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.leadingAnchor
      leadingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  @discardableResult
  func bottom(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.bottomAnchor
      bottomAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  @discardableResult
  func trailing(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.trailingAnchor
      trailingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  @discardableResult
  func centerY(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.centerYAnchor
      centerYAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  @discardableResult
  func centerX(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
    if let superview = superview {
      let anchor = anchor ?? superview.safeAreaLayoutGuide.centerXAnchor
      centerXAnchor.constraint(equalTo: anchor, constant: c).isActive = true
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  
  @discardableResult
  func height(equalTo anchor: NSLayoutDimension? = nil, constant c: CGFloat = 0, multiplier m: CGFloat = 1) -> Self {
    if let superview = superview {
      if c == 0 {
        let anchor = anchor ?? superview.safeAreaLayoutGuide.heightAnchor
        heightAnchor.constraint(equalTo: anchor, multiplier: m, constant: c).isActive = true
      } else {
        // FIXME: - contant 에 값을 주면 전체 높이에서 계산되는 문제
        heightAnchor.constraint(equalToConstant: c).isActive = true
      }
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  
  @discardableResult
  func width(equalTo anchor: NSLayoutDimension? = nil, constant c: CGFloat = 0, multiplier m: CGFloat = 1) -> Self {
    if let superview = superview {
      if c == 0 {
        let anchor = anchor ?? superview.safeAreaLayoutGuide.heightAnchor
        heightAnchor.constraint(equalTo: anchor, multiplier: m, constant: c).isActive = true
      } else {
        heightAnchor.constraint(equalToConstant: c).isActive = true
      }
      return self
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  
  func equalToSuperView() {
    if let superview = superview {
      leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
      rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    } else {
      logger("\(ErrorLog.layout) : superview is nil")
      fatalError()
    }
  }
  
  func setImageSize(with constant: CGFloat) {
    heightAnchor.constraint(equalToConstant: constant).isActive = true
    widthAnchor.constraint(equalToConstant: constant).isActive = true
  }
}
