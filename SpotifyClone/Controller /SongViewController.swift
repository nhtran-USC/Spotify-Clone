//
//  SongViewController.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/12/22.
//

import UIKit
import UIImageColors

// Problem Is liked button
// Time text

class SongViewController: UIViewController {
//    let album = CategoryService.shared.categories[0].albums[1]
//    var song = CategoryService.shared.categories[0].albums[1].songs[0]
//    var song:Song!
    var selectedAlbum:Album!
    var selectedSongIndex: Int!
    let TAG_PlAY = 1
    let TAG_PAUSE = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // select a random album and song for testing
//        selectedAlbum = CategoryService.shared.categories[0].albums[1]
//        selectedSongIndex = 0
        // round Play button
        playButton.layer.cornerRadius = playButton.frame.width / 2
        albumImageView.image = UIImage(named: selectedAlbum.image)

        // gradient background color
        let primaryColor = albumImageView.image!.getColors()!.primary.cgColor
        updateBackgroundColor(with: primaryColor)
        
        //checked if liked song
        if(UserService.shared.islike(song: selectedAlbum.songs[selectedSongIndex])) {
            favoriteButton.setImage(UIImage(named: "heart-filled")!, for: .normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "heart")!, for: .normal)
        }
        // pre set value of slider and label
        trackSlider.value = 0
        
        
        // play the song
        playSong(song: selectedAlbum.songs[selectedSongIndex])
        
        // Adio delegate
        AudioService.shared.delegate = self
    }

    
    func playSong(song: Song) {
//        albumImageView.image = UIImage(named: album.image)
        artistLabel.text = song.artist
        songTitleLabel.text = song.title
        AudioService.shared.play(song: song)
        playButton.tag = TAG_PlAY
        // update play button
        playButton.setImage(UIImage(named: "pause"), for: .normal)
        playButton.tag = TAG_PlAY
        
    }
    
    func updateBackgroundColor(with color: CGColor) {
        let backgroundColor = view.backgroundColor!.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color, backgroundColor]
        gradientLayer.locations = [0, 0.5]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var trackSlider: UISlider!

    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var durationTimeLabel: UILabel!
    
    
    @IBAction func likeButtonDidTapped(_ sender: UIButton) {
        if UserService.shared.islike(song: selectedAlbum.songs[selectedSongIndex]) {
            UserService.shared.unlikeSong(song: selectedAlbum.songs[selectedSongIndex])
            favoriteButton.setImage(UIImage(named: "heart")!, for: .normal)
        }
        else {
            UserService.shared.likeSong(song: selectedAlbum.songs[selectedSongIndex])
            favoriteButton.setImage(UIImage(named: "heart-filled")!, for: .normal)
        }
    }
    
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        if sender.isContinuous {
            sender.isContinuous = false
        }
        else {
            AudioService.shared.playAtTime(time: Double(sender.value))
            sender.isContinuous = true
        }
    }
    
    
    
    @IBAction func previousButtonDidTapped(_ sender: Any) {
        
        selectedSongIndex = max(0, selectedSongIndex - 1)
        playSong(song: selectedAlbum.songs[selectedSongIndex])
    }
    
    
    @IBAction func playButtonDidTapped(_ sender: Any) {
        if(playButton.tag == TAG_PlAY) {
            AudioService.shared.pause()
            playButton.setImage(UIImage(named: "play"), for: .normal)
            playButton.tag = TAG_PAUSE
        }
        else {
            AudioService.shared.resume()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            playButton.tag = TAG_PlAY
        }
    }
    
    
    @IBAction func nextButtonDidTapped(_ sender: Any) {
        selectedSongIndex = min(selectedAlbum.songs.count - 1, selectedSongIndex + 1)
        playSong(song: selectedAlbum.songs[selectedSongIndex])
    }
    
}

extension SongViewController: AudioServiceDelegate {
    func songIsPlaying(currentTime: Double, duration: Double) {
        trackSlider.maximumValue = Float(duration)
        trackSlider.value = Float(currentTime)
        
        currentTimeLabel.text = stringFromTime(time: currentTime)
        durationTimeLabel.text = stringFromTime(time: duration)
        // Update current time and duration label
        
        func stringFromTime(time: Double) -> String {
            let seconds = Int(time) % 60
            let minutes = (Int(time) / 60) % 60
            return String(format: "%0.2:%0.2", minutes, seconds)
        }
    }
    
    
}
