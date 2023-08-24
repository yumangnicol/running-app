//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI
import RealmSwift

struct ActivityLogView: View {
    @ObservedRealmObject var activities: RealmSwift.List<Activity>
            
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your activities")
                .font(.title)
                .padding(20)
            
            List(activities) { activity in
                ActivityLogRowView(distance: activity.distance.inKilometerFormat(), date: activity.startDate.inFormatedText())
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
    }
}

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = RealmSwift.List<Activity>()
        ActivityLogView(activities: activities)
    }
}
