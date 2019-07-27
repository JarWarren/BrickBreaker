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
        switch self {
        case .one:
            return [nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1)]
        case .two:
            return [Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1)]
        }
    }
}
