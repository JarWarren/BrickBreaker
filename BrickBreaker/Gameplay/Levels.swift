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
    case three
    
    var bricks: [Brick?] {
        switch self {
        case .one:
            return [nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(.metal), Brick(1), Brick(1), Brick(1), Brick(1), Brick(.metal)]
        case .two:
            return [Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1)]
        case .three:
            return [Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(1), Brick(1), Brick(1), Brick(1), Brick(1), Brick(1),
                    Brick(.metal), Brick(1), Brick(1), Brick(1), Brick(1), Brick(.metal)]
        }
    }
}
