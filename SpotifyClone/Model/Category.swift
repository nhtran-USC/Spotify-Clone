//
//  Category.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class Category:Codable {
    let title: String
    let subTitle: String
    let albums: [Album]
    
    init(title: String, subTitle: String, albums: [Album]) {
        self.title = title
        self.subTitle = subTitle
        self.albums = albums
    }
}
