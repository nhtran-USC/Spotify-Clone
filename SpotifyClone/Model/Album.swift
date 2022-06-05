//
//  Album.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class Album:Codable {
    let name: String
    let artist: String
    let image: String
    let Songs: [Song]
    
    let init(name: String, artist: String, image: String, Songs: [Song]) {
        self.name = name
        self.artist = artist
        self.image = image
        self.Songs = Songs
    }
    
    
}
