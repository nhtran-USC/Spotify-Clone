//
//  AudioService.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/9/22.
//

import Foundation
import AVFoundation


class AudioService {
    static let shared = AudioService()
    let songs = ["song-0", "song-1", "song-2"]
    var audioPlayer:AVAudioPlayer!
    // Load a sound file URL
    private init() {}
    
    func play(song: Song) {
        let songURL = Bundle.main.url(forResource: songs.randomElement()!, withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOf: songURL)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func pause() {
        audioPlayer.pause()
    }
    
    func resume() {
        audioPlayer.play()
    }

}
