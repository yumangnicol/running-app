//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ActivityLogView: View {
    let activities: [Activity]
            
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your activities")
                .font(.title)
                .padding(20)
            
            List(activities) { activity in
                ActivityLogRowView(distance: activity.distanceAsText, date: activity.startDateAsText)
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
    }
}

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = [
            Activity(id: UUID(), startDate: Date.now, duration: 100.32, distance: 1000),
            Activity(id: UUID(), startDate: Date.now, duration: 200.32, distance: 32000)
        ]
        ActivityLogView(activities: activities)
    }
}
