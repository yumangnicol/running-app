//
//  CircularProgressView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct CircularProgressView: View {
    let percentage: Double
    let text: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color(red: 0.00, green: 0.66, blue: 1.00, opacity: 0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(
                    Color(red: 0.00, green: 0.66, blue: 1.00, opacity: 1.00),
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: percentage)
            
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(percentage: 0.7, text: "50KM")
    }
}
