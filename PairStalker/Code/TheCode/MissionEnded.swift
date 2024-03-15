//
//  MissionEnded.swift
//  BallaceTheBall
//
//  Created by proffcoders on 27/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit

class MissionEnded: SKScene{
  
  var background = SKSpriteNode(imageNamed: "Shared/MiniBackground")
  var panel = SKSpriteNode(imageNamed: "Shared/MissionPanel")
  
  var missionTextLine1Label = SKLabelNode()
  var missionTextLine2Label = SKLabelNode()
  var missionTextLine3Label = SKLabelNode()
  var missionTextLine4Label = SKLabelNode()
  var missionTextLine5Label = SKLabelNode()
  
  var leftButton: RBButton!
  var rightButton: RBButton!
  
  var stars = SKSpriteNode()
  
  enum NodesZPosition: CGFloat {
    case background = 0, panel = 1, stars = 2, missionText = 3, button = 4
  }
  
  enum RBButtonType: String {
    case LeftButton
    case RightButton
  }
  
  override func didMove(to view: SKView) {
    
    self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
    
    panel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    panel.setScale(0.5)
    panel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    panel.zPosition = NodesZPosition.panel.rawValue
    self.addChild(panel)
    
    stars = SKSpriteNode(imageNamed: "Shared/MissionPanel1Star")
    
    switch PlayerStats.shared.getStars("Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))") {
    case 0:
      stars.alpha = 0.0
    case 1:
      stars.texture = SKTexture(imageNamed: "Shared/MissionPanel1Star")
      stars.alpha = 1.0
    case 2:
      stars.texture = SKTexture(imageNamed: "Shared/MissionPanel2Stars")
      stars.alpha = 1.0
    case 3:
      stars.texture = SKTexture(imageNamed: "Shared/MissionPanel3Stars")
      stars.alpha = 1.0
    default:
      print("Ooops, no such stars.")
    }
    
    stars.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    stars.setScale(0.5)
    stars.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.7)
    stars.zPosition = NodesZPosition.stars.rawValue
    self.addChild(stars)
    
    
    
    
    let currentLevel = PlayerStats.shared.getCurrentValue(.CurrentLevel)
    var currentGoalForLevel = goalForLevel0001
    //var currentTimeForLevel = timeForLevel0001
    
    switch currentLevel {
    case 1:
      currentGoalForLevel = goalForLevel0001
    //currentTimeForLevel = timeForLevel0001
    case 2:
      currentGoalForLevel = goalForLevel0002
    //currentTimeForLevel = timeForLevel0002
    case 3:
      currentGoalForLevel = goalForLevel0003
    //currentTimeForLevel = timeForLevel0003
    case 4:
      currentGoalForLevel = goalForLevel0004
    //currentTimeForLevel = timeForLevel0004
    case 5:
      currentGoalForLevel = goalForLevel0005
    //currentTimeForLevel = timeForLevel0005
    case 6:
      currentGoalForLevel = goalForLevel0006
    //currentTimeForLevel = timeForLevel0006
    case 7:
      currentGoalForLevel = goalForLevel0007
    //currentTimeForLevel = timeForLevel0007
    case 8:
      currentGoalForLevel = goalForLevel0008
    //currentTimeForLevel = timeForLevel0008
    case 9:
      currentGoalForLevel = goalForLevel0009
    //currentTimeForLevel = timeForLevel0009
    case 10:
      currentGoalForLevel = goalForLevel0010
    //currentTimeForLevel = timeForLevel0010
    case 11:
      currentGoalForLevel = goalForLevel0011
    //currentTimeForLevel = timeForLevel0011
    case 12:
      currentGoalForLevel = goalForLevel0012
    //currentTimeForLevel = timeForLevel0012
    case 13:
      currentGoalForLevel = goalForLevel0013
    //currentTimeForLevel = timeForLevel0013
    case 14:
      currentGoalForLevel = goalForLevel0014
    //currentTimeForLevel = timeForLevel0014
    case 15:
      currentGoalForLevel = goalForLevel0015
    //currentTimeForLevel = timeForLevel0015
    case 16:
      currentGoalForLevel = goalForLevel0016
    //currentTimeForLevel = timeForLevel0016
    case 17:
      currentGoalForLevel = goalForLevel0017
    //currentTimeForLevel = timeForLevel0017
    case 18:
      currentGoalForLevel = goalForLevel0018
    //currentTimeForLevel = timeForLevel0018
    case 19:
      currentGoalForLevel = goalForLevel0019
    //currentTimeForLevel = timeForLevel0019
    case 20:
      currentGoalForLevel = goalForLevel0020
    //currentTimeForLevel = timeForLevel0020
    case 21:
      currentGoalForLevel = goalForLevel0021
    //currentTimeForLevel = timeForLevel0021
    case 22:
      currentGoalForLevel = goalForLevel0022
    //currentTimeForLevel = timeForLevel0022
    case 23:
      currentGoalForLevel = goalForLevel0023
    //currentTimeForLevel = timeForLevel0023
    case 24:
      currentGoalForLevel = goalForLevel0024
    //currentTimeForLevel = timeForLevel0024
    case 25:
      currentGoalForLevel = goalForLevel0025
    //currentTimeForLevel = timeForLevel0025
    case 26:
      currentGoalForLevel = goalForLevel0026
    //currentTimeForLevel = timeForLevel0026
    case 27:
      currentGoalForLevel = goalForLevel0027
    //currentTimeForLevel = timeForLevel0027
    case 28:
      currentGoalForLevel = goalForLevel0028
    //currentTimeForLevel = timeForLevel0028
    case 29:
      currentGoalForLevel = goalForLevel0029
    //currentTimeForLevel = timeForLevel0029
    case 30:
      currentGoalForLevel = goalForLevel0030
    //currentTimeForLevel = timeForLevel0030
    case 31:
      currentGoalForLevel = goalForLevel0031
    //currentTimeForLevel = timeForLevel0031
    case 32:
      currentGoalForLevel = goalForLevel0032
    //currentTimeForLevel = timeForLevel0032
    case 33:
      currentGoalForLevel = goalForLevel0033
      //currentTimeForLevel = timeForLevel0033
      
    default:
      print("Oooops, no such level.")
    }
    
    var currentMissionTextLine1 = missionFaildTextLine1
    var currentMissionTextLine2 = missionFaildTextLine2
    var currentMissionTextLine3 = missionFaildTextLine3
    var currentMissionTextLine4 = missionFaildTextLine4
    var currentMissionTextLine5 = missionFaildTextLine5
    var leftButtonName = "Shared/ButtonMissionClose"
    var rightButtonName = "Shared/ButtonNextLevel"
    
    if PlayerStats.shared.getCurrentBoolValue(.LevelWon) {
      currentMissionTextLine1 = missionCompletedTextLine1
      currentMissionTextLine2 = missionCompletedTextLine2
      currentMissionTextLine3 = missionCompletedTextLine3
      currentMissionTextLine4 = missionCompletedTextLine4
      currentMissionTextLine5 = ""
      leftButtonName = "Shared/ButtonReplayLevel"
      rightButtonName = "Shared/ButtonNextLevel"
    } else {
      currentMissionTextLine1 = missionFaildTextLine1
      currentMissionTextLine2 = missionFaildTextLine2
      currentMissionTextLine3 = missionFaildTextLine3
      currentMissionTextLine4 = missionFaildTextLine4
      currentMissionTextLine5 = missionFaildTextLine5
      leftButtonName = "Shared/ButtonMissionClose"
      rightButtonName = "Shared/ButtonReplayLevel"
    }
    
    missionTextLine1Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.59)
    missionTextLine1Label.fontName = FontName
    missionTextLine1Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine1Label.fontColor = FontColorScore
    missionTextLine1Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine1Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine1Label.text = currentMissionTextLine1
    missionTextLine1Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine1Label)
    
    missionTextLine2Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.55)
    missionTextLine2Label.fontName = FontName
    missionTextLine2Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine2Label.fontColor = FontColorScore
    missionTextLine2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine2Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine2Label.text = currentMissionTextLine2
    missionTextLine2Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine2Label)
    
    missionTextLine3Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.51)
    missionTextLine3Label.fontName = FontName
    missionTextLine3Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine3Label.fontColor = FontColorScore
    missionTextLine3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine3Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine3Label.text = "\(currentMissionTextLine3) \(currentGoalForLevel)"
    missionTextLine3Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine3Label)
    
    missionTextLine4Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.47)
    missionTextLine4Label.fontName = FontName
    missionTextLine4Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine4Label.fontColor = FontColorScore
    missionTextLine4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine4Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine4Label.text = "\(currentMissionTextLine4)"
    missionTextLine4Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine4Label)
    
    missionTextLine5Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.43)
    missionTextLine5Label.fontName = FontName
    missionTextLine5Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine5Label.fontColor = FontColorScore
    missionTextLine5Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine5Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine5Label.text = "\(currentMissionTextLine5)"
    missionTextLine5Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine5Label)
    
    leftButton = RBButton(buttonImage: leftButtonName, title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .LeftButton)
    })
    leftButton.setScale(0.5)
    leftButton.position = CGPoint(x: self.frame.width * 0.33, y: self.frame.height * 0.37)
    leftButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(leftButton)
    
    rightButton = RBButton(buttonImage: rightButtonName, title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .RightButton)
    })
    rightButton.setScale(0.5)
    rightButton.position = CGPoint(x: self.frame.width * 0.66, y: self.frame.height * 0.37)
    rightButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(rightButton)
    
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .LeftButton:
      leftButtonTapped()
    case .RightButton:
      rightButtonTapped()
    }
  }
  
  func leftButtonTapped() {
    
    if PlayerStats.shared.getCurrentBoolValue(.LevelWon) {
      GameXManager.shared.transition(self, to: .Gameplay)
    } else {
      GameXManager.shared.transition(self, to: .MainMenuLevels)
    }
    
  }
  
  func rightButtonTapped() {
    
    if PlayerStats.shared.getCurrentBoolValue(.LevelWon) {
      PlayerStats.shared.changeTo(PlayerStats.shared.getCurrentValue(.CurrentLevel) + 1, forStat: .CurrentLevel)
      GameXManager.shared.transition(self, to: .StartMission)
    } else {
      GameXManager.shared.transition(self, to: .Gameplay)
    }
    
  }
  
}
