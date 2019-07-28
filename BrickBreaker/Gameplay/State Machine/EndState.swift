//
//  EndState.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndState: GKState {
    
    // MARK: - Properties
    
    var scene: GameScene?
    
    // MARK: - Initializer
    
    init(scene: GameScene) {
        self.scene = scene
        super.init()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == StartState.self
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        // advance a level
        guard let oldLevel = scene?.currentLevel?.intValue else { return }
        scene?.currentLevel = Level(rawValue: oldLevel + 1)
        Settings.shared.autoSaveStats(currentLevel: (oldLevel + 1))
        
        // reset bricks
        scene?.children.forEach {
            if let brick = $0 as? Brick {
                brick.isHidden = false
                let body = SKPhysicsBody(rectangleOf: Constants.brickSize)
                body.isDynamic = false
                body.affectedByGravity = false
                body.allowsRotation = false
                body.friction = 0
                body.restitution = 1
                brick.physicsBody = body
            }
        }
        stateMachine?.enter(StartState.self)
    }
}
