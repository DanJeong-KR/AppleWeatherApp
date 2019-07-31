import Foundation

public func logger(
    _ contents: Any..., // ... 뒤에 몇개가 들어와도 상관없다는 키워드
    header: String = "", // Any... 뒤 파라미터가 외부 파라미터가 하나 와서 ... 과 구별해주어야 한다.
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
    ) {
    
    let emoji = "👨‍💻"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    
    
    
    
    let fileUrl = URL(fileURLWithPath: file)
    
    // deletingPathExtension 확장자 지우기
    // lastPathComponent 경로의 마지막 파일 이름
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    
    let header = header.isEmpty ? "" : "[ \(header) ] - "
    let _ = contents.reduce("") { $0 + " " + String(describing: $1) }
    
    let str = """
    \(emoji) \(timestamp) \
    \(fileName) / \(function) / (\(line)) \
    \(emoji) \(header)\(contents)
    """
    
    //print("\(file) / \(function) / (\(line)) \(header)\(contents)")
    print(str)
}
