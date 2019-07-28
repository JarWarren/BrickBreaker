//
//  LevelViewController.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/27/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    // MARK: - Outlets and Properties
    
    @IBOutlet weak var levelCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelCollectionView.delegate = self
        levelCollectionView.dataSource = self
    }
}

extension LevelViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Level.totalLevels
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCell
        
        cell.layer.borderWidth = 3
        let isComplete = Settings.shared.levels.max > indexPath.row
        cell.update(number: indexPath.row + 1, isComplete: isComplete)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if Settings.shared.levels.max > indexPath.row {
            Settings.shared.changeLevel(to: indexPath.row + 1)
            dismiss(animated: false)
        }
    }
}
extension LevelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.6
        let height = width / 3
        return CGSize(width: width, height: height)
    }
}
