//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedResults(Challenge.self, where: { $0.status == .active }) var activeChallenges
    
    var body: some View {
        NavigationStack {            
            if let activeChallenge = activeChallenges.first {
                TabView{
                    ProgressView(activeChallenge: activeChallenge)
                        .tabItem {
                            Label("Progress", systemImage: "circle.dashed")
                        }
                    ChallengesView()
                        .tabItem {
                            Label("Challenges", systemImage: "trophy.fill")
                        }
                }
            } else {
                ChallengesView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
