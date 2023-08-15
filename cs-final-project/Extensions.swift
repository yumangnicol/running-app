//
//  Extensions.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/15/23.
//

import Foundation

extension Date {
    func inStringFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        
        return dateFormatter.string(from: self)
    }
}

extension Double {
    func inKilometerFormat() -> String {
        return String(format: "%.2f KM", self / 1000.0)
    }
}


extension TimeInterval {
    func inStringDurationFormat() -> String {
        if self > 3600 {
            return String(format: "%.2f Mins", (self.truncatingRemainder(dividingBy: 3600)) / 60)
        } else {
            return String(format: "%.2f Hrs", self / 3600)
        }
    }
}
