//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/4/22.
//

import UIKit

class HomeViewController: UIViewController {
    var categories: [Category]!
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = CategoryService.shared.categories
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let albumViewController = segue.destination as! AlbumViewController
        albumViewController.album = 
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        let category = categories[indexPath.row]
        cell.update(category: category, index: indexPath.row)
        return cell
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let categoryIndex = collectionView.tag
        let category = categories[categoryIndex]
        return category.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        let categoryIndex = collectionView.tag
        let category = categories[categoryIndex]
        let album = category.albums[indexPath.row]
        cell.update(album: album)
        return cell
    }
}
