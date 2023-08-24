//
//  RealmManager.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/23/23.
//

import Foundation
import RealmSwift


class RealmManager {
    static var config: Realm.Configuration {
        Realm.Configuration(schemaVersion: 0)
    }            
    
    static func setChallenges() {
        let realm = try! Realm()
        
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
