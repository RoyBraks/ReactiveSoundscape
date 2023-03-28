//
//  SoundManager.swift
//  ReactiveSoundScape
//
//  Created by Roy Braks on 28/03/2023.
//

import Foundation
import AVKit

class SoundManager {
    
    static let soundManager = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "pad_f-2", withExtension: ".mp3") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()

        } catch let error{
            print("Error while playing sound. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
