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
    
    // MARK: - Initializer
    
    init(scene: GameScene) {
        self.scene = scene
        super.init()
    }
    
    // MARK: - GKState Methods
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == ActiveState.self
    }
    
    override func didEnter(from previousState: GKState?) {
        setupGame()
    }
    
    // MARK: - Custom Methods
    
    func setupGame() {
        guard let levelBricks = scene?.currentLevel?.bricks,
            let player = scene?.childNode(withName: Constants.player),
            let ball = scene?.childNode(withName: Constants.ball) else { return }
        ball.position = CGPoint(x: player.position.x, y: player.position.y + 48)
        ball.physicsBody?.velocity = CGVector(dx: 400, dy: 400)
        var index = 0
        
        for levelBrick in levelBricks {
            let sceneBrick = scene?.childNode(withName: String(index)) as! Brick
            if let levelBrick = levelBrick {
                sceneBrick.hitpoints = levelBrick.hitpoints
                sceneBrick.type = levelBrick.type
                sceneBrick.color = levelBrick.color
            } else {
                sceneBrick.isHidden = true
                sceneBrick.physicsBody = nil
            }
            index += 1
        }
        stateMachine?.enter(ActiveState.self)
    }
}
