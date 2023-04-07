//
//  SwiftUIView.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 07/04/2023.
//

import SwiftUI

struct ProximityView: View {
    @State private var isClose = false
    init(){
        UIDevice.current.isProximityMonitoringEnabled = true
    }
    var body: some View {
        Text("\(String(isClose))")
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.proximityStateDidChangeNotification)) { _ in
                if UIDevice.current.proximityState {
                    isClose = true
                }
            }
    }
}

struct ProximityView_Previews: PreviewProvider {
    static var previews: some View {
        ProximityView()
    }
}
