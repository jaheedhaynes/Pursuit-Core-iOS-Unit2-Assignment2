//
//  gotOpeningScreen.swift
//  GameOfThrones
//
//  Created by Jaheed Haynes on 11/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit


class MusicPlayer: UIViewController {
    
    
    
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
