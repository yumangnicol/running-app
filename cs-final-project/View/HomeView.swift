//
//  HomeView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text("Run to Mordor Running Challenge")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 0.10, green: 0.16, blue: 0.34, opacity: 1.00))
                    .frame(maxHeight: 400)
                
                VStack(){
                    CircularProgressView(progress: 0.5)
                        .frame(maxWidth: 300, maxHeight: 300)
                    HStack(spacing: 100){
                        VStack{
                            Text("Goal")
                                .fontWeight(.heavy)
                            Text("50Km")
                        }
                        VStack{
                            Text("Remaining")
                                .fontWeight(.heavy)
                            Text("50Km")
                        }
                    }
                }.padding()
            }.foregroundColor(.white)
            
            HStack {
                Text("Last Activity")
                    .font(.title)
                Spacer()
                Button("See all") {
                    print("Hello")
                }
            }
            
            ZStack() {
                RoundedRectangle(cornerRadius: 15)
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .foregroundColor(.red)
                HStack{
                    Image(systemName: "figure.run")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 40)
                    Text("10KM")
                    Spacer()
                    Text("25 Jan 10:30PM")
                }.padding()
            }
            
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
