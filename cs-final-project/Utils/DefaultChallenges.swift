//
//  DefaultChallenges.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/23/23.
//

import Foundation

struct DefaultChallenges {
    static var challenges: [Challenge] {
        let first10K = Challenge(value: ["name": "First 10K", "goalDistance": 10000.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        let ultra100K = Challenge(value: ["name": "Ultra 100K", "goalDistance": 100000.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        let runToMordor = Challenge(value: ["name": "Run to Mordor", "goalDistance": 3109170.00, "status": ChallengeStatus.incomplete] as [String : Any])
        
        return [first10K, ultra100K, runToMordor]
    }
}
