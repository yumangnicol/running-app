//
//  ChallengesView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ChallengesView: View {
    let challenges = [
        Challenge(id: UUID(), name: "First 15k Challenge", goalDistance: 15000),
        Challenge(id: UUID(), name: "Run to Mordor", goalDistance: 100000)
    ]
    
    var body: some View {
        List(challenges) { challenge in
            VStack {
                Text("First 1K")
                Text("1000 KM")
            }            
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
