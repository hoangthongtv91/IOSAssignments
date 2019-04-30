//
//  AppDelegate.swift
//  WeatherTabBar
//
//  Created by Thong Hoang Nguyen on 2019-04-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var citiesVC: NSMutableArray = []
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let tabVC = UITabBarController()
        window?.rootViewController = tabVC
        
        let vancouver = City(name: "Vancouver", country: "Canada", temp: 15.5, icon: "canada", summary: "Rainy", weatherPhoto: "rainy")
        let tokyo = City(name: "Tokyo", country: "Japan", temp: 23, icon: "japan", summary: "Cloudy", weatherPhoto: "cloudy")
        let sao = City(name: "Sao Paulo", country: "Brazil", temp: 25, icon: "brazil", summary: "Sunny", weatherPhoto: "sunny")
        let madrid = City(name: "Madrid", country: "Spain", temp: 30, icon: "italy", summary: "Hot", weatherPhoto: "hot")
        
        let vanVC = CityViewController()
        vanVC.city = vancouver
        vanVC.backgroundImageView.image = UIImage(named: "vancouver")
        
        let tokVC = CityViewController()
        tokVC.city = tokyo
        tokVC.backgroundImageView.image = UIImage(named: "tokyo")
        
        let saoVC = CityViewController()
        saoVC.city = sao
        saoVC.backgroundImageView.image = UIImage(named: "sao_paulo")
        
        let madVC = CityViewController()
        madVC.city = madrid
        madVC.backgroundImageView.image = UIImage(named: "madrid")
        
        citiesVC = [vanVC, tokVC, saoVC, madVC]
        tabVC.viewControllers = citiesVC.map { UINavigationController(rootViewController: $0 as! UIViewController)}
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

