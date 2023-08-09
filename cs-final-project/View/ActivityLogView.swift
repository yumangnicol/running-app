//
//  ContentView.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/9/23.
//

import SwiftUI

struct ActivityLogView: View {
    var body: some View {                
        List {
            HStack{
                Image(systemName: "figure.run")
                VStack{
                    Text("10KM")
                    Text("25 Jan 10:30PM")
                }
            }
        }
    }
}

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLogView()
    }
}
