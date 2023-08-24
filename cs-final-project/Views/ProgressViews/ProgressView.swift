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
                
                Text(activeChallenge.name)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.10, green: 0.16, blue: 0.34, opacity: 1.00))
                        .frame(maxHeight: 400)
                    
                    VStack(){
                        CircularProgressView(percentage: activeChallenge.completionPercentage, text:  activeChallenge.coveredDistance.inKilometerFormat())
                            .frame(maxWidth: 300, maxHeight: 300)
                        HStack(spacing: 100){
                            VStack{
                                Text("Goal")
                                    .fontWeight(.heavy)
                                Text(activeChallenge.goalDistance.inKilometerFormat())
                            }
                            VStack{
                                Text("Remaining")
                                    .fontWeight(.heavy)
                                Text(activeChallenge.remainingDistance.inKilometerFormat())
                            }
                        }
                    }.padding()
                }.foregroundColor(.white)
                
                HStack {
                    Text("Last Activity")
                        .font(.title)
                    Spacer()
                    NavigationLink("See all") {
                        ActivityLogView(activities: activeChallenge.activities)
                    }
                }
                                        
                ActivityLogRowView(distance: "10KM", date: "This is a date")
                
                Button("Fetch!") {
                    activeChallenge.fetchActivities()
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
        let first10K = Challenge(value: ["name": "First 10K", "goalDistance": 10000.00, "status": ChallengeStatus.incomplete] as [String : Any])
        ProgressView(activeChallenge: first10K)
    }
}
