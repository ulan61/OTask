//
//  Weather.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import ObjectMapper

let BISHKEK_ID = "1528675"
let OSH_ID = "1527534"
let CHOLPON_ATA_ID = "1528512"
let NARYN_ID = "1527592"

class Weather: Mappable {
    var city: String!
    var temperature: Temperature!

    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        city <- map["name"]
        temperature <- map["main"]
    }
}

class Temperature: Mappable {
    var constant: Double!
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        constant <- map["temp"]
    }
}
