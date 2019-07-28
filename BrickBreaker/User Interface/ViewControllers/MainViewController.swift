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
        settingsButton.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        settingsButton.layer.borderWidth = 2
        shopButton.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        shopButton.layer.borderWidth = 2
        levelsButton.layer.borderColor = #colorLiteral(red: 0.7189847827, green: 0.887085259, blue: 0.5935872197, alpha: 1)
        levelsButton.layer.borderWidth = 2
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
    
    func updateHUD() {
        levelLabel.text = "Level: \(Settings.shared.levels.current)"
        currencyLabel.text = "🔸 \(Settings.shared.currencies.total)"
    }
}
