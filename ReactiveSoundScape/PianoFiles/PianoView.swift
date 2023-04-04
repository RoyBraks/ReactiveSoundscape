//
//  PianoView.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 04/04/2023.
//

import SwiftUI

struct PianoView: View {

    var body: some View {
        let noteC5 = NoteC5()
        let noteCS5 = NoteCS5()
        let noteD5 = NoteD5()
        let noteDS5 = NoteDS5()
        let noteE5 = NoteE5()
        let noteF5 = NoteF5()
        let noteFS5 = NoteFS5()
        let noteG5 = NoteG5()
        let noteGS5 = NoteGS5()
        let noteA5 = NoteA5()
        let noteAS5 = NoteAS5()
        let noteB5 = NoteB5()

        
        HStack(
            alignment: .top
        ) {
            Group {
                Button("C") {
                    noteC5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                
                Button("C#") {
                    noteCS5.playNote()
                }
                .buttonStyle(PianoKeyBlack())
                .padding(.leading, -UIScreen.main.bounds.size.width/18)
                .zIndex(10)
                
                Button("D") {
                    noteD5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/17)
                
                Button("D#") {
                    noteDS5.playNote()
                }
                .buttonStyle(PianoKeyBlack())
                .padding(.leading, -UIScreen.main.bounds.size.width/18)
                .zIndex(10)
                
                Button("E") {
                    noteE5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/17)
                
                Button("F") {
                    noteF5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/40)
            }
            
            Group {
                Button("F#") {
                    noteFS5.playNote()
                }
                .buttonStyle(PianoKeyBlack())
                .padding(.leading, -UIScreen.main.bounds.size.width/18)
                .zIndex(10)
                
                Button("G") {
                    noteG5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/17)
                
                Button("G#") {
                    noteGS5.playNote()
                }
                .buttonStyle(PianoKeyBlack())
                .padding(.leading, -UIScreen.main.bounds.size.width/18)
                .zIndex(10)
                
                Button("A") {
                    noteA5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/17)
                
                Button("A#") {
                    noteAS5.playNote()
                }
                .buttonStyle(PianoKeyBlack())
                .padding(.leading, -UIScreen.main.bounds.size.width/18)
                .zIndex(10)
                
                Button("B") {
                    noteB5.playNote()
                }
                .buttonStyle(PianoKeyWhite())
                .padding(.leading, -UIScreen.main.bounds.size.width/17)
            }
            
            
            
        }
        .padding()
        .background(
            Image("Piano")
                .blur(radius: 6)
                .overlay(
                    Color.black
                        .opacity(0.7)
                )
        )
    }
}


struct PianoKeyWhite: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.size.width/8)
            .frame(height: UIScreen.main.bounds.size.height/3)
            .background(Color.white)
            .foregroundColor(Color.gray)
            .border(.black, width: 0.8)
            .font(.subheadline)

    }
}

struct PianoKeyBlack: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.size.width/14)
            .frame(height: UIScreen.main.bounds.size.height/4.5)
            .background(Color.black)
            .foregroundColor(Color.gray)
            .font(.subheadline)
    }
}


struct PianoView_Previews: PreviewProvider {
    static var previews: some View {
        PianoView()
    }
}
