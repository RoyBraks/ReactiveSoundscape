//
//  ContentView.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
            // 1
            NavigationView {
                // 2
                List {
                    FeaturedImageSlider()
                        .frame(height: 200)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                } //: List
                .navigationBarTitle("Featured", displayMode: .large)
            }
            //: Navigation View
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

