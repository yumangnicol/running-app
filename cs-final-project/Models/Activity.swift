//
//  Activity.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation
import RealmSwift

class Activity: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var startDate: Date
    @Persisted var duration: TimeInterval
    @Persisted var distance: Double
}
