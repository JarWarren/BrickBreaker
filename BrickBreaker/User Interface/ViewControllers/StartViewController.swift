//
//  StartViewController.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/25/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Outlets and Properties
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var levelsButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButton.layer.cornerRadius = settingsButton.frame.width / 2
        shopButton.layer.cornerRadius = shopButton.frame.width / 2
        levelsButton.layer.cornerRadius = levelsButton.frame.width / 2
        levelsButton.setTitle(" Level\nSelect", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        revertTransformations()
    }
    
    // MARK: - Actions
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let gameViewController = UIStoryboard(name: Constants.game, bundle: nil).instantiateInitialViewController() as? GameViewController else { return }
        
        UIView.animate(withDuration: 0.5, animations: {
            
            sender.transform = CGAffineTransform(scaleX: CGFloat.random(in: -1..<1), y: CGFloat.random(in: -1..<1))
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -6...6))
            sender.alpha = 0
            
        }, completion: { (_) in
            self.present(gameViewController, animated: false)
        })
    }
    
    // MARK: - Custom Methods
    
    func revertTransformations() {
        settingsButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        levelsButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        shopButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        startButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        startButton.alpha = 1
    }
}
