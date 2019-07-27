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
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        startButton.alpha = 1
    }
    
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
}
