//
//  RealmManager.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/23/23.
//

import Foundation
import RealmSwift


class RealmService {
    var realm: Realm?
    
    init() {
        Realm.Configuration.defaultConfiguration = self.config
        realm = try! Realm()        
    }
    
    
    var config: Realm.Configuration {
        Realm.Configuration(schemaVersion: 0)
    }            
    
    func loadDefaultChallenges() {
        if let realm = realm {
            if realm.objects(Challenge.self).isEmpty {
                do {
                    try realm.write {
                        realm.add(DefaultChallenges.challenges)
                    }
                } catch {
                    print("Error adding Challenges to Realm", error)
                }
            }
        }
    }
}
