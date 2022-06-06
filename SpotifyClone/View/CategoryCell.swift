//
//  CategoryCell.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/5/22.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func update(category: Category, index: Int) {
        titleLabel.text = category.title
        subtitleLabel.text = category.subtitle
        collectionView.tag = index // category know what collection view they belong to
        collectionView.reloadData()
    }
}
