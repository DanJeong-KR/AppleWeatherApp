import UIKit


// MARK: - AutoLayoutAnchor
/* 큰 구성
 - translatesAutoresizingMaskIntoConstraints 실수 방지하려고 layout 만들었고
 - 오토레이아웃 잡는 시간 아끼기 위해 연쇄적으로 잡으려고 반환값을 self 로 해서 만들었습니다.
 */
extension UIView {
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
        logger("\(ErrorLog.layout.message) : superview is nil")
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
        logger("\(ErrorLog.layout.message) : superview is nil")
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
        logger("\(ErrorLog.layout.message) : superview is nil")
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
        logger("\(ErrorLog.layout.message) : superview is nil")
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
        logger("\(ErrorLog.layout.message) : superview is nil")
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
        logger("\(ErrorLog.layout.message) : superview is nil")
        fatalError()
      }
    }
  
  public func equalToSuperView() {
    if let superview = superview {
      leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
      rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    } else {
      logger("\(ErrorLog.layout.message) : superview is nil")
      fatalError()
    }
  }
}
