//
//  Gameplay.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation
import GameplayKit

// MARK: - Board

/// Holds an array of bricks which populate the screen, as well as the player's life total.
struct Gameboard {
    
    var bricks: [Brick?]
    var lives: Int
    
    init(bricks: [Brick?], lives: Int = 3) {
        self.bricks = bricks
        self.lives = lives
    }
    
    /// Returns true when all bricks have been destroyed. Ignores metal bricks.
    func noBricksLeft() -> Bool {
        return bricks.filter { $0?.type != .metal }.compactMap { $0 }.isEmpty
    }
}

// MARK: - Bricks

/// Represents a brick on the board. Holds a hitpoint value.
class Brick: SKSpriteNode {
    
    var hitpoints: Int
    var type: BrickType
    
    /// If no BrickType is specified, the brick will be .normal.
    init(_ hitpoints: Int, _ type: BrickType = .normal) {        
        self.hitpoints = hitpoints
        self.type = type
        var color = SKColor.white
        switch type {
        case .normal:
            color = BrickColor(rawValue: hitpoints)?.uiColor ?? SKColor.white
        case .explosive:
            color = SKColor.white
        case .container:
            color = UIColor.clear
        case .metal:
            color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        super.init(texture: nil,
                   color: color,
                   size: CGSize(width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        // TODO: get rid of this.
        hitpoints = 0
        type = .normal
        super.init(coder: aDecoder)
    }
}

/// Different brick types should behave differently.
enum BrickType {
    /// No special behavior.
    case normal
    /// Detonates when hitpoints hit zero.
    case explosive
    /// Cannot be broken, does not count against level completion.
    case metal
    /// Drops an item when broken.
    case container
}

/// Color based on remaining hitpoints.
enum BrickColor: Int {
    
    case green = 1
    case yellow
    case orange
    case red
    case purple
    case blue
    
    var uiColor: UIColor {
        switch self {
        case .green:
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case .orange:
            return #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case .purple:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }
}

/// Houses constant values.
struct Constants {
    
    static let player = "player"
    static let ball = "ball"
    static let game = "Game"
    static let gamescene = "GameScene"
}
