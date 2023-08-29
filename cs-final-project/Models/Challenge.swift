//
//  Challenge.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/17/23.
//

import Foundation
import RealmSwift

/// A model that represents a running challenge.
class Challenge: Object, ObjectKeyIdentifiable {
    /// The unique identifier of the challenge.
    @Persisted(primaryKey: true) var id: ObjectId
    /// The name of the running challenge
    @Persisted var name: String
    /// The distance goal of the running challenge.
    @Persisted var goalDistance: Double
    /// The status of the running challenge
    @Persisted var status = ChallengeStatus.incomplete
    /// The list of running activities that are associated with achieving the challenge.
    @Persisted var activities = List<Activity>()
}

//MARK: - Computed Properties

extension Challenge {
    /// The percentage of the coveredDistance against the goalDistance.
    var completionPercentage: Double {
        return self.coveredDistance / self.goalDistance
    }
              
    /// The total distance collected from all the activities.
    var coveredDistance: Double {
        return self.activities.reduce(0) { $0 + $1.distance }
    }
    
    /// The remaning distance before the goalDistance is reached.
    var remainingDistance: Double {
        return self.goalDistance - self.coveredDistance
    }        
}

//MARK: - Mutators

extension Challenge {
    /// Starts the challenge and changes challenge's the status to from incomplete to active.
    func startChallenge() {
        let realm = try! Realm()
        guard let thawed = self.thaw(), self.status == .incomplete else {
            return
        }
        try! realm.write {
            thawed.status = .active
        }
    }
    
    /// Ends the challenge and changes the challenge's status to from active to completed.
    func completeChallenge() {
        let realm = try! Realm()
        guard let thawed = self.thaw(), self.status == .active else {
            return
        }
        try! realm.write {
            thawed.status = .complete
        }
    }
        
    /// Retrieves running activities from HealthKit and appends it to the activities list
    /// Triggers the completeChallenge() function, if the remainingDistance after the activities are appended
    /// will be less than or equal to 0.
    func fetchActivities() {
        HealthService.shared.fetchRunningWorkouts { results, error in
            guard let results, error == nil else {
                return
            }
            
            let realm = try! Realm()
            let challenge = realm.object(ofType: Challenge.self, forPrimaryKey: self.id)!
                        
            try! realm.write {
                challenge.activities.append(objectsIn: results)
            }
            
            if self.remainingDistance.isLessThanOrEqualTo(0) {
                self.completeChallenge()
            }
        }
    }
}
