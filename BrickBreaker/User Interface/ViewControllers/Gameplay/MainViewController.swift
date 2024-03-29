//
//  StartViewController.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets and Properties
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var levelsButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var statsStackView: UIStackView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        revertTransformations()
        updateHUD()
    }
    
    // MARK: - Actions
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let gameViewController = UIStoryboard(name: Constants.game, bundle: nil).instantiateInitialViewController() as? GameViewController else { return }
        
        UIView.animate(withDuration: 0.5, animations: {
            
            sender.transform = CGAffineTransform(scaleX: CGFloat.random(in: -1..<1), y: CGFloat.random(in: -1..<1))
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -6...6))
            sender.alpha = 0
            
            self.settingsButton.alpha = 0
            self.levelsButton.alpha = 0
            self.shopButton.alpha = 0
            self.statsStackView.alpha = 0
            
        }, completion: { (_) in
            self.present(gameViewController, animated: false)
        })
    }
    
    @IBAction func levelButtonTapped(_ sender: Any) {
        guard let levelSelectVC = UIStoryboard(name: "LevelSelect", bundle: nil).instantiateInitialViewController() else { return }
        present(levelSelectVC, animated: false)
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        guard let settingsVC = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController() else { return }
        present(settingsVC, animated: false)
    }
    
    // MARK: - Custom Methods
    
    func revertTransformations() {
        settingsButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        settingsButton.alpha = 1
        levelsButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        levelsButton.alpha = 1
        shopButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        shopButton.alpha = 1
        startButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        startButton.alpha = 1
        statsStackView.alpha = 1
    }
    
    func setupButtons() {
        settingsButton.layer.borderColor = BrickColor.blue.uiColor.cgColor
        settingsButton.layer.borderWidth = 2
        shopButton.layer.borderColor = BrickColor.red.uiColor.cgColor
        shopButton.layer.borderWidth = 2
        levelsButton.layer.borderColor = BrickColor.green.uiColor.cgColor
        levelsButton.layer.borderWidth = 2
    }
    
    func updateHUD() {
        levelLabel.text = "Level: \(Settings.shared.levels.current)"
        currencyLabel.text = "\(Settings.shared.currencies.total)"
    }
}
