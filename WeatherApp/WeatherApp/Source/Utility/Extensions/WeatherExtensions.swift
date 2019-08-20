//
//  DoubleExtensions.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 05/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

/// Weather app 에서만 사용할 Extensions를 구현합니다.
import Foundation

// MARK: - Dark Weather API의 값들의 format을 나에게 맞게 변경하기
extension Double {
  // 섭씨로 바꾸기 (온도에 필요)
  func convertToCelsiusIntoString() -> String {
    let celsius = (self - 32) / 1.8
    let result = Int(celsius.rounded(.down))
    return String(result)
  }
  
  // 요일 가져오기 (현재 위치 날씨, 요일별 날씨에 필요)
  func getWeekDayToString() -> String? {
    let date = Date(timeIntervalSince1970: self)
    let calendar = Calendar.current
    if let day = calendar.dateComponents([.weekday], from: date).weekday {
      switch day {
      case 1:
        return "일요일"
      case 2:
        return "월요일"
      case 3:
        return "화요일"
      case 4:
        return "수요일"
      case 5:
        return "목요일"
      case 6:
        return "금요일"
      case 7:
        return "토요일"
      default:
        break
      }
    }
    return nil
  }
  
  // 시간 가져오기 (시간별 예보에 필요)
  func getHourToString(_ isSunData: Bool) -> String {
    let date = Date(timeIntervalSince1970: self)
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ko_KR")
    if isSunData {
      dateFormatter.dateFormat = "a h:mm"
    }else {
      dateFormatter.dateFormat = "a h"
    }
    return dateFormatter.string(from: date)
  }
  
  // 소수점 %표시 바꾸기 (비 올 확률, 습도)
  func convertPercentageToStr() -> String {
    let result = Int((self * 100).rounded(.down))
    return String(result) + "%"
  }
  
  // 풍속 mile/hour -> m/s 로 바꾸기
  func convertWindFormatToStr() -> String {
    let meter = self * 1609.344
    let meterPerSecond = meter / 3600
    var result = -1 // 임시변수
    if meterPerSecond < 0 {
      return "error"
    } else if meterPerSecond < 1 {
      result = Int(meterPerSecond.rounded(.up))
    } else {
      result = Int(meterPerSecond.rounded(.up))
    }
    return String(result) + "m/s"
  }
  
  // 강수량 milimeter -> centimeter 로 바꾸기
  func convertMiliToCentiIntoStr() -> String {
    let result = Int((self * 10).rounded(.down))
    return String(result) + "cm"
  }
}


// MARK: - 부족한 날씨 아이콘을 대체하려는 목적
extension String {
  func checkWeatherIcon() -> String {
    if self == "clear-night" {
      return "clear-day"
    } else if self == "sleet" {
      return "snow"
    } else if self == "wind" || self == "fog" {
      return "cloudy"
    } else if self == "partly-cloudy-night" {
      return "partly-cloudy-day"
    } else {
      return self
    }
  }
}
