//
//  ProgressCardView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/25/23.
//

import SwiftUI

struct ProgressCardView: View {
    let progressPercentage: Double
    let progressText: String
    let goalText: String
    let remainingText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(red: 0.12, green: 0.10, blue: 0.10, opacity: 1.00))
                .frame(maxHeight: 400)
            
            VStack(){
                CircularProgressView(percentage: progressPercentage, text: progressText)
                    .frame(maxWidth: 300, maxHeight: 300)
                HStack(spacing: 100){
                    VStack{
                        Text("Goal")
                            .fontWeight(.heavy)
                        Text(goalText)
                    }
                    VStack{
                        Text("Remaining")
                            .fontWeight(.heavy)
                        Text(remainingText)
                    }
                }
            }
        }
    }
}

struct ProgressCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCardView(progressPercentage: 0.7, progressText: "21.08 KM", goalText: "10,00 KM", remainingText: "9.00KM")
    }
}
