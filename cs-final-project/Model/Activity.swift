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
    let endDate: Date
    let duration: Double
    let distance: Double
}

struct ActivityModel {
    private(set) var activities: [Activity] = []
    private 
    
    mutating func addActivity(_ activity: Activity){
        activities.append(activity)
    }
    
    
    
}
