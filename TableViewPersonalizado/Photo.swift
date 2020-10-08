//
//  Photo.swift
//  API_App
//
//  Created by Alejandro Hernández López on 07/10/20.
//

import Foundation

class Photo : Codable {
    @objc private var albumId : Int
    @objc private var id : Int
    @objc private var title : String
    @objc private var url : String
    @objc private var thumbnailUrl : String
    
    
    init() {
        self.albumId = 0
        self.id = 0
        self.title = ""
        self.url = ""
        self.thumbnailUrl = ""
    }
    
    func getAlbumId()->Int {return self.albumId}
    func getId()-> Int {return self.id}
    func getTitle()->String {return self.title}
    func getUrl()-> URL? {return URL(string: self.url)}
    func getThumbnailUrl()-> URL? {return URL(string: self.thumbnailUrl)}
    
}


// MARK: - WelcomeElement
class Todos: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }

    init(userID: Int, id: Int, title: String, completed: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
}

