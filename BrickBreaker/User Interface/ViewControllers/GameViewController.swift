//
//  GameViewController.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: Constants.gamescene) as? GameScene {
                scene.delegate = self
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController: SKSceneDelegate {
    func endGame() {
        dismiss(animated: false)
    }
}

// Extends SKSceneDelegate to allows view controller to close itself.
extension SKSceneDelegate {
    func endGame() {
        if let self = self as? UIViewController {
            self.dismiss(animated: false)
        }
    }
}
