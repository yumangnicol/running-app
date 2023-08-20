//
//  ProgressManager.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/17/23.
//

import Foundation


class ProgressManager: ObservableObject {
    @Published private(set) var activeChallenge: Challenge? = Challenge(id: UUID(), name: "Run to Mordor", goalDistance: 15000)
    
    @Published private var activities: [Activity] = []
    
    var activeChallengeName: String {
        return activeChallenge?.name ?? ""
    }
    
    var goalDistance: String {
        guard let activeChallenge else {
            return ""
        }
        return String(format: K.distanceInKilometerFormat, activeChallenge.goalDistance)
    }
    
    var coveredDistance: Double {
        return activities.reduce(0) { $0 + $1.distance }        
    }
    
    var remainingDistance: String {
        guard let activeChallenge else {
            return ""
        }
        return String(format: K.distanceInKilometerFormat, activeChallenge.goalDistance - coveredDistance)
    }
    
    var progressPercentage: Double {
        guard let activeChallenge = activeChallenge else {
            return 0
        }
        return coveredDistance / activeChallenge.goalDistance
    }
    
    func startChallenge(_ challenge: Challenge) {
        activeChallenge = challenge
    }
    
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
                print("PRINTING RESULTS")
                print(results)
                self.activities.append(contentsOf: results)
            }
        }
    }
}
