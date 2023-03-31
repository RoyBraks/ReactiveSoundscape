//
//  ContentView.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 28/03/2023.
//

import SwiftUI
import AVKit

struct PadView: View {
    
    let audioFileURL = Bundle.main.url(forResource: "pad_f-2", withExtension: "mp3")
    
    let audioEngine = AVAudioEngine()
    
    let audioPlayerNode = AVAudioPlayerNode()
    
    @State var audioFileBuffer: AVAudioPCMBuffer?
    
    let speedControl = AVAudioUnitVarispeed()
    let pitchControl = AVAudioUnitTimePitch()
    
    @State var isPlaying = false
    
    let range: ClosedRange<Double> = -12...12
    let step: Double = 1
    @State private var pitchShift: Double = 0


    var body: some View {
                
        VStack {
            VStack {
                if (!isPlaying) {
                    Button() {
                        playLoopingSound()
                        isPlaying = true
                    } label: {
                        Image(systemName: "play")
                        Text("Start")
                    }
                    .buttonStyle(.bordered)
                    .padding(10)
                    .foregroundColor(Color.white)
                } else {
                    Button() {
                        stopLoopingSound()
                        isPlaying = false
                    } label: {
                        Image(systemName: "stop")
                        Text("Stop")
                    }
                    .buttonStyle(.bordered)
                    .padding(10)
                }
                Slider(
                    value: $pitchShift,
                    in: range
                ) {
                    Text("Pitch")
                } onEditingChanged: { _ in
                    pitchControl.pitch = Float((pitchShift*10)+425)
                    speedControl.rate = Float((((pitchShift*10)+425)/500))
                }
                
                Text("\(pitchShift, specifier: "%.f")")
                    .foregroundColor(Color.white)

            }

        }
        .padding()
        .background(
            Image("Pad")
                .blur(radius: 6)
                .overlay(
                    Color.black
                        .opacity(0.7)
                )
        )
    }

    
    func playLoopingSound() {
        // Load the MP3 file into an AVAudioFile object
        guard let audioFile = try? AVAudioFile(forReading: audioFileURL!) else { return }
        
        
        // Connect the audioPlayerNode to the audioEngine's output node
        audioEngine.attach(audioPlayerNode)
        audioEngine.attach(pitchControl)
        audioEngine.attach(speedControl)
        
        audioEngine.connect(audioPlayerNode, to: speedControl, format: nil)
        audioEngine.connect(speedControl, to: pitchControl, format: nil)
        audioEngine.connect(pitchControl, to: audioEngine.outputNode, format: nil)
        
        // Create an AVAudioPCMBuffer containing the entire audio file
        let audioFormat = audioFile.processingFormat
        let audioFrameCount = UInt32(audioFile.length)
        guard let buffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount) else { return }
        do {
            try audioFile.read(into: buffer)
            audioPlayerNode.scheduleBuffer(buffer, at: nil, options: [.loops])
            audioFileBuffer = buffer
        } catch {
            print("Failed to read audio file into buffer: \(error.localizedDescription)")
        }
        
        // Start the audio engine and the audio player node
        try? audioEngine.start()
        audioPlayerNode.play()
    }
    
    func stopLoopingSound() {
        // Stop the audio player node and the audio engine
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
        // Release the audio file buffer
        audioFileBuffer = nil
    }
    
}

struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView()
    }
}
