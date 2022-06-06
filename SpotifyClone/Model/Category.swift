//
//  Category.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class Category:Codable {
    let title: String
    let subtitle: String
    let albums: [Album]
    
    init(title: String, subtitle: String, albums: [Album]) {
        self.title = title
        self.subtitle = subtitle
        self.albums = albums
    }
}
