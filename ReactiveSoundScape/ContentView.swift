//
//  ContentView.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Play Pad") {
                SoundManager.soundManager.playSound()
            }.padding(10)
            Button("Stop Pad") {
                SoundManager.soundManager.stopSound()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
