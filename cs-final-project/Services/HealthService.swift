//
//  HealthKitService.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation
import HealthKit
import SwiftUI


class HealthService: ObservableObject {
    private let healthStore = HKHealthStore()
    
    public static let shared = HealthService()
    
    @AppStorage(K.Keys.anchor) private var encodedAnchor: Data?
    private var serviceAnchor: HKQueryAnchor? {
        if let encodedAnchor {
            // Decode the data to get HKQueryAnchor
            if let decodedAnchor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: HKQueryAnchor.self, from: encodedAnchor){
                return decodedAnchor
            }
        }
        return nil
    }
    
    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit is not available on this device.")
            return
        }
        
        // Defines the types of HKObjects to be queried
        let readTypes: Set<HKObjectType> = [.workoutType()]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            guard success, error == nil else {
                if let e = error {
                    print("Error requesting HealthKit authorization: \(e.localizedDescription)")
                }
                return
            }
        }
    }
    
    func fetchRunningWorkouts(completion: @escaping ([Activity]?, Error?) -> Void) {
        let typePredicate = HKQuery.predicateForWorkouts(with: .running)
        
        let dayBRO = Calendar.current.startOfDay(for: (UserDefaults.standard.object(forKey: K.Keys.firstAppLaunch)) as! Date)
        let datePredicate = HKQuery.predicateForSamples(withStart: dayBRO, end: nil)
                
                        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [typePredicate,datePredicate])
        
        let query = HKAnchoredObjectQuery(type: .workoutType(),
                                          predicate: predicate,
                                          anchor: serviceAnchor,
                                          limit: HKObjectQueryNoLimit) { query, samples, deletedSamples, newAnchor, error in
            
            guard let workouts = samples as? [HKWorkout], error == nil, let newAnchor else {
                if let e = error {
                    print("Error fetching running workouts: \(e.localizedDescription)")
                    completion(nil, e)
                }
                return
            }
                        
            // Store new Anchor
            if let newEncodedAnchor = try? NSKeyedArchiver.archivedData(withRootObject: newAnchor, requiringSecureCoding: true) {
                // Store the encoded anchor data in UserDefaults
                self.encodedAnchor = newEncodedAnchor
            }
                        
            let activities = workouts.map { workout in
                let distance = workout.statistics(for: HKQuantityType(.distanceWalkingRunning))?.sumQuantity()?.doubleValue(for: .meter()) ?? 0.0
                
                let newActivity = Activity(value: ["startDate": workout.startDate, "duration": workout.duration, "distance": distance] as [String : Any])
                return newActivity
            }
                       
            completion(activities, nil)            
        }
        healthStore.execute(query)
    }
    
}
