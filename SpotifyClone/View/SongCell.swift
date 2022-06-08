//
//  SongCell.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/7/22.
//

import UIKit

class SongCell: UITableViewCell {
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    func update(_ song:Song) {
        songTitleLabel.text = song.title
        artistLabel.text = song.artist
        
    }
}
