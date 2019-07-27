//
//  Levels.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/27/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

enum Level: Int {
    case one = 1
    case two
    
    var bricks: [Brick?] {
        let zero: Brick? = nil
        return [zero]
    }
}
