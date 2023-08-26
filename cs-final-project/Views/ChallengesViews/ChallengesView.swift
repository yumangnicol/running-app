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
    
    @State private var isPresentingConfirm: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Available Challenges")
                .font(.title)
                .padding(.leading, 30)
            List(incompleteChallenges) { challenge in
                Button {
                    isPresentingConfirm = true
                } label: {
                    ChallengeRowView(name: challenge.name, distance: challenge.goalDistance.inKilometerFormat())
                }.confirmationDialog("Start Challenge", isPresented: $isPresentingConfirm) {
                    Button("Let's do it!") {
                        challenge.startChallenge()
                    }
                } message: {
                    Text("Are you ready to take on this challenge?")
                }
                .listRowSeparator(.hidden)
                .disabled(!activeChallenges.isEmpty)
            }
            .listStyle(.plain)
            .frame(minHeight: UIScreen.main.bounds.height * 0.55)
            
            Group{
                Text("Completed Challenges")
                    .font(.title)
                    .padding(.leading, 30)
                List(completedChallenges) { challenge in
                    ChallengeRowView(name: challenge.name, distance: challenge.goalDistance.inKilometerFormat())
                }
                .listStyle(.plain)
            }
            .isHidden(completedChallenges.isEmpty)
        }
        
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
