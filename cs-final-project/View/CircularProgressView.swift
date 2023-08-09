//
//  CircularProgressView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color(red: 0.00, green: 0.66, blue: 1.00, opacity: 0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color(red: 0.00, green: 0.66, blue: 1.00, opacity: 1.00),
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)
            Text("50KM")
        }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.9)
    }
}
