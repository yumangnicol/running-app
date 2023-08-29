//
//  Activity.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation
import RealmSwift

/// A model that represents a running activity.
class Activity: Object, ObjectKeyIdentifiable {
    /// The unique identifier of the running activity.
    @Persisted(primaryKey: true) var id: ObjectId
    /// The date when the activity was started.
    @Persisted var startDate: Date
    /// The amount of time (in seconds) spent in the running activity.
    @Persisted var duration: TimeInterval
    /// The distance covered (in meters) during  the running activity.
    @Persisted var distance: Double
}
