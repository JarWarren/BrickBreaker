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
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    
    var intValue: Int {
        return self.rawValue
    }
    
    static let totalLevels = 10
    
    var bricks: [Brick?] {
        switch self {
            
        case .one:
            return [nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick()]
        case .two:
            return [nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    nil, nil, nil, nil, nil, nil,
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick()]
        case .three:
            return [nil, nil, nil, nil, nil, nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil]
        case .four:
            return [Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick()]
        case .five:
            return [Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), nil, Brick(), Brick(), nil, Brick(),
                    Brick(), nil, Brick(), Brick(), nil, Brick(),
                    Brick(), nil, Brick(), Brick(), nil, Brick(),
                    Brick(), nil, Brick(), Brick(), nil, Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick()]
        case .six:
            return [nil, nil, nil, nil, nil, nil,
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2),
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    nil, Brick(), Brick(), Brick(), Brick(), nil,
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2)]
        case .seven:
            return [Brick(2), nil, Brick(), Brick(), nil, Brick(2),
                    Brick(2), nil, Brick(), Brick(), nil, Brick(2),
                    Brick(2), nil, Brick(), Brick(), nil, Brick(2),
                    Brick(2), nil, Brick(), Brick(), nil, Brick(2),
                    Brick(2), nil, Brick(), Brick(), nil, Brick(2),
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2)]
        case .eight:
            return [Brick(), Brick(), Brick(), Brick(), Brick(), Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), Brick(2), nil, nil, Brick(2), Brick(),
                    Brick(), Brick(2), nil, nil, Brick(2), Brick(),
                    Brick(), nil, nil, nil, nil, Brick(),
                    Brick(), Brick(), Brick(), Brick(), Brick(), Brick()]
        case .nine:
            return [nil, Brick(2), nil, nil, Brick(2), nil,
                    nil, Brick(2), nil, nil, Brick(2), nil,
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2),
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2),
                    nil, Brick(2), nil, nil, Brick(2), nil,
                    nil, Brick(2), nil, nil, Brick(2), nil]
        case .ten:
            return [Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2),
                    Brick(2), nil, Brick(2), Brick(2), nil, Brick(2),
                    Brick(2), nil, Brick(2), Brick(2), nil, Brick(2),
                     Brick(2), nil, nil, nil, nil, Brick(2),
                    Brick(2), nil, nil, nil, nil, Brick(2),
                    Brick(2), Brick(2), Brick(2), Brick(2), Brick(2), Brick(2)]
        }
    }
}
