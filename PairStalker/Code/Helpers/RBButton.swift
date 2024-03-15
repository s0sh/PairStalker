//
//  RBButton.swift
//  ImpossibleMaze
//
//  Created by SANDOR NAGY on 17/03/16.
//  Copyright © 2016 proffcoders. All rights reserved.
//

import SpriteKit

class RBButton: SKNode {
  var button: SKSpriteNode
  var mask: SKSpriteNode
  var cropNode: SKCropNode
  var action: () -> Void
  var buttonIsEnabled = true
  var buttonTitle = SKLabelNode()
  var buttonWithStars = false
  var buttonStarsCount = 0
  var buttonStars: SKSpriteNode
  
  init(buttonImage: String, title: String, withStars: Bool, starsCount: Int, buttonAction: @escaping () -> Void) {
    button = SKSpriteNode(imageNamed: buttonImage)
    button.zPosition = 0
    
    buttonTitle.fontName = FontName
    buttonTitle.fontSize = CGFloat(FontSize) * 3
    buttonTitle.fontColor = FontColorScore
    buttonTitle.text = title
    buttonTitle.zPosition = 1
    buttonTitle.horizontalAlignmentMode = .center
    buttonTitle.verticalAlignmentMode = .center
    
    buttonStars = SKSpriteNode(imageNamed: "Shared/Stars1")
    buttonStars.alpha = 0.0
    buttonStars.zPosition = 2000
    
    buttonWithStars = withStars
    
    if buttonWithStars {
      
      buttonStars.alpha = 1.0
      
      switch starsCount {
      case 0:
        buttonStars.alpha = 0.0
      case 1:
        buttonStars.texture = SKTexture(imageNamed: "Shared/Stars1")
      case 2:
        buttonStars.texture = SKTexture(imageNamed: "Shared/Stars2")
      case 3:
        buttonStars.texture = SKTexture(imageNamed: "Shared/Stars3")
      default:
        print("Ooops, no such stars value.")
        buttonStars.alpha = 0.0
      }
      
      print(starsCount)
      
    } else {
      print("No stars on this button")
    }
    
    mask = SKSpriteNode(color: SKColor.black, size: button.size)
    mask.alpha = 0
    
    cropNode = SKCropNode()
    cropNode.maskNode = button
    cropNode.zPosition = 3
    cropNode.addChild(mask)
    
    action = buttonAction
    
    super.init()
    
    isUserInteractionEnabled = true
    addChild(button)
    addChild(buttonTitle)
    buttonStars.position = CGPoint(x: self.frame.midX + 4, y: self.frame.midY - 76)
    addChild(buttonStars)
    addChild(cropNode)
  }
  
  /**
   Required so XCode doesn't throw warnings
   */
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if buttonIsEnabled {
      if PlayerStats.shared.getCurrentBoolValue(.Sound) {
        run(SKAction.playSoundFileNamed(tapSoundFile, waitForCompletion: false))
      }
      mask.alpha = 0.5
      run(SKAction.scale(to: 0.55, duration: 0.05))
    }
    
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if buttonIsEnabled {
      for touch in touches {
        let location: CGPoint = touch.location(in: self)
        
        if button.contains(location) {
          mask.alpha = 0.5
          run(SKAction.scale(to: 0.55, duration: 0.05))
        } else {
          mask.alpha = 0
        }
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if buttonIsEnabled {
      for touch in touches {
        let location: CGPoint = touch.location(in: self)
        
        if button.contains(location) {
          disableButton()
          //action()
          action()
          run(SKAction.sequence([SKAction.wait(forDuration: 0.2), SKAction.run({
            self.enableButton()
          })]))
        }
        
        mask.alpha = 0
        run(SKAction.scale(to: 0.50, duration: 0.05))
      }
    }
  }
  
  func disableButton() {
    buttonIsEnabled = false
    mask.alpha = 0.0
    buttonTitle.alpha = 1.0
  }
  
  func enableButton() {
    buttonIsEnabled = true
    mask.alpha = 0
    buttonTitle.alpha = 1.0
  }
  
  
}
