//
//  GameplayFindThePairs.swift
//  GameX
//
//  Created by proffcoders on 10/11/2017.
//  Copyright © 2017 proffcoders. All rights reserved.
//

import SpriteKit

public class GameplayFindThePairs: SKScene, SKPhysicsContactDelegate {
  
  var background = SKSpriteNode (imageNamed: "Shared/MiniBackground")
  
  var pausePanelBackground = SKSpriteNode()
  var pausePanel = SKSpriteNode(imageNamed: "Shared/MiniPausedPanel")
  var pausePanelResumeButton: RBButton!
  var pausePanelRestartButton: RBButton!
  var pausePanelExitButton: RBButton!
  var pauseButton: RBButton!
  
  var isScenePaused = false
  var isGameOver = false
  
  var score = 0
  
  var timer = Timer()
  var counter = 59
  var totalTime = 59 // needs to be set exactly to the 'counter'
  var counterLabel = SKLabelNode()
  
  var currentTimeForLevel: Int!
  var currentMissionGoal: Int!
  
  var scoreCountLabel = SKLabelNode()
  
  enum NodesZPositon: CGFloat{
    case background = 0, placeholder, card, uI, pausePanelBG, pausePanel, pausePanelButton
  }
  
  struct PhysicsCategory {
    static let Hero : UInt32 = 0x1 << 1
    static let FallingItem : UInt32 = 0x1 << 2
    static let FallingItemBomb : UInt32 = 0x1 << 3
    static let FallingItemTime : UInt32 = 0x1 << 4
    static let None : UInt32 = 0x1 << 5
  }
  
  enum RBButtonType: String {
    case Pause
    case Resume
    case Restart
    case Exit
  }
  
  var placeholder1 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder2 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder3 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder4 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder5 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder6 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder7 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder8 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder9 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder10 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder11 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder12 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder13 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder14 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder15 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  var placeholder16 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardBack")
  
//  var card1 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront001")
//  var card2 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront001")
//  var card3 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront002")
//  var card4 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront002")
//  var card5 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront003")
//  var card6 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront003")
//  var card7 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront004")
//  var card8 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront004")
//  var card9 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront005")
//  var card10 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront005")
//  var card11 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront006")
//  var card12 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront006")
//  var card13 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront007")
//  var card14 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront007")
//  var card15 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront008")
//  var card16 = SKSpriteNode(imageNamed: "FindThePairs/MiniCardFront008")
  
  var card1: FindThePairsButton!
  var card2: FindThePairsButton!
  var card3: FindThePairsButton!
  var card4: FindThePairsButton!
  var card5: FindThePairsButton!
  var card6: FindThePairsButton!
  var card7: FindThePairsButton!
  var card8: FindThePairsButton!
  var card9: FindThePairsButton!
  var card10: FindThePairsButton!
  var card11: FindThePairsButton!
  var card12: FindThePairsButton!
  var card13: FindThePairsButton!
  var card14: FindThePairsButton!
  var card15: FindThePairsButton!
  var card16: FindThePairsButton!
  
  var placeholders: [SKSpriteNode] = []
  var cards: [FindThePairsButton] = []
  var foundPairsCount = 0
  
  override public func didMove(to view: SKView) {
    
    setupNewGameplay()
    addBasicElements()
    
    addPlaceholders()
    addRandomCards()
    
  }
  
  func addPlaceholders() {
    placeholders = [placeholder1, placeholder2, placeholder3, placeholder4, placeholder5, placeholder6, placeholder7, placeholder8, placeholder9, placeholder10, placeholder11, placeholder12, placeholder13, placeholder14, placeholder15, placeholder16]
    
    placeholder1.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.75 , y: self.size.height * 0.5 + placeholder1.size.height * 0.75)
    placeholder2.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.25 , y: self.size.height * 0.5 + placeholder1.size.height * 0.75)
    placeholder3.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.25 , y: self.size.height * 0.5 + placeholder1.size.height * 0.75)
    placeholder4.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.75 , y: self.size.height * 0.5 + placeholder1.size.height * 0.75)
    
    placeholder5.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.75 , y: self.size.height * 0.5 + placeholder1.size.height * 0.25)
    placeholder6.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.25 , y: self.size.height * 0.5 + placeholder1.size.height * 0.25)
    placeholder7.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.25 , y: self.size.height * 0.5 + placeholder1.size.height * 0.25)
    placeholder8.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.75 , y: self.size.height * 0.5 + placeholder1.size.height * 0.25)
    
    placeholder9.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.75 , y: self.size.height * 0.5 - placeholder1.size.height * 0.25)
    placeholder10.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.25 , y: self.size.height * 0.5 - placeholder1.size.height * 0.25)
    placeholder11.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.25 , y: self.size.height * 0.5 - placeholder1.size.height * 0.25)
    placeholder12.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.75 , y: self.size.height * 0.5 - placeholder1.size.height * 0.25)
    
    placeholder13.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.75 , y: self.size.height * 0.5 - placeholder1.size.height * 0.75)
    placeholder14.position = CGPoint(x: self.size.width * 0.5 - placeholder1.size.width * 0.25 , y: self.size.height * 0.5 - placeholder1.size.height * 0.75)
    placeholder15.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.25 , y: self.size.height * 0.5 - placeholder1.size.height * 0.75)
    placeholder16.position = CGPoint(x: self.size.width * 0.5 + placeholder1.size.width * 0.75 , y: self.size.height * 0.5 - placeholder1.size.height * 0.75)
    
    for placeholder in placeholders {
      placeholder.setScale(0.5)
      placeholder.zPosition = NodesZPositon.placeholder.rawValue
      addChild(placeholder)
    }
    
  }
  
  func addRandomCards() {
    
    card1 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront001", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(1, cardNumber: 1)
    })
    card2 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront001", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(1, cardNumber: 2)
    })
    card3 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront002", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(2, cardNumber: 3)
    })
    card4 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront002", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(2, cardNumber: 4)
    })
    card5 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront003", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(3, cardNumber: 5)
    })
    card6 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront003", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(3, cardNumber: 6)
    })
    card7 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront004", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(4, cardNumber: 7)
    })
    card8 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront004", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(4, cardNumber: 8)
    })
    card9 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront005", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(5, cardNumber: 9)
    })
    card10 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront005", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(5, cardNumber: 10)
    })
    card11 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront006", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(6, cardNumber: 11)
    })
    card12 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront006", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(6, cardNumber: 12)
    })
    card13 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront007", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(7, cardNumber: 13)
    })
    card14 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront007", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(7, cardNumber: 14)
    })
    card15 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront008", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(8, cardNumber: 15)
    })
    card16 = FindThePairsButton(buttonImage: "FindThePairs/MiniCardBack", cardImage: "FindThePairs/MiniCardFront008", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.checkForPair(8, cardNumber: 16)
    })
    
    cards.removeAll()
    cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16]
    
    var name = 0
    var firstCard = true
    for card in cards {
      card.name = "\(name)"
      print(card.name)
      card.zPosition = NodesZPositon.card.rawValue
      card.alpha = 1.0
      if !firstCard {
        name += 1
        firstCard = true
      } else {
        firstCard = false
      }
      
    }
    
    cards.shuffle()
    
    var i = 0
    for placeholder in placeholders {
      placeholder.addChild(cards[i])
      i += 1
    }
  }
  
  var isFirstFold = true
  var firstCardType = 0
  var secondCardType = 0
  var firstCardNumber = 0
  var secondCardNumber = 0
  var shouldFoldCard = true
  
  func checkForPair(_ cardType: Int, cardNumber: Int) {
    
    if !shouldFoldCard {
      return
    }
    
    switch cardNumber {
    case 1:
      card1.button.texture = SKTexture(imageNamed: card1.cardImage)
      card1.isFolded = true
    case 2:
      card2.button.texture = SKTexture(imageNamed: card2.cardImage)
      card2.isFolded = true
    case 3:
      card3.button.texture = SKTexture(imageNamed: card3.cardImage)
      card3.isFolded = true
    case 4:
      card4.button.texture = SKTexture(imageNamed: card4.cardImage)
      card4.isFolded = true
    case 5:
      card5.button.texture = SKTexture(imageNamed: card5.cardImage)
      card5.isFolded = true
    case 6:
      card6.button.texture = SKTexture(imageNamed: card6.cardImage)
      card6.isFolded = true
    case 7:
      card7.button.texture = SKTexture(imageNamed: card7.cardImage)
      card7.isFolded = true
    case 8:
      card8.button.texture = SKTexture(imageNamed: card8.cardImage)
      card8.isFolded = true
    case 9:
      card9.button.texture = SKTexture(imageNamed: card9.cardImage)
      card9.isFolded = true
    case 10:
      card10.button.texture = SKTexture(imageNamed: card10.cardImage)
      card10.isFolded = true
    case 11:
      card11.button.texture = SKTexture(imageNamed: card11.cardImage)
      card11.isFolded = true
    case 12:
      card12.button.texture = SKTexture(imageNamed: card12.cardImage)
      card12.isFolded = true
    case 13:
      card13.button.texture = SKTexture(imageNamed: card13.cardImage)
      card13.isFolded = true
    case 14:
      card14.button.texture = SKTexture(imageNamed: card14.cardImage)
      card14.isFolded = true
    case 15:
      card15.button.texture = SKTexture(imageNamed: card15.cardImage)
      card15.isFolded = true
    case 16:
      card16.button.texture = SKTexture(imageNamed: card16.cardImage)
      card16.isFolded = true
    default:
      print("No such card")
    }
    
    if !isFirstFold {
      
      shouldFoldCard = false
      
      secondCardType = cardType
      secondCardNumber = cardNumber
      
      if firstCardType == secondCardType {
        if firstCardNumber == secondCardNumber {
          print("tapped on same card")
          run(SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.run({
            self.shouldFoldCard = true
            self.turnBackAllUnmatchedCards()
          })]))
        } else {
          print("match, lock these two cards")
          lockCards(cardType)
          run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run({
            self.shouldFoldCard = true
          })]))
          foundPairsCount += 1
          if foundPairsCount >= 8 {
            gameOver(won: true)
          }
        }
        
      } else {
        print("no match, turn back all unmatched cards")
        run(SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.run({
          self.shouldFoldCard = true
          self.turnBackAllUnmatchedCards()
        })]))
      }
      
      firstCardType = 0
      secondCardType = 0
      firstCardNumber = 0
      secondCardNumber = 0
      enableAllCards()
      
      isFirstFold = true
    } else {
      firstCardType = cardType
      firstCardNumber = cardNumber
      disableCard(cardNumber)
      isFirstFold = false
    }
  }
  
  func disableCard(_ cardNumber: Int) {
    print("Disabling \(cardNumber)")
    switch cardNumber {
    case 1:
      card1.disableButton()
    case 2:
      card2.disableButton()
    case 3:
      card3.disableButton()
    case 4:
      card4.disableButton()
    case 5:
      card5.disableButton()
    case 6:
      card6.disableButton()
    case 7:
      card7.disableButton()
    case 8:
      card8.disableButton()
    case 9:
      card9.disableButton()
    case 10:
      card10.disableButton()
    case 11:
      card11.disableButton()
    case 12:
      card12.disableButton()
    case 13:
      card13.disableButton()
    case 14:
      card14.disableButton()
    case 15:
      card15.disableButton()
    case 16:
      card16.disableButton()
    default:
      print("No such card")
    }
  }
  
  func lockCards(_ cardType: Int) {
    switch cardType {
    case 1:
      card1.lockButton()
      card2.lockButton()
    case 2:
      card3.lockButton()
      card4.lockButton()
    case 3:
      card5.lockButton()
      card6.lockButton()
    case 4:
      card7.lockButton()
      card8.lockButton()
    case 5:
      card9.lockButton()
      card10.lockButton()
    case 6:
      card11.lockButton()
      card12.lockButton()
    case 7:
      card13.lockButton()
      card14.lockButton()
    case 8:
      card15.lockButton()
      card16.lockButton()
    default:
      print("No such card type")
    }
  }
  
  func enableAllCards() {
    card1.enableButton()
    card2.enableButton()
    card3.enableButton()
    card4.enableButton()
    card5.enableButton()
    card6.enableButton()
    card7.enableButton()
    card8.enableButton()
    card9.enableButton()
    card10.enableButton()
    card11.enableButton()
    card12.enableButton()
    card13.enableButton()
    card14.enableButton()
    card15.enableButton()
    card16.enableButton()
  }
  
  func turnBackAllUnmatchedCards() {
    card1.foldBackCard()
    card2.foldBackCard()
    card3.foldBackCard()
    card4.foldBackCard()
    card5.foldBackCard()
    card6.foldBackCard()
    card7.foldBackCard()
    card8.foldBackCard()
    card9.foldBackCard()
    card10.foldBackCard()
    card11.foldBackCard()
    card12.foldBackCard()
    card13.foldBackCard()
    card14.foldBackCard()
    card15.foldBackCard()
    card16.foldBackCard()
  }
  
  func setupNewGameplay() {
    PlayerStats.shared.changeTo(false, forStat: .LevelWon)
    self.physicsWorld.contactDelegate = self
    self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.85)
    self.anchorPoint = CGPoint.zero
    
    switch PlayerStats.shared.getCurrentValue(.CurrentLevel) {
    case 0:
      currentTimeForLevel = timeForGameWithoutTheLevelSystem
      currentMissionGoal = goalForLevel0001
    case 1:
      currentTimeForLevel = timeForLevel0001
      currentMissionGoal = goalForLevel0001
    case 2:
      currentTimeForLevel = timeForLevel0002
      currentMissionGoal = goalForLevel0002
    case 3:
      currentTimeForLevel = timeForLevel0003
      currentMissionGoal = goalForLevel0003
    case 4:
      currentTimeForLevel = timeForLevel0004
      currentMissionGoal = goalForLevel0004
    case 5:
      currentTimeForLevel = timeForLevel0005
      currentMissionGoal = goalForLevel0005
    case 6:
      currentTimeForLevel = timeForLevel0006
      currentMissionGoal = goalForLevel0006
    case 7:
      currentTimeForLevel = timeForLevel0007
      currentMissionGoal = goalForLevel0007
    case 8:
      currentTimeForLevel = timeForLevel0008
      currentMissionGoal = goalForLevel0008
    case 9:
      currentTimeForLevel = timeForLevel0009
      currentMissionGoal = goalForLevel0009
    case 10:
      currentTimeForLevel = timeForLevel0010
      currentMissionGoal = goalForLevel0010
    case 11:
      currentTimeForLevel = timeForLevel0011
      currentMissionGoal = goalForLevel0011
    case 12:
      currentTimeForLevel = timeForLevel0012
      currentMissionGoal = goalForLevel0012
    case 13:
      currentTimeForLevel = timeForLevel0013
      currentMissionGoal = goalForLevel0013
    case 14:
      currentTimeForLevel = timeForLevel0014
      currentMissionGoal = goalForLevel0014
    case 15:
      currentTimeForLevel = timeForLevel0015
      currentMissionGoal = goalForLevel0015
    case 16:
      currentTimeForLevel = timeForLevel0016
      currentMissionGoal = goalForLevel0016
    case 17:
      currentTimeForLevel = timeForLevel0017
      currentMissionGoal = goalForLevel0017
    case 18:
      currentTimeForLevel = timeForLevel0018
      currentMissionGoal = goalForLevel0018
    case 19:
      currentTimeForLevel = timeForLevel0019
      currentMissionGoal = goalForLevel0019
    case 20:
      currentTimeForLevel = timeForLevel0020
      currentMissionGoal = goalForLevel0020
    case 21:
      currentTimeForLevel = timeForLevel0021
      currentMissionGoal = goalForLevel0021
    case 22:
      currentTimeForLevel = timeForLevel0022
      currentMissionGoal = goalForLevel0022
    case 23:
      currentTimeForLevel = timeForLevel0023
      currentMissionGoal = goalForLevel0023
    case 24:
      currentTimeForLevel = timeForLevel0024
      currentMissionGoal = goalForLevel0024
    case 25:
      currentTimeForLevel = timeForLevel0025
      currentMissionGoal = goalForLevel0025
    case 26:
      currentTimeForLevel = timeForLevel0026
      currentMissionGoal = goalForLevel0026
    case 27:
      currentTimeForLevel = timeForLevel0027
      currentMissionGoal = goalForLevel0027
    case 28:
      currentTimeForLevel = timeForLevel0028
      currentMissionGoal = goalForLevel0028
    case 29:
      currentTimeForLevel = timeForLevel0029
      currentMissionGoal = goalForLevel0029
    case 30:
      currentTimeForLevel = timeForLevel0030
      currentMissionGoal = goalForLevel0030
    case 31:
      currentTimeForLevel = timeForLevel0031
      currentMissionGoal = goalForLevel0031
    case 32:
      currentTimeForLevel = timeForLevel0032
      currentMissionGoal = goalForLevel0032
    case 33:
      currentTimeForLevel = timeForLevel0033
      currentMissionGoal = goalForLevel0033
    default:
      break
    }
    
    counter = currentTimeForLevel
    totalTime = counter
  }
  
  func addBasicElements() {
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    background.zPosition = NodesZPositon.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
    
    scoreCountLabel = SKLabelNode(fontNamed: FontName)
    scoreCountLabel.fontSize = CGFloat(FontSize)
    scoreCountLabel.fontColor = FontColorScore
    scoreCountLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
    scoreCountLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    scoreCountLabel.text = "\(score)"
    scoreCountLabel.zPosition = NodesZPositon.uI.rawValue
    scoreCountLabel.position = CGPoint(x: self.frame.width * 0.9 - 10, y: self.frame.height * 0.85)
    self.addChild(scoreCountLabel)
    
    if appUsesTimeForLevels {
      counterLabel = SKLabelNode(fontNamed: FontName)
      counterLabel.fontSize = CGFloat(FontSize)
      counterLabel.fontColor = FontColorScore
      counterLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
      counterLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
      counterLabel.zPosition = NodesZPositon.uI.rawValue
      counterLabel.position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.85)
      self.addChild(counterLabel)
      
      startTimer()
    }
    
    pausePanelBackground = SKSpriteNode(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3), size: CGSize(width: self.frame.width, height: self.frame.height))
    pausePanelBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    pausePanelBackground.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    pausePanelBackground.zPosition = NodesZPositon.pausePanelBG.rawValue
    self.addChild(pausePanelBackground)
    
    pausePanel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    pausePanel.setScale(0.5)
    pausePanel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    pausePanel.zPosition = NodesZPositon.pausePanel.rawValue
    self.addChild(pausePanel)
    
    pausePanelResumeButton = RBButton(buttonImage: "Shared/MiniButtonResume", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Resume)
    })
    pausePanelResumeButton.setScale(0.5)
    pausePanelResumeButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.56)
    pausePanelResumeButton.zPosition = NodesZPositon.pausePanelButton.rawValue
    self.addChild(pausePanelResumeButton)
    
    pausePanelRestartButton = RBButton(buttonImage: "Shared/MiniButtonRestart", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Restart)
    })
    pausePanelRestartButton.setScale(0.5)
    pausePanelRestartButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.47)
    pausePanelRestartButton.zPosition = NodesZPositon.pausePanelButton.rawValue
    self.addChild(pausePanelRestartButton)
    
    pausePanelExitButton = RBButton(buttonImage: "Shared/MiniButtonExit", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Exit)
    })
    pausePanelExitButton.setScale(0.5)
    pausePanelExitButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.38)
    pausePanelExitButton.zPosition = NodesZPositon.pausePanelButton.rawValue
    self.addChild(pausePanelExitButton)
    
    pauseButton = RBButton(buttonImage: "Shared/MiniButtonPause", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Pause)
    })
    pauseButton.setScale(0.5)
    pauseButton.position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.1)
    pauseButton.zPosition = NodesZPositon.pausePanelButton.rawValue
    self.addChild(pauseButton)
    
    self.showPausePanel(show: false)
  }
  
  @objc func updateCounter() {
    
    if !isGameOver {
      
      counter -= 1
      
      let minutes = counter / 60
      var minutesText = "\(minutes)"
      let seconds = counter % 60
      var secondsText = "\(seconds)"
      
      if counter / 60 < 10 {
        minutesText = "0\(minutes)"
      }
      if counter % 60 < 10 {
        secondsText = "0\(seconds)"
      }
      
      counterLabel.text = "\(minutesText):\(secondsText)"
      
      if counter <= 0 {
        isGameOver = true
        gameOver(won: false)
      }
      
    }
    
  }
  
  func updateUI() {
    scoreCountLabel.text = "\(score)"
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Gameplay.updateCounter), userInfo: nil, repeats: true)
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .Pause:
      print("Button tapped: \(button.rawValue)")
      pauseButtonTapped()
    case .Resume:
      print("Button tapped: \(button.rawValue)")
      resumeGameplayTapped()
    case .Restart:
      print("Button tapped: \(button.rawValue)")
      restartButtonTapped()
    case .Exit:
      print("Button tapped: \(button.rawValue)")
      exitButtonTapped()
    }
  }
  
  func showPausePanel(show: Bool) {
    if show {
      pausePanelBackground.alpha = 1.0
      pausePanel.alpha = 1.0
      pausePanelResumeButton.alpha = 1.0
      pausePanelRestartButton.alpha = 1.0
      pausePanelExitButton.alpha = 1.0
      pauseButton.alpha = 0.0
    } else {
      pausePanelBackground.alpha = 0.0
      pausePanel.alpha = 0.0
      pausePanelResumeButton.alpha = 0.0
      pausePanelRestartButton.alpha = 0.0
      pausePanelExitButton.alpha = 0.0
      pauseButton.alpha = 1.0
    }
  }
  
  func pauseButtonTapped() {
    showPausePanel(show: true)
    pauseGameplay()
  }
  
  func pauseGameplay() {
    if appUsesTimeForLevels {
      timer.invalidate()
    }
    isScenePaused = true
  }
  
  func resumeGameplayTapped() {
    if appUsesTimeForLevels {
      startTimer()
    }
    showPausePanel(show: false)
    isScenePaused = false
  }
  
  func restartButtonTapped() {
    GameXManager.shared.transition(self, to: .Gameplay)
  }
  
  func exitButtonTapped() {
    
    if useLevelSystem {
      GameXManager.shared.transition(self, to: .MainMenuLevels)
    } else {
      GameXManager.shared.transition(self, to: .MainMenu)
    }
    
  }
  
  func gameOver(won: Bool) {
    if appUsesTimeForLevels {
      timer.invalidate()
    }
    
    PlayerStats.shared.changeTo(score, forStat: .CurrentScore)
    GCHelper.sharedInstance.reportLeaderboardIdentifier(leaderboardID, score: score)
    
    if won {
      if PlayerStats.shared.getCurrentBoolValue(.Sound) {
        run(SKAction.playSoundFileNamed(woshSoundFile, waitForCompletion: false))
      }
      PlayerStats.shared.changeTo(true, forStat: .LevelWon)
      PlayerStats.shared.changeTo(PlayerStats.shared.getCurrentValue(.CurrentLevel) + 1, forStat: .HighestUnlockedLevel)
      print(counter)
      
      switch counter {
        
      case 0 ... 10:
        PlayerStats.shared.changeTo(0, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
        
      case 11 ... 20:
        PlayerStats.shared.changeTo(1, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
        
      case 21 ... 30:
        PlayerStats.shared.changeTo(2, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
        
      case 31 ... totalTime:
        PlayerStats.shared.changeTo(3, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
        
      default:
        PlayerStats.shared.changeTo(0, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
      }
    } else {
      if PlayerStats.shared.getCurrentBoolValue(.Sound) {
        run(SKAction.playSoundFileNamed(hitSoundFile, waitForCompletion: false))
      }
      PlayerStats.shared.changeTo(false, forStat: .LevelWon)
      PlayerStats.shared.changeTo(0, forLevel: "Level\(PlayerStats.shared.getCurrentValue(.CurrentLevel))")
    }
    
    if useLevelSystem {
      GameXManager.shared.transition(self, to: .MissionEnded)
    } else {
      GameXManager.shared.transition(self, to: .GameOver)
    }
    
  }
  
}

