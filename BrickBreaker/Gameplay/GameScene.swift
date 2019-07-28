//
//  GameScene.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: - Properties
    var currentLevel: Level?
    
    // sprites
    lazy var player = childNode(withName: Constants.player) as! SKSpriteNode
    lazy var ball = childNode(withName: Constants.ball) as! SKSpriteNode
    
    // gameplay
    var stateMachine: GKStateMachine!
    
    // MARK: - Lifecycle
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // setup
        setupSprites()
        setupStateMachine()
    }
    
    // MARK: - Scene Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // moves player to touch position.x with a 0.24 second delay.
        touches.forEach { player.run(SKAction.moveTo(x: $0.location(in: self).x, duration: 0.24)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // same as touches began
        touches.forEach { player.run(SKAction.moveTo(x: $0.location(in: self).x, duration: 0.24)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        stateMachine.update(deltaTime: currentTime)
    }
    
    // MARK: - Custom Methods
    
    func setupSprites() {
        // player
        player.position = CGPoint(x: 0, y: -frame.height / 2.4)
        
        // screen border
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.restitution = 1
        physicsBody?.friction = 0
        physicsWorld.contactDelegate = self
    }
    
    func setupStateMachine() {
        // states
        let start = StartState(scene: self)
        let active = ActiveState(scene: self)
        let end = EndState(scene: self)
        
        // machine
        stateMachine = GKStateMachine(states: [start, active, end])
        stateMachine.enter(StartState.self)
    }
    
    func hit(_ brick: Brick) {
        brick.hitpoints -= 1
        guard brick.hitpoints > 0 else {
            brick.isHidden = true
            brick.physicsBody = nil
            Settings.shared.addCurrency(amounts: (0, 1))
            return
        }
        brick.color = BrickColor(rawValue: brick.hitpoints)?.uiColor ?? SKColor.white
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didEnd(_ contact: SKPhysicsContact) {
        if let brick = contact.bodyA.node as? Brick {
            if brick.type != .metal {
                hit(brick)
            }
        }
        if let brick = contact.bodyB.node as? Brick {
            if brick.type != .metal {
                hit(brick)
            }
        }
    }
}
