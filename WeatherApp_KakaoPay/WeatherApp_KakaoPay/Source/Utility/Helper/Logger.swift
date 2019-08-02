import Foundation

public func logger(
    _ contents: Any,
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
    ) {
    
    let emoji = "👨‍💻"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    
  
    let fileUrl = URL(fileURLWithPath: file)
    
    // 확장자 지우고 파일 경로 마지막 이름만 표시하자. 폴더 구별 잘하게
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    
    //let header = header.isEmpty ? "" : "[ \(header) ] - "
    //let _ = contents.reduce("") { $0 + " " + String(describing: $1) }
    
    let str = """
    \(emoji) \(timestamp) \
    \(fileName) / \(function) / (\(line)) \
    \(emoji) \(String(describing: contents))
    """
  
    print(str)
}
