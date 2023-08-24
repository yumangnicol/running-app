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
        
        // Sets the first app opening date
        if UserDefaults.standard.object(forKey: K.Keys.firstAppLaunch) == nil {
            UserDefaults.standard.set(Calendar.current.startOfDay(for: Date()), forKey: K.Keys.firstAppLaunch)
        }
        
        // Request authorization for HealthKit data
        HealthService.shared.requestAuthorization()
                
        // Set Realm Configuration and Initial Data
        RealmService().loadDefaultChallenges()
        return true
    }
}
