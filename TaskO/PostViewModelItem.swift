//
//  PostViewModelItem.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class PostViewModelItem {
    var data: AnyObject!
    init(data: AnyObject) {
        self.data = data
    }
    
    func hasWeather() -> Bool {
        if data is Weather {
            return true
        }
        return false
    }
}
