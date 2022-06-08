//
//  Album.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class Album:Codable {
    let name: String
    var followers: Int
    let artist: String
    let image: String
    let songs: [Song]
    
    init(name: String, artist: String, image: String, songs: [Song], followers: Int) {
        self.name = name
        self.artist = artist
        self.image = image
        self.songs = songs
        self.followers = followers
    }
    
    
}
