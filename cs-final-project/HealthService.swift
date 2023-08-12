//
//  HealthKitService.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation
import HealthKit

class HealthService: ObservableObject {
    private let healthStore = HKHealthStore()
    private var serviceAnchor: HKQueryAnchor?
    
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
        let predicate = HKQuery.predicateForWorkouts(with: .running)
        let query = HKAnchoredObjectQuery(type: .workoutType(),
                                          predicate: predicate,
                                          anchor: serviceAnchor,
                                          limit: HKObjectQueryNoLimit) { query, samples, deletedSamples, newAnchor, error in
            
            guard let workouts = samples as? [HKWorkout], error == nil else {
                if let e = error {
                    print("Error fetching running workouts: \(e.localizedDescription)")
                    completion(nil, e)
                }
                return
            }
            
            self.serviceAnchor = newAnchor
            
            let activities = workouts.map { workout in
                
                let workoutDistance = workout.statistics(for: HKQuantityType(.distanceWalkingRunning))?.sumQuantity()?.doubleValue(for: .meter())
                
                return Activity(id: UUID(), startDate: workout.startDate, endDate: workout.endDate, duration: workout.duration, distance: workoutDistance ?? 0.0)
            }
            
            completion(activities, nil)
        }
        healthStore.execute(query)
    }
    
}
