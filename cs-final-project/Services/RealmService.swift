//
//  RealmManager.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/23/23.
//

import Foundation
import RealmSwift

/// A service that communicates with Realm
class RealmService {
    
    /// An instance of Realm
    var realm: Realm?
    
    /// The default Challenges to be stored on realm at first initialization
    private var defaultChallenges: [Challenge] {
        let first10K = Challenge(value: ["name": "First 10K", "goalDistance": 10000.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        let ultra100K = Challenge(value: ["name": "Ultra 100K", "goalDistance": 100000.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        let runToMordor = Challenge(value: ["name": "Run to Mordor", "goalDistance": 3109170.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        return [first10K, ultra100K, runToMordor]
    }
    
    /// Initializes a RealmService
    init() {
        Realm.Configuration.defaultConfiguration = self.config
        realm = try! Realm()        
    }
    
    /// Sets the Realm to use a default configuration
    var config: Realm.Configuration {
        Realm.Configuration(schemaVersion: 0)
    }            
    
    /// Loads the defaultChallenges to the default Realm instance
    func loadDefaultChallenges() {
        if let realm = realm {
            if realm.objects(Challenge.self).isEmpty {
                do {
                    try realm.write {
                        realm.add(defaultChallenges)
                    }
                } catch {
                    print("Error adding Challenges to Realm", error)
                }
            }
        }
    }
}
