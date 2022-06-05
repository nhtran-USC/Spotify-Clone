//
//  Song.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class Song: Codable{
    let title: String
    let artist: String
    
    init(title: String, artist: String) {
        self.title = title;
        self.artist = artist;
    }
    
    
}
