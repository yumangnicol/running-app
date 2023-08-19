//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var progressManager: ProgressManager
    
    var body: some View {
        NavigationStack {
            TabView {
                ProgressView()
                    .tabItem {
                        Label("Progress", systemImage: "circle.dashed")
                    }.environmentObject(progressManager)
                
                ChallengesView()
                    .tabItem {
                        Label("Challenges", systemImage: "trophy.fill")
                    }
            }
        }.onAppear {
            HealthService.shared.requestAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
