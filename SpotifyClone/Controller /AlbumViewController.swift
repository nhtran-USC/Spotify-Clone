//
//  AlbumViewController.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/7/22.
//

import UIKit
import UIImageColors

class AlbumViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var followerButtonLabel: UIButton!
    
    @IBOutlet weak var shuffleButton: UIButton!
    
    var album: Album
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // update button
        shuffleButton.layer.cornerRadius = 10
        followButton.layer.cornerRadius = 5
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.white.cgColor
        
        // update album
        albumImageView.image = UIImage(named: album.image)
        albumLabel.text = album.name
        
        // update followers label
        followerButtonLabel.setTitle("\(album.followers) Followers by \(album.artist)", for: .normal)
        // adjusting follow button
        if(UserService.shared.isFollowing(album: album)) {
            followButton.setTitle("Unfollow", for: .normal)
            followButton.backgroundColor = UIColor.green
        }
        // add gradient
        let primaryColor = albumImageView.image!.getColors()!.primary.cgColor
        
        updateBackgroundColor(with: primaryColor)
    }
    
    func updateBackgroundColor(with color: CGColor) {
        let backgroundColor = view.backgroundColor!.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color, backgroundColor]
        gradientLayer.locations = [0, 0.4]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func followButtonDidTapped(_ sender: UIButton) {
        if(!UserService.shared.isFollowing(album: album)) {
            // set button
            followButton.setTitle("Unfollow", for: .normal)
            followButton.backgroundColor = shuffleButton.backgroundColor
            followButton.layer.borderWidth = 0
            // adjust data
            UserService.shared.followAlbum(album: album)
            // set title
            followerButtonLabel.setTitle("\(album.followers) Followers by \(album.artist)", for: .normal)
        }
        else {
            // set button
            followButton.setTitle("Follow", for: .normal)
            followButton.backgroundColor = UIColor.black
            followButton.layer.borderWidth = 1
            // adjust data
            UserService.shared.unFollowAlbum(album: album)
            // set title
            followerButtonLabel.setTitle("\(album.followers) Followers by \(album.artist)", for: .normal)
        }
    }
    
    @IBAction func shufflePlayButtonDidTapped(_ sender: Any) {
    }
    
}


extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let album: Album = CategoryService.shared.categories[0].albums[0]
        return album.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let album: Album = CategoryService.shared.categories[0].albums[0]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        
        cell.update(album.songs[indexPath.row])
        return cell
    }
    
    
}
