//
//  HealthKitService.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation
import HealthKit
import SwiftUI

/// A service that communicates with HealthKit
class HealthService: ObservableObject {
    
    /// The main data source of Workouts
    private let healthStore = HKHealthStore()
    
    /// The singleton HealthService instance
    public static let shared = HealthService()
    
    /// The encoded anchor value store in UserDefaults
    @AppStorage(K.Keys.anchor) private var encodedAnchor: Data?
    
    /// The decoded anchor value retrieved from UserDefaults
    private var serviceAnchor: HKQueryAnchor? {
        if let encodedAnchor {
            // Decodes the data to get HKQueryAnchor
            if let decodedAnchor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: HKQueryAnchor.self, from: encodedAnchor){
                return decodedAnchor
            }
        }
        return nil
    }
    
    
    /// Requests authorisation to use HealthKit on Device
    func requestAuthorization() {
        // Checks if HealthKit is availabale on Device
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit is not available on this device.")
            return
        }
        
        // Defines the types of HKObjects to be queried
        let readTypes: Set<HKObjectType> = [.workoutType()]
                
        // Actual authorization request
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            guard success, error == nil else {
                if let e = error {
                    print("Error requesting HealthKit authorization: \(e.localizedDescription)")
                }
                return
            }
        }
    }
    
    
    /// Fetches Running Workouts from HealthKit
    func fetchRunningWorkouts(completion: @escaping ([Activity]?, Error?) -> Void) {
        
        // A predicate to the query that determines the type of Workout to be obtained: Running
        let typePredicate = HKQuery.predicateForWorkouts(with: .running)
        
        // Determines the start date of the query
        // Uses the stored Date from UserDefaults that contains the application's first launch date
        let firstAppLaunch = Calendar.current.startOfDay(for: (UserDefaults.standard.object(forKey: K.Keys.firstAppLaunch)) as! Date)
        
        // A predicate to the query that determines the date range of workouts to be obtained
        let datePredicate = HKQuery.predicateForSamples(withStart: firstAppLaunch, end: nil)
                
        // Combines the typePredicate and datePredicate into a compond predicate
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [typePredicate,datePredicate])
        
        // The actual query to HealthKit to obtain running workouts
        let query = HKAnchoredObjectQuery(type: .workoutType(),
                                          predicate: predicate,
                                          anchor: serviceAnchor,
                                          limit: HKObjectQueryNoLimit) { query, samples, deletedSamples, newAnchor, error in
            
            // Checks if there are any new workouts and if there are any errors
            guard let workouts = samples as? [HKWorkout], error == nil, let newAnchor else {
                if let e = error {
                    print("Error fetching running workouts: \(e.localizedDescription)")
                    completion(nil, e)
                }
                return
            }
                        
            // Encodes new Anchor and stores to User Defaults
            if let newEncodedAnchor = try? NSKeyedArchiver.archivedData(withRootObject: newAnchor, requiringSecureCoding: true) {
                self.encodedAnchor = newEncodedAnchor
            }
                         
            // Maps each workout object from HealthKit as an Activity
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
