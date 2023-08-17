//
//  Activity.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/11/23.
//

import Foundation

struct Activity: Identifiable {
    let id: UUID
    let startDate: Date
    let duration: TimeInterval
    let distance: Double
}

extension Activity {
    var startDateAsText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = K.dateFormat
        
        return dateFormatter.string(from: self.startDate)
    }
    
    var durationAsText: String {
        if self.duration > 3600 {
            return String(format: K.durationInMinutesFormat, (self.duration.truncatingRemainder(dividingBy: 3600)) / 60)
        } else {
            return String(format: K.durationInHoursFormat, self.duration / 3600)
        }
    }
    
    var distanceAsText: String {
        return String(format: K.distanceInKilometerFormat, self.distance / 1000.0)
    }
}
