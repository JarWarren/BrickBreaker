//
//  LevelCell.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/27/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

class LevelCell: UICollectionViewCell {
    
    @IBOutlet weak var levelLabel: UILabel!
    
    func update(number: Int, isComplete: Bool) {
        levelLabel.text = "\(number)"
        switch isComplete {
        case true:
            levelLabel.textColor = .black
            layer.borderColor = UIColor.black.cgColor
            backgroundColor = BrickColor.green.uiColor
        case false:
            levelLabel.textColor = BrickColor.green.uiColor
            layer.borderColor = BrickColor.green.uiColor.cgColor
            backgroundColor = .black
        }
    }
}
