//
//  GameXManager.swift
//  GameX
//
//  Created by proffcoders on 07/11/2017.
//  Copyright © 2017 proffcoders. All rights reserved.
//

import SpriteKit

enum SceneType {
  case MainMenu, MainMenuLevels, Settings, StartMission, MissionEnded, GameOver, Gameplay
}

class GameXManager {
  
  // Can't init is singleton
  private init() { }
  
  static let shared = GameXManager()
  
  func transition(_ fromScene: SKScene, to: SceneType, transition: SKTransition? = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)) {
    guard let scene = getScene(type: to) else {return}
    guard let transition = transition else {return}
    scene.scaleMode = .fill
    fromScene.view?.presentScene(scene, transition: transition)
  }
  
  func getScene(type: SceneType) -> SKScene? {
    switch type {
    case .MainMenu:
      return MainMenu(fileNamed: "MainMenu")
    case .MainMenuLevels:
      return MainMenuLevels(fileNamed: "MainMenuLevels")
    case .Settings:
      return Settings(fileNamed: "Settings")
    case .StartMission:
      return StartMission(fileNamed: "StartMission")
    case .MissionEnded:
      return MissionEnded(fileNamed: "MissionEnded")
    case .GameOver:
      return GameOver(fileNamed: "GameOver")
    case .Gameplay:
      switch proffcodersGameID {
      case "lo93-jiwe-2672-kl34-3g4j":
        return GameplayFindThePairs(fileNamed: "GameplayFindThePairs")
      default:
        return nil
      }
      
    }
  }

}

