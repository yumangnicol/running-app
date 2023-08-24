//
//  AppDelegate.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/19/23.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if UserDefaults.standard.object(forKey: K.Keys.firstAppLaunch) == nil {
            // Set the first app opening date
            UserDefaults.standard.set(Calendar.current.startOfDay(for: Date()), forKey: K.Keys.firstAppLaunch)
        }
        HealthService.shared.requestAuthorization()
        return true
    }
}
