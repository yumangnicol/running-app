//
//  ChallengesModelTest.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/29/23.
//

import XCTest
import RealmSwift
@testable import cs_final_project

final class ChallengesModelTest: XCTestCase {
    var realm: Realm!
    
    override func setUpWithError() throws {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        let realm = try! Realm()
        
        try realm.write {
            
            var challenges: [Challenge] {
                let first = Challenge(value: ["name": "First", "goalDistance": 10000.00, "status": ChallengeStatus.incomplete] as [String : Any])
                
                let second = Challenge(value: ["name": "Second", "goalDistance": 100000.00, "status": ChallengeStatus.active] as [String : Any])
                
                let third = Challenge(value: ["name": "Third", "goalDistance": 3109170.00, "status": ChallengeStatus.complete] as [String : Any])
                
                return [first, second, third]
            }
            
            realm.add(challenges)
        }
    }
    
    func testStartChallenge() throws {
        let realm = try! Realm()
        let challenge = realm.objects(Challenge.self).first
        challenge?.startChallenge()
        XCTAssertEqual(challenge?.status, ChallengeStatus.active)
    }
    
    func testCompleteChallenge() throws {
        let realm = try! Realm()
        let challenge = realm.objects(Challenge.self).filter { $0.status == .active }.first
        challenge?.completeChallenge()
        XCTAssertEqual(challenge?.status, ChallengeStatus.complete)
    }
    
    func testStartChallengeInvalidStatus() throws {
        let realm = try! Realm()
        let challenge = realm.objects(Challenge.self).filter { $0.status == .complete }.first
        challenge?.startChallenge()
        XCTAssertEqual(challenge?.status, ChallengeStatus.complete)
    }
    
    func testCompleteChallengeInvalidStatus() throws {
        let realm = try! Realm()
        let challenge = realm.objects(Challenge.self).filter { $0.status == .complete }.first
        challenge?.completeChallenge()
        XCTAssertEqual(challenge?.status, ChallengeStatus.complete)
    }
}
