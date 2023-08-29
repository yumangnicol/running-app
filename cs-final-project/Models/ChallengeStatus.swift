//
//  ChallengeState.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/20/23.
//

import Foundation
import RealmSwift

/// An enum that represents the status of a challenge.
enum ChallengeStatus: String, PersistableEnum {
    /// A status that represents a challenge that is currently on going.
    case active
    /// A status that represents a completed challenge.
    case complete
    /// A status that represents a challenge that is not yet completed.
    case incomplete        
}
