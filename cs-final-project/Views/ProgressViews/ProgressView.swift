//
//  HomeView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI
import RealmSwift

struct ProgressView: View {
    @ObservedRealmObject var activeChallenge: Challenge
    
    @ViewBuilder
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20){
                
                Text("active challenge")
                    .font(.footnote)
                Text(activeChallenge.name)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ProgressCardView(progressPercentage: activeChallenge.completionPercentage, progressText: activeChallenge.coveredDistance.inKilometerFormat(), goalText: activeChallenge.goalDistance.inKilometerFormat(), remainingText: activeChallenge.remainingDistance.inKilometerFormat())
                                                                                
                if let lastActivity = activeChallenge.activities.last {
                    HStack {
                        Text("Last Activity")
                            .font(.title)
                        Spacer()
                        NavigationLink("See all") {
                            ActivityLogView(activities: activeChallenge.activities)
                        }
                    }
                    
                    ActivityLogRowView(distance: lastActivity.distance.inKilometerFormat(), date: lastActivity.startDate.inFormatedText())
                }
                
            }
            .padding()
        }.onAppear {
            activeChallenge.fetchActivities()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(activeChallenge: DefaultChallenges.challenges.first!)
    }
}
