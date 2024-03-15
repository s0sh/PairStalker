//
//  PlayerStats.swift
//  AvoidTheDots
//
//  Created by proffcoders on 28/11/2016.
//  Copyright © 2016 proffcoders. All rights reserved.
//

import Foundation
import SpriteKit

enum PlayerStatType: String {
  case FirstLaunch
  case CurrentScore
  case BestScore
  case IsBestScore
  case Sound
  case CurrentLevel
  case HighestUnlockedLevel
  case LevelWon
  case HasPurchasedNoAds
}

class PlayerStats {
  
  static let shared = PlayerStats()
  fileprivate init() {} //This prevents others from using the default '()' initializer for this class.
  
  func setupDefaultValues() {
    if !UserDefaults.standard.bool(forKey: PlayerStatType.FirstLaunch.rawValue) {
      setupDefaultValuesAnytime()
      UserDefaults.standard.set(true, forKey: PlayerStatType.FirstLaunch.rawValue)
      UserDefaults.standard.synchronize()
    }
  }
  
  func setupDefaultValuesAnytime() {
    
    changeTo(true, forStat: .Sound)
    changeTo(0, forStat: .CurrentScore)
    changeTo(0, forStat: .BestScore)
    changeTo(1, forStat: .CurrentLevel)
    changeTo(1, forStat: .HighestUnlockedLevel)
    changeTo(false, forStat: .HasPurchasedNoAds)
    
    for i in 1 ... 33 {
      changeTo(0, forLevel: "Level\(i)")
    }
    
    
  }
  
  func changeTo(_ value: Int, forStat: PlayerStatType) {
    
    if forStat == PlayerStatType.CurrentScore {
      if value > getCurrentValue(PlayerStatType.BestScore) {
        UserDefaults.standard.set(value, forKey: PlayerStatType.BestScore.rawValue)
        changeTo(true, forStat: .IsBestScore)
      }
    }
    
    UserDefaults.standard.set(value, forKey: forStat.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func getCurrentValue(_ forStat: PlayerStatType) -> Int {
    return UserDefaults.standard.integer(forKey: forStat.rawValue)
  }
  
  func changeTo(_ value: Bool, forStat: PlayerStatType) {
    UserDefaults.standard.set(value, forKey: forStat.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func getCurrentBoolValue(_ forStat: PlayerStatType) -> Bool {
    return UserDefaults.standard.bool(forKey: forStat.rawValue)
  }
  
  func changeTo(_ stars: Int, forLevel: String) {
    UserDefaults.standard.set(stars, forKey: "Level\(forLevel)")
    UserDefaults.standard.synchronize()
  }
  
  func getStars(_ forLevel: String) -> Int {
    return UserDefaults.standard.integer(forKey: "Level\(forLevel)")
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
