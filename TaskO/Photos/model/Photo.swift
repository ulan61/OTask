//
//  Photo.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import ObjectMapper

class Photo: Mappable {
    var albumId: Int!
    var id: Int!
    var title: String!
    var urlString: String!
    var thumbnailUrlString: String!
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        albumId <- map["albumId"]
        id <- map["id"]
        title <- map["title"]
        urlString <- map["url"]
        thumbnailUrlString <- map["thumbnailUrl"]
    }
}
