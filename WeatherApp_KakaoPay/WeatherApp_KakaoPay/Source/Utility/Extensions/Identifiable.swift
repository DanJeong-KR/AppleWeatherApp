import Foundation

public protocol Identifiable {
    static var identifier: String { get }
    
}
// id 값을 자신의 타입 이름으로 설정되도록 하기 (class SomeCell: UITableViewCell 의 id 는 SomeCell)
extension Identifiable {
  public static var identifier: String {
        return String(describing: self)
    }
}
