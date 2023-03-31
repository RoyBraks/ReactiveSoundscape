//
//  FeaturedImageSlider.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 31/03/2023.
//

import SwiftUI

struct FeaturedImageSlider: View {
    private let images = ["Pad", "Piano"]
    var body: some View {
            // 2
            TabView {
                ForEach(images, id: \.self) { item in
                    ZStack {
                        NavigationLink(destination: PadView()) {
                            Image(item)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    Color.black
                                        .opacity(0.4)
                                )
                                .overlay(
                                    Text(item.description)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.bold),
                                    alignment: .center
                            )
                        }
                    }
                              
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
}

struct FeaturedImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedImageSlider()
    }
}
