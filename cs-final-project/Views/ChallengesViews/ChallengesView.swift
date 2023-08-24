//
//  ChallengesView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI
import RealmSwift

struct ChallengesView: View {
    @ObservedResults(Challenge.self, where: { $0.status == ChallengeStatus.active }) var activeChallenges
    @ObservedResults(Challenge.self, where: { $0.status == ChallengeStatus.complete }) var completedChallenges
    @ObservedResults(Challenge.self, where: { $0.status == ChallengeStatus.incomplete}) var incompleteChallenges
    
    var body: some View {
        VStack {
            Text("Active Challenges")
            List(activeChallenges) { challenge in
                VStack {
                    Button("\(challenge.name): \(challenge.goalDistance)") {
                        challenge.toggleStatus()
                    }
                }
            }
            
            Text("Available Challenges")
            List(incompleteChallenges) { challenge in
                VStack {
                    Button("\(challenge.name): \(challenge.goalDistance)") {
                        challenge.toggleStatus()
                    }.disabled(!activeChallenges.isEmpty)
                }
            }
            
            Text("Completed Challenges")
            List(completedChallenges) { challenge in
                VStack {
                    Button("\(challenge.name): \(challenge.goalDistance)") {
                        challenge.toggleStatus()
                    }
                }
            }
            
        }
        
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
