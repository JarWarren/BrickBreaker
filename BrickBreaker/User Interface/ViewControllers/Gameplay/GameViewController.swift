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
    
    // MARK: - Outlets and Properties
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    weak var scene: SKScene!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        updateLevel()
        updateCurrency()
        NotificationCenter.default.addObserver(self, selector: #selector(updateCurrency), name: Notification.Name(Constants.currency), object: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        
        if sender.imageView?.image == UIImage(named: "pause") {
            scene.isPaused = true
            pauseButton.backgroundColor = BrickColor.green.uiColor
            pauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            
            // TODO: Add two button subviews
           
        } else {
            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.9568510652, blue: 0, alpha: 1)
            scene.isPaused = false
            
            // TODO: remove the button subviews
        }
    }
    
    @objc func resetButtonTapped(_ sender: Any) {
    }
    
    @objc func quitButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Custom Methods
    
    func setupScene() {
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: Constants.gamescene) as? GameScene,
                let currentLevel = Level(rawValue: Settings.shared.levels.current) {
                self.scene = scene
                scene.delegate = self
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                scene.currentLevel = currentLevel
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func updateLevel() {
        levelLabel.text = "Level: \(Settings.shared.levels.current)"
    }
    
    @objc func updateCurrency() {
        currencyLabel.text = "\(Settings.shared.currencies.current)"
    }
}

extension GameViewController: SKSceneDelegate {
    func endGame() {
        Settings.shared.abortGame()
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
