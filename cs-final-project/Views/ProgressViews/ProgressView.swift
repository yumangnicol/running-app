//
//  HomeView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject var progressManager: ProgressManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text(progressManager.activeChallengeName)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 0.10, green: 0.16, blue: 0.34, opacity: 1.00))
                    .frame(maxHeight: 400)
                
                VStack(){
                    CircularProgressView(percentage: progressManager.progressPercentage, text: "\(progressManager.coveredDistance)")
                        .frame(maxWidth: 300, maxHeight: 300)
                    HStack(spacing: 100){
                        VStack{
                            Text("Goal")
                                .fontWeight(.heavy)
                            Text(progressManager.goalDistance)
                        }
                        VStack{
                            Text("Remaining")
                                .fontWeight(.heavy)
                            Text(progressManager.remainingDistance)
                        }
                    }
                }.padding()
            }.foregroundColor(.white)
            
            HStack {
                Text("Last Activity")
                    .font(.title)
                Spacer()
                NavigationLink("See all") {
                    ActivityLogView(activities: progressManager.getActivities())
                }
            }
                                    
            ActivityLogRowView(distance: "10KM", date: "This is a date")
            
            Button("Fetch!") {
                progressManager.fetchActivities()
            }
            
        }.padding()
//            .onAppear {
//                progressManager.fetchActivities()
//            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
