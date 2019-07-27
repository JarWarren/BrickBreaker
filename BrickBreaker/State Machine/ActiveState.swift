//
//  ActiveState.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SpriteKit
import GameplayKit

class ActiveState: GKState {
    
    // MARK: - Properties
    
    var scene: GameScene?
    
    // MARK: - Initializer
    
    init(scene: GameScene) {
        self.scene = scene
        super.init()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == EndState.self
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        // player loses if ball falls below paddle
        checkForLoss()
        
        // does not count metal bricks
        if noBricksLeft() {
            print("level complete")
            stateMachine?.enter(EndState.self)
        }
    }
    
    func noBricksLeft() -> Bool {
        let bricks: [Brick] = scene?.children.filter { $0 is Brick } as! [Brick]
        return bricks.filter { $0.type != .metal }.isEmpty
    }
    
    func checkForLoss() {
        guard let ball = scene?.childNode(withName: Constants.ball) as? SKSpriteNode,
            let player = scene?.childNode(withName: Constants.player) as? SKSpriteNode else { return }
        if ball.position.y < player.position.y {
            scene?.delegate?.endGame()
        }
    }
}
