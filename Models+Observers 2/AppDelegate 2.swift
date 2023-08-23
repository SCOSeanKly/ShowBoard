//
//  AppDelegate.swift
//  ShowBoard
//
//  Created by Szigeti József on 03.08.23.
//

import Foundation

import Foundation
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
    
    // This class is the heart of the app and we need an instance first
    var appModel: AppModel = AppModel()
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppModel.shared = appModel
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    
    func application( _ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
    }
}
