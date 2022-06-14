//
//  UserService.swift
//  SpotifyClone
//
//  Created by Nguyen Huy Tran on 6/8/22.
//

import Foundation
class UserService {
    static let shared = UserService()
    let user = User()
    private init() {}
    // album
    func followAlbum(album: Album) {
        if !isFollowing(album: album) {
            user.followingAlbums.append(album.name)
            album.followers += 1
        }
    }
    
    func unFollowAlbum(album: Album) {
        if let index  = user.followingAlbums.firstIndex(of: album.name) {
            album.followers -= 1
            user.followingAlbums.remove(at: index)
        }
    }
    
    func isFollowing(album: Album) -> Bool{
        if let _  = user.followingAlbums.firstIndex(of: album.name) {
            return true
        }
        return false
    }
    
    // song
    func likeSong(song: Song) {
        if !islike(song: song) {
            user.favoriteSong.append(song.title)
        }
    }
    
    func unlikeSong(song: Song) {
        if let index  = user.favoriteSong.firstIndex(of: song.title) {
            user.favoriteSong.remove(at: index)
        }
    }
    
    func islike(song: Song) -> Bool{
        if let _  = user.favoriteSong.firstIndex(of: song.title) {
            return true
        }
        return false
    }
}
