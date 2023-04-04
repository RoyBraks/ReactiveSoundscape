//
//  NoteCs5.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 04/04/2023.
//

import Foundation
import AVKit

struct NoteA5 {
    let mixerSettings = MixerSettings()

    private let reverb = AVAudioUnitReverb()

    private let echo = AVAudioUnitDelay()
    
    private let audioEngine = AVAudioEngine()

    private let audioPlayerNode = AVAudioPlayerNode()
    
    let audioFileUrl = Bundle.main.url(forResource: "a5", withExtension: "mp3")
    
    func playNote() {

        guard let audioFile = try? AVAudioFile(forReading: audioFileUrl!) else { return }

        reverb.loadFactoryPreset(mixerSettings.reverbPreset)
        reverb.wetDryMix = mixerSettings.reverbMix
        
        echo.delayTime = mixerSettings.echoDelayTime
        echo.lowPassCutoff = mixerSettings.echoCutoff
        echo.wetDryMix = mixerSettings.echoMix
        
        audioEngine.attach(audioPlayerNode)
        audioEngine.attach(reverb)
        audioEngine.attach(echo)

        audioEngine.connect(audioPlayerNode, to: reverb, format: nil)
        audioEngine.connect(reverb, to: echo, format: nil)
        audioEngine.connect(echo, to: audioEngine.mainMixerNode, format: nil)


        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)

        try? audioEngine.start()
        
        audioPlayerNode.play()
    }
}
