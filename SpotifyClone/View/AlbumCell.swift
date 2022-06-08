//
//  AlbumCell.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/5/22.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    func update(album: Album) {
        albumImageView.image = UIImage(named: album.image)
        albumTitleLabel.text = album.name
        artistLabel.text = album.artist
    }
    
}
