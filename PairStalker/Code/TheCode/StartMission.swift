//
//  StartMission.swift
//  SkyDiving
//
//  Created by proffcoders on 27/12/2016.
//  Copyright © 2016 proffcoders. All rights reserved.
//

import SpriteKit

class StartMission: SKScene{
  
  var background = SKSpriteNode(imageNamed: "Shared/MiniBackground")
  var panel = SKSpriteNode(imageNamed: "Shared/MissionPanel")
  
  var missionTextLine1Label = SKLabelNode()
  var missionTextLine2Label = SKLabelNode()
  var missionTextLine3Label = SKLabelNode()
  var missionTextLine4Label = SKLabelNode()
  var missionTextLine5Label = SKLabelNode()
  
  var closeMissionButton: RBButton!
  var acceptMissionButton: RBButton!
  
  enum NodesZPosition: CGFloat {
    case background = 0, panel = 1, missionText = 2, button = 3
  }
  
  enum RBButtonType: String {
    case CloseMission
    case AcceptMission
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
    
    let currentLevel = PlayerStats.shared.getCurrentValue(.CurrentLevel)
    var currentGoalForLevel = goalForLevel0001
    var currentTimeForLevel = timeForLevel0001
    
    switch currentLevel {
    case 1:
      currentGoalForLevel = goalForLevel0001
      currentTimeForLevel = timeForLevel0001
    case 2:
      currentGoalForLevel = goalForLevel0002
      currentTimeForLevel = timeForLevel0002
    case 3:
      currentGoalForLevel = goalForLevel0003
      currentTimeForLevel = timeForLevel0003
    case 4:
      currentGoalForLevel = goalForLevel0004
      currentTimeForLevel = timeForLevel0004
    case 5:
      currentGoalForLevel = goalForLevel0005
      currentTimeForLevel = timeForLevel0005
    case 6:
      currentGoalForLevel = goalForLevel0006
      currentTimeForLevel = timeForLevel0006
    case 7:
      currentGoalForLevel = goalForLevel0007
      currentTimeForLevel = timeForLevel0007
    case 8:
      currentGoalForLevel = goalForLevel0008
      currentTimeForLevel = timeForLevel0008
    case 9:
      currentGoalForLevel = goalForLevel0009
      currentTimeForLevel = timeForLevel0009
    case 10:
      currentGoalForLevel = goalForLevel0010
      currentTimeForLevel = timeForLevel0010
    case 11:
      currentGoalForLevel = goalForLevel0011
      currentTimeForLevel = timeForLevel0011
    case 12:
      currentGoalForLevel = goalForLevel0012
      currentTimeForLevel = timeForLevel0012
    case 13:
      currentGoalForLevel = goalForLevel0013
      currentTimeForLevel = timeForLevel0013
    case 14:
      currentGoalForLevel = goalForLevel0014
      currentTimeForLevel = timeForLevel0014
    case 15:
      currentGoalForLevel = goalForLevel0015
      currentTimeForLevel = timeForLevel0015
    case 16:
      currentGoalForLevel = goalForLevel0016
      currentTimeForLevel = timeForLevel0016
    case 17:
      currentGoalForLevel = goalForLevel0017
      currentTimeForLevel = timeForLevel0017
    case 18:
      currentGoalForLevel = goalForLevel0018
      currentTimeForLevel = timeForLevel0018
    case 19:
      currentGoalForLevel = goalForLevel0019
      currentTimeForLevel = timeForLevel0019
    case 20:
      currentGoalForLevel = goalForLevel0020
      currentTimeForLevel = timeForLevel0020
    case 21:
      currentGoalForLevel = goalForLevel0021
      currentTimeForLevel = timeForLevel0021
    case 22:
      currentGoalForLevel = goalForLevel0022
      currentTimeForLevel = timeForLevel0022
    case 23:
      currentGoalForLevel = goalForLevel0023
      currentTimeForLevel = timeForLevel0023
    case 24:
      currentGoalForLevel = goalForLevel0024
      currentTimeForLevel = timeForLevel0024
    case 25:
      currentGoalForLevel = goalForLevel0025
      currentTimeForLevel = timeForLevel0025
    case 26:
      currentGoalForLevel = goalForLevel0026
      currentTimeForLevel = timeForLevel0026
    case 27:
      currentGoalForLevel = goalForLevel0027
      currentTimeForLevel = timeForLevel0027
    case 28:
      currentGoalForLevel = goalForLevel0028
      currentTimeForLevel = timeForLevel0028
    case 29:
      currentGoalForLevel = goalForLevel0029
      currentTimeForLevel = timeForLevel0029
    case 30:
      currentGoalForLevel = goalForLevel0030
      currentTimeForLevel = timeForLevel0030
    case 31:
      currentGoalForLevel = goalForLevel0031
      currentTimeForLevel = timeForLevel0031
    case 32:
      currentGoalForLevel = goalForLevel0032
      currentTimeForLevel = timeForLevel0032
    case 33:
      currentGoalForLevel = goalForLevel0033
      currentTimeForLevel = timeForLevel0033
      
    default:
      print("Oooops, no such level.")
    }
    
    missionTextLine1Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.55)
    missionTextLine1Label.fontName = FontName
    missionTextLine1Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine1Label.fontColor = FontColorScore
    missionTextLine1Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine1Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine1Label.text = missionTextLine1
    missionTextLine1Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine1Label)
    
    missionTextLine2Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.51)
    missionTextLine2Label.fontName = FontName
    missionTextLine2Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine2Label.fontColor = FontColorScore
    missionTextLine2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine2Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine2Label.text = "\(missionTextLine2) \(currentGoalForLevel)"
    missionTextLine2Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine2Label)
    
    missionTextLine3Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.47)
    missionTextLine3Label.fontName = FontName
    missionTextLine3Label.fontSize = CGFloat(FontSize) * 0.8
    missionTextLine3Label.fontColor = FontColorScore
    missionTextLine3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    missionTextLine3Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    missionTextLine3Label.text = "\(missionTextLine3)"
    missionTextLine3Label.zPosition = NodesZPosition.missionText.rawValue
    self.addChild(missionTextLine3Label)
    
    if appUsesTimeForLevels {
      missionTextLine4Label.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.43)
      missionTextLine4Label.fontName = FontName
      missionTextLine4Label.fontSize = CGFloat(FontSize) * 0.8
      missionTextLine4Label.fontColor = FontColorScore
      missionTextLine4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
      missionTextLine4Label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
      missionTextLine4Label.text = "in less than \(convertSeconds(currentTimeForLevel))"
      missionTextLine4Label.zPosition = NodesZPosition.missionText.rawValue
      self.addChild(missionTextLine4Label)
    }
    
    closeMissionButton = RBButton(buttonImage: "Shared/ButtonMissionClose", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .CloseMission)
    })
    closeMissionButton.setScale(0.5)
    closeMissionButton.position = CGPoint(x: self.frame.width * 0.33, y: self.frame.height * 0.37)
    closeMissionButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(closeMissionButton)
    
    acceptMissionButton = RBButton(buttonImage: "Shared/ButtonMissionAccept", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .AcceptMission)
    })
    acceptMissionButton.setScale(0.5)
    acceptMissionButton.position = CGPoint(x: self.frame.width * 0.66, y: self.frame.height * 0.37)
    acceptMissionButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(acceptMissionButton)
    
  }
  
  func convertSeconds(_ seconds: Int) -> String {
    let minutes = seconds / 60
    var minutesText = "\(minutes)"
    let seconds = seconds % 60
    var secondsText = "\(seconds)"
    
    if seconds / 60 < 10 {
      minutesText = "0\(minutes)"
    }
    if seconds % 60 < 10 {
      secondsText = "0\(seconds)"
    }
    
    return "\(minutesText):\(secondsText)"
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .CloseMission:
      closeMissionButtonTapped()
    case .AcceptMission:
      acceptMissionButtonTapped()
    }
  }
  
  func closeMissionButtonTapped() {
    GameXManager.shared.transition(self, to: .MainMenuLevels)
  }
  
  func acceptMissionButtonTapped() {
    GameXManager.shared.transition(self, to: .Gameplay)
  }
  
}
