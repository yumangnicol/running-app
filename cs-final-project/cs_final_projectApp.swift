//
//  cs_final_projectApp.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

@main
struct cs_final_projectApp: App {
    @StateObject var activityModel = ActivityModel()
    @StateObject var healthService = HealthService()
    
    var body: some Scene {
        WindowGroup {
            ActivityLogView()
                .environmentObject(activityModel)
        }
    }
}
