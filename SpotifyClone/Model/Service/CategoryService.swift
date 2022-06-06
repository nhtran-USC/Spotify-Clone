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
    private init(){
    let categoriesUrl = Bundle.main.url(forResource: "categories", withExtension: "json")!
        let data = try! Data(contentsOf: categoriesUrl)
        let decoder = JSONDecoder()
        self.categories = try! decoder.decode([Category].self, from: data)
    
    }
}
