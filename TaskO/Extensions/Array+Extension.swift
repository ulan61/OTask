//
//  Array+Extension.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle() {
        for _ in 0..<count {
            sort { _,_ in arc4random()<arc4random() }
        }
    }
}
