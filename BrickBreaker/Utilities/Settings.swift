//
//  SettingsManager.swift
//  BrickBreaker
//
//  Created by Jared Warren on 7/27/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

class Settings {
    
    // Source of Truth and Shared Instance
    static let shared = Settings()
    // Properties
    var levels: (max: Int, current: Int) = (0, 0)
    var currencies: (total: Int, current: Int) = (0, 0)
    // Initializer
    private init() {}
    
    /// Loads auto-saved data for Level completion and currency gained.
    func getStats() {
        
        // levels
        var maxLevel = UserDefaults.standard.integer(forKey: Constants.maxLevel)
        var currentLevel = UserDefaults.standard.integer(forKey: Constants.currentLevel)
        if maxLevel < 1 {
            maxLevel = 1
        }
        if currentLevel < 1 {
            currentLevel = 1
        }
        levels = (maxLevel, currentLevel)
        
        // currency
        let totalCurrency = UserDefaults.standard.integer(forKey: Constants.totalCurrency)
        currencies = (totalCurrency, 0)
    }
    
    /// Saves data for Level completion and currency gained.
    func saveStats() {
        UserDefaults.standard.setValuesForKeys([Constants.maxLevel: levels.max,
                                                Constants.currentLevel: levels.current,
                                                Constants.totalCurrency: currencies.total])
    }
    
    func addCurrency(amounts: (total: Int, current: Int)) {
        currencies.total += amounts.total
        currencies.current += amounts.current
        NotificationCenter.default.post(name: Notification.Name(Constants.currency), object: nil)
    }
    
    func changeLevel(to level: Int) {
        levels.current = level
        NotificationCenter.default.post(name: Notification.Name(Constants.level), object: nil)
    }
    
    func updateLevelsAndLoot(to newCurrentLevel: Int) {
        levels.current = newCurrentLevel
        if levels.max < newCurrentLevel {
            levels.max = newCurrentLevel
        }
        currencies.total += currencies.current
        currencies.current = 0
        saveStats()
    }
}
