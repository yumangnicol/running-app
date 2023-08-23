//
//  ChallengeState.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/20/23.
//

import Foundation
import RealmSwift

enum ChallengeStatus: String, PersistableEnum {
    case active
    case complete
    case incomplete        
}
