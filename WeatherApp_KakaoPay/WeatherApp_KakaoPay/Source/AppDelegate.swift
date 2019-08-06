//
//  AppDelegate.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    window?.rootViewController = WeatherViewController()
//    window?.rootViewController = MyWeatherListViewController()
    
    return true
  }



}

