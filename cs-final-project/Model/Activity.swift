//
//  Activity.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation

struct Activity: Identifiable {
    let id: UUID
    let startDate: String    
    let duration: String
    let distance: String
}

class ActivityModel: ObservableObject {
    @Published private var activities: [Activity] = []
    
    func getActivities() -> [Activity] {
        return activities
    }
    
    func addActivity(_ activity: Activity){
        activities.append(activity)
    }
    
    func fetchActivities() {
        HealthService.shared.fetchRunningWorkouts { results, error in
            guard let results, error == nil else {
                return
            }
                                    
            DispatchQueue.main.async {
                self.activities.append(contentsOf: results)
            }
        }
    }
}
