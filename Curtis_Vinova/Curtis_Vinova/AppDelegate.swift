//
//  AppDelegate.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/17/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let itemCal = UITabBarItem()
        //item.title = "Calculator"
        itemCal.image = UIImage(named: "calculator")
        let calculator = CalculatorViewController()
        calculator.tabBarItem = itemCal
        
        let itemTable = UITabBarItem()
        //itemCircle.title = "Info"
        itemTable.image = UIImage(named: "person")
        let tableView = TableViewController()
        tableView.tabBarItem = itemTable
        
        let itemPro = UITabBarItem()
        //item.title = "Calculator"
        itemPro.image = UIImage(named: "processing")
        let processing = CalculatorViewController()
        processing.tabBarItem = itemPro
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [calculator, tableView, processing]
        tabBarController.selectedViewController = calculator
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Trello")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
}

