//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ActivityLogView: View {
//    @ObservedObject var viewModel = ActivityLogViewModel()
    @EnvironmentObject var activityModel: ActivityModel
            
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your activities")
                .font(.title)
                .padding(20)
            
            List(activityModel.getActivities()) { activity in
                ActivityCellView(distance: activity.distance, date: activity.startDate)
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .onAppear {
                HealthService.shared.requestAuthorization()
                activityModel.fetchActivities()
            }
        }
    }
}

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLogView()
    }
}
