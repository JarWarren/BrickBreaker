//
//  Levels.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/27/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

enum Level: Int, CaseIterable {
    case one = 1
    case two
    case three
    
    var intValue: Int {
        return self.rawValue
    }
    
    static let totalLevels = 3
    
    var bricks: [Brick?] {
        switch self {
        case .one:
            return [nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    Brick(), Brick(), Brick(), Brick(), nil, nil]
        case .two:
            return [Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(3), Brick(2), Brick(2), Brick(2), Brick(2), Brick(3)]
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
