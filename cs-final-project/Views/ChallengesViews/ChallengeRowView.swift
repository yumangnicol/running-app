//
//  ChallengeRowView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/25/23.
//

import SwiftUI

struct ChallengeRowView: View {
    static let color0 = Color(red: 238/255, green: 130/255, blue: 238/255);
    
    static let color1 = Color(red: 0/255, green: 0/255, blue: 255/255);
    let gradient = Gradient(colors: [color0, color1]);
    
    var name: String
    var distance: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 150)
            
            VStack(alignment: .leading){
                Image(systemName: "mountain.2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 80, maxHeight: 80)
                HStack{
                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Text(distance)
                        .font(.title2)
                }
            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        }
    }
}

struct ChallengeRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRowView(name: "Run to Mordor", distance: "300 KM")
    }
}
