//
//  PostViewModelItem.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class PostViewModelItem {
    var data: AnyObject
    var dataType: PostDataType
    init(data: AnyObject) {
        self.data = data
        dataType = data is Weather ? .weather : .post
    }
}
