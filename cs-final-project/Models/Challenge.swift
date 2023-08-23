//
//  Challenge.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/17/23.
//

import Foundation
import RealmSwift


class Challenge: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var goalDistance: Double
    @Persisted var coveredDistance: Double
    @Persisted var status = ChallengeStatus.incomplete
    @Persisted var activities = List<Activity>()
}
