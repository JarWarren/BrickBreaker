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
}
