//
//  cs_final_projectApp.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

@main
struct cs_final_projectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate    
    @StateObject var progressManager = ProgressManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressManager)
                .onAppear(){
                    HealthService.shared.requestAuthorization()
                }
        }
    }
}
