//
//  AudioService.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/9/22.
//

import Foundation
import AVFoundation

protocol AudioServiceDelegate {
    func songIsPlaying(currentTime: Double, duration: Double)
}

class AudioService {
    static let shared = AudioService()
    let songs = ["song-0", "song-1", "song-2"]
    var audioPlayer:AVAudioPlayer!
    var timer: Timer?
    
    var delegate:AudioServiceDelegate?
    // Load a sound file URL
    private init() {}
    
    
    
    func play(song: Song) {
        let songURL = Bundle.main.url(forResource: songs.randomElement()!, withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOf: songURL)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        startTimer()
    }
    
    func pause() {
        audioPlayer.pause()
        stopTimer()
    }
    
    func resume() {
        audioPlayer.play()
        startTimer()
    }
    
    func playAtTime(time: Double) {
        audioPlayer.currentTime = time
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.delegate?.songIsPlaying(currentTime: self.audioPlayer.currentTime, duration: self.audioPlayer.duration)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

}
