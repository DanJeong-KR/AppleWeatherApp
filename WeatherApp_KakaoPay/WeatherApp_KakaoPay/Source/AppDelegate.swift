

/**
평가해주셔서 감사합니다.
 * Apple 날씨 앱을 만들었습니다.
* 프로젝트 제출 후 Github repo를 privacy -> Public 으로 전환하여 앱을 어떻게 디자인했는지 큰 구성을 보실 수 있습니다.
* 디자인은 마인드 맵(심플 마인드 프로그램)입니다.
* 과제 중간에 수시로 Commit을 Message 규칙을 정해놓고 했기 때문에 Commit Log로도 중간 단계를 확인할 수 있습니다.
* 사용 API 는 Dark Weather API 입니다.
https://github.com/changSic/Kakaopay_internship

*/
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    window?.rootViewController = WeatherViewController()
    
    // MARK: - Get Saved Data
    if let locationData = UserDefaults.standard.object(forKey: "location") as? Data,
      let decodedData = try? JSONDecoder().decode([Location].self, from: locationData),
      !locationData.isEmpty {
      DataManager.shared.setLocation(decodedData)
    } else {
      logger(ErrorLog.userDefaults)
    }
    return true
  }
  
  
  // MARK: - Background - Save Data at userdefaults
  func applicationDidEnterBackground(_ application: UIApplication) {
    let locationData = DataManager.shared.getLocation()
    if let encoded = try? JSONEncoder().encode(locationData) {
      UserDefaults.standard.set(encoded, forKey: "location")
    } else {
      logger(ErrorLog.userDefaults)
    }
  }

}

