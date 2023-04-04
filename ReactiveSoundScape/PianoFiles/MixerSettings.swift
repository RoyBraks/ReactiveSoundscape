//
//  MixerSettings.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 04/04/2023.
//

import Foundation
import AVKit

class MixerSettings {
    let reverbMix: Float = 40
    let echoMix: Float = 20
    let reverbPreset = AVAudioUnitReverbPreset.cathedral
    let echoCutoff: Float = 1000
    let echoDelayTime = 0.5
    
}
