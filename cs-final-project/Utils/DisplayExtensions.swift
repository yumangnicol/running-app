//
//  FormatExtensions.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/24/23.
//

import Foundation

extension Double {
    /// Returns a String from a Double that is fomrated in Kilometers
    func inKilometerFormat() -> String {
        return String(format: K.distanceInKilometerFormat, self / 1000.00)
    }
    
    /// Returns a String from a Double that is formated in Minutes or Hours
    func inDurationFormat() -> String {
        if self > 3600.00 {
            return String(format: K.durationInMinutesFormat, (self.truncatingRemainder(dividingBy: 3600.00)) / 60.00)
        } else {
            return String(format: K.durationInHoursFormat, self / 3600.00)
        }
    }
}

extension Date {
    
    /// Returns a String from a Date that is formatted in MMM, d y HH:mm 
    func inFormatedText() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = K.dateFormat
        
        return dateFormatter.string(from: self)
    }
}

