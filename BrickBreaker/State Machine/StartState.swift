//
//  StartState.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartState: GKState {

    // MARK: - Properties
    
    var scene: GameScene?
    var level: Level?
    
    // MARK: - Initializer
    
    init(scene: GameScene, level: Level) {
        self.scene = scene
        super.init()
    }
    
    // MARK: - GKState Methods
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == ActiveState.self
    }
    
    override func update(deltaTime seconds: TimeInterval) {

        startGame()
        stateMachine?.enter(ActiveState.self)
    }
    
    // MARK: - Custom Methods
    
    func startGame() {
        guard let level = level else { return }
        let bricks = level.bricks
        
        var index = 0
        
        for levelBrick in bricks {
            let sceneBrick = scene?.childNode(withName: String(index)) as! Brick
            if let levelBrick = levelBrick {
                sceneBrick.hitpoints = levelBrick.hitpoints
                sceneBrick.type = levelBrick.type
                sceneBrick.color = levelBrick.color
            } else {
                scene?.removeChildren(in: [sceneBrick])
            }
            index += 1
        }
        
        // TODO: get rid of gameboard
    }
}
