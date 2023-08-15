//
//  ActivityCellView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/15/23.
//

import SwiftUI

struct ActivityCellView: View {
    let distance: String
    let date: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(red: 0.44, green: 0.50, blue: 0.58, opacity: 1.00))
                .frame(maxWidth: .infinity, maxHeight: 80)
            HStack(spacing: 20){
                Image(systemName: "figure.run")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 40)
                Text(distance)
                    .fontWeight(.bold)
                Spacer()
                Text(date)
            }.padding()
        }
    }
}

struct ActivityCellView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCellView(distance: "10KM", date: "This is a date")
    }
}
