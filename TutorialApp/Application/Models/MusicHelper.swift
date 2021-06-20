//
//  MusicHelper.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 19/06/2021.
//

import UIKit 
import AVFoundation



class MusicHelper {
    
    static var player: AVAudioPlayer?
    static func playAndStopMusic() {
        if let player = player {
            //stop playback
            if player.isPlaying{
                player.pause()
            } else {
                player.play()
            }
        } else {
                // set up player and play
            let urlString = Bundle.main.path(forResource: "MagicSong", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let urlString = urlString else {
                        return
                    }
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                    guard let player = player else  {
                        return
                    }
                    player.play()
                }
            catch {
                print("Error")
                }
        }
    }
}

