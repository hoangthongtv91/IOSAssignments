//
//  AppDelegate.swift
//  SimpleToDoApp
//
//  Created by Thong Hoang Nguyen on 2019-04-30.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var taskArray: [ToDo] = []
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let task1 = ToDo(title: "Doing homework", toDoDescription: "3 labs and 4 assignments", priority: 1, isCompleted: true)
        let task2 = ToDo(title: "Doing housework", toDoDescription: "laundry, sweeping, making the bed, cleaning", priority: 4, isCompleted: true)
        let task3 = ToDo(title: "Going to the market", toDoDescription: "Eggs, Milk, Toasts, Cheese, Butter, Bacon", priority: 2, isCompleted: true)
        let task4 = ToDo(title: "Going to the bank", toDoDescription: "Opening a new account, asking for the tax residency", priority: 3, isCompleted: false)
        let task5 = ToDo(title: "Go shopping", toDoDescription: "Shirts, pants, jackets, blazers", priority: 5, isCompleted: false)
        taskArray = [task1, task2, task3, task4, task5]
        
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

