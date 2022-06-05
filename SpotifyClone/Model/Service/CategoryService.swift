//
//  CategoryService.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import Foundation
class CategoryService{
    static let shared = CategoryService()
    
    let categories: [Category]
    private init(){}    
}
