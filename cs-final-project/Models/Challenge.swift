//
//  Challenge.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/17/23.
//

import Foundation
import RealmSwift


class Challenge: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var goalDistance: Double
    @Persisted var status = ChallengeStatus.incomplete
    @Persisted var activities = List<Activity>()
}

//MARK: - Computed Properties

extension Challenge {
    var completionPercentage: Double {
        return self.coveredDistance / self.goalDistance
    }
                
    var coveredDistance: Double {
        return self.activities.reduce(0) { $0 + $1.distance }
    }
    
    var remainingDistance: Double {
        return self.goalDistance - self.coveredDistance
    }        
}

//MARK: - Mutators

extension Challenge {
    func toggleStatus() {
        let realm = try! Realm()
        
        guard let thawed = self.thaw() else {
            return
        }
        
        try! realm.write {
            switch(thawed.status) {
            case .incomplete:
                thawed.status = .active
            case .active:
                thawed.status = .complete
            case .complete:
                thawed.status = .incomplete
            }
        }
    }
        
    func fetchActivities() {
        HealthService.shared.fetchRunningWorkouts { results, error in
            guard let results, error == nil else {
                return
            }
            
            let realm = try! Realm()
            let challenge = realm.object(ofType: Challenge.self, forPrimaryKey: self.id)!
            
            print(results)
            try! realm.write {
                challenge.activities.append(objectsIn: results)
            }
        }
    }
}
