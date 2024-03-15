//
//  MainMenuLevels.swift
//  SkyDiving
//
//  Created by proffcoders on 27/12/2016.
//  Copyright © 2016 proffcoders. All rights reserved.
//

import SpriteKit

class MainMenuLevels: SKScene {
  
  weak var scrollView: SwiftySKScrollView?
  let moveableNode = SKNode()
  
  var background1 = SKSpriteNode(imageNamed: "Shared/BackgroundWorld1")
  var background2 = SKSpriteNode(imageNamed: "Shared/BackgroundWorld2")
  var background3 = SKSpriteNode(imageNamed: "Shared/BackgroundWorld3")
  var appTitle = SKSpriteNode()
  var settingsButton: RBButton!
  
  var levelButtonsArray = [RBButton!]()
  var levelButtonsPositionArray = [CGPoint]()
  
  enum NodesZPosition: CGFloat {
    case background = 0, appTitle = 1, button = 2
  }
  
  enum RBButtonType: String {
    case Settings
    case MoreGames
    case Level
  }
  
  override func didMove(to view: SKView) {
    
    if showAdsOnMainMenu {
      if showAdMobInterstitalInsteadOfChartboostOnMainMenu {
        NotificationCenter.default.post(name: NSNotification.Name("swowAdMobInterstitial"), object: nil, userInfo: nil)
      } else {
        showAds()
      }
    }
    
    self.anchorPoint = CGPoint.zero
    
    
    addChild(moveableNode)
    
    scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), moveableNode: moveableNode, direction: .horizontal)
    scrollView?.contentSize = CGSize(width: scrollView!.frame.width * 3, height: scrollView!.frame.height) // * 3 makes it three times as wide
    view.addSubview(scrollView!)
    view.sendSubview(toBack: scrollView!)
    scrollView?.setContentOffset(CGPoint(x: 0  + frame.width * 2, y: 0), animated: true)
    
    guard let scrollView = scrollView else { return } // unwrap  optional
    
    let page1ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
    page1ScrollView.position = CGPoint(x: 0 - (frame.width * 2), y: 0)
    page1ScrollView.zPosition = NodesZPosition.background.rawValue
    moveableNode.addChild(page1ScrollView)
    
    let page2ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
    page2ScrollView.position = CGPoint(x: 0 - (frame.width), y: 0)
    page2ScrollView.zPosition = NodesZPosition.background.rawValue
    moveableNode.addChild(page2ScrollView)
    
    let page3ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
    page3ScrollView.position = CGPoint(x: 0, y: 0)
    page3ScrollView.zPosition = NodesZPosition.background.rawValue
    moveableNode.addChild(page3ScrollView)
    
    background1.anchorPoint = CGPoint.zero
    background1.position = CGPoint(x: self.frame.width * 0.0, y: self.frame.height * 0.0)
    background1.zPosition = NodesZPosition.background.rawValue
    background1.size = CGSize(width: self.frame.width, height: self.frame.height)
    page1ScrollView.addChild(background1)
    
    background2.anchorPoint = CGPoint.zero
    background2.position = CGPoint(x: self.frame.width * 0.0, y: self.frame.height * 0.0)
    background2.zPosition = NodesZPosition.background.rawValue
    background2.size = CGSize(width: self.frame.width, height: self.frame.height)
    page2ScrollView.addChild(background2)
    
    background3.anchorPoint = CGPoint.zero
    background3.position = CGPoint(x: self.frame.width * 0.0, y: self.frame.height * 0.0)
    background3.zPosition = NodesZPosition.background.rawValue
    background3.size = CGSize(width: self.frame.width, height: self.frame.height)
    page3ScrollView.addChild(background3)
    
    appTitle = SKSpriteNode(imageNamed: "Shared/MiniTitle")
    appTitle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    appTitle.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
    appTitle.setScale(0.5)
    appTitle.zPosition = NodesZPosition.appTitle.rawValue
    self.addChild(appTitle)
    
    settingsButton = RBButton(buttonImage: "Shared/ButtonOptions", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Settings)
    })
    settingsButton.setScale(0.5)
    settingsButton.position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.8)
    settingsButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(settingsButton)
    
    let level1Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.2)
    let level2Position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.27)
    let level3Position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.4)
    let level4Position = CGPoint(x: self.frame.width * 0.15, y: self.frame.height * 0.52)
    let level5Position = CGPoint(x: self.frame.width * 0.25, y: self.frame.height * 0.65)
    let level6Position = CGPoint(x: self.frame.width * 0.45, y: self.frame.height * 0.67)
    let level7Position = CGPoint(x: self.frame.width * 0.65, y: self.frame.height * 0.65)
    let level8Position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.52)
    let level9Position = CGPoint(x: self.frame.width * 0.7, y: self.frame.height * 0.42)
    let level10Position = CGPoint(x: self.frame.width * 0.63, y: self.frame.height * 0.33)
    let level11Position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.25)
    let level12Position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.24)
    
    let level13Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.27)
    let level14Position = CGPoint(x: self.frame.width * 0.25, y: self.frame.height * 0.35)
    let level15Position = CGPoint(x: self.frame.width * 0.12, y: self.frame.height * 0.45)
    let level16Position = CGPoint(x: self.frame.width * 0.07, y: self.frame.height * 0.55)
    let level17Position = CGPoint(x: self.frame.width * 0.25, y: self.frame.height * 0.63)
    let level18Position = CGPoint(x: self.frame.width * 0.45, y: self.frame.height * 0.64)
    let level19Position = CGPoint(x: self.frame.width * 0.65, y: self.frame.height * 0.63)
    let level20Position = CGPoint(x: self.frame.width * 0.79, y: self.frame.height * 0.55)
    let level21Position = CGPoint(x: self.frame.width * 0.77, y: self.frame.height * 0.45)
    let level22Position = CGPoint(x: self.frame.width * 0.78, y: self.frame.height * 0.35)
    let level23Position = CGPoint(x: self.frame.width * 0.90, y: self.frame.height * 0.26)
    
    let level24Position = CGPoint(x: self.frame.width * 0.15, y: self.frame.height * 0.27)
    let level25Position = CGPoint(x: self.frame.width * 0.32, y: self.frame.height * 0.35)
    let level26Position = CGPoint(x: self.frame.width * 0.25, y: self.frame.height * 0.45)
    let level27Position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.55)
    let level28Position = CGPoint(x: self.frame.width * 0.35, y: self.frame.height * 0.63)
    let level29Position = CGPoint(x: self.frame.width * 0.55, y: self.frame.height * 0.67)
    let level30Position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.55)
    let level31Position = CGPoint(x: self.frame.width * 0.63, y: self.frame.height * 0.45)
    let level32Position = CGPoint(x: self.frame.width * 0.76, y: self.frame.height * 0.36)
    let level33Position = CGPoint(x: self.frame.width * 0.86, y: self.frame.height * 0.25)
    
    
    for i in 0 ... 32 {
      
      let starsCount = PlayerStats.shared.getStars("Level\(i + 1)")
      
      print("The stars are: \(starsCount)")
      
      let levelButton = RBButton(buttonImage: "Shared/ButtonLevel", title: "\(i + 1)" , withStars: true, starsCount: starsCount, buttonAction: {
        PlayerStats.shared.changeTo(i + 1, forStat: .CurrentLevel)
        self.didTap(button: .Level)
      })
      
      if i >= PlayerStats.shared.getCurrentValue(.HighestUnlockedLevel) {
        levelButton.disableButton()
        levelButton.button.texture = SKTexture(imageNamed: "Shared/ButtonLevelLocked")
      }
      
      var currentLevelButtonPosition = CGPoint.zero
      
      switch i {
      case 0:
        currentLevelButtonPosition = level1Position
      case 1:
        currentLevelButtonPosition = level2Position
      case 2:
        currentLevelButtonPosition = level3Position
      case 3:
        currentLevelButtonPosition = level4Position
      case 4:
        currentLevelButtonPosition = level5Position
      case 5:
        currentLevelButtonPosition = level6Position
      case 6:
        currentLevelButtonPosition = level7Position
      case 7:
        currentLevelButtonPosition = level8Position
      case 8:
        currentLevelButtonPosition = level9Position
      case 9:
        currentLevelButtonPosition = level10Position
      case 10:
        currentLevelButtonPosition = level11Position
      case 11:
        currentLevelButtonPosition = level12Position
      case 12:
        currentLevelButtonPosition = level13Position
      case 13:
        currentLevelButtonPosition = level14Position
      case 14:
        currentLevelButtonPosition = level15Position
      case 15:
        currentLevelButtonPosition = level16Position
      case 16:
        currentLevelButtonPosition = level17Position
      case 17:
        currentLevelButtonPosition = level18Position
      case 18:
        currentLevelButtonPosition = level19Position
      case 19:
        currentLevelButtonPosition = level20Position
      case 20:
        currentLevelButtonPosition = level21Position
      case 21:
        currentLevelButtonPosition = level22Position
      case 22:
        currentLevelButtonPosition = level23Position
      case 23:
        currentLevelButtonPosition = level24Position
      case 24:
        currentLevelButtonPosition = level25Position
      case 25:
        currentLevelButtonPosition = level26Position
      case 26:
        currentLevelButtonPosition = level27Position
      case 27:
        currentLevelButtonPosition = level28Position
      case 28:
        currentLevelButtonPosition = level29Position
      case 29:
        currentLevelButtonPosition = level30Position
      case 30:
        currentLevelButtonPosition = level31Position
      case 31:
        currentLevelButtonPosition = level32Position
      case 32:
        currentLevelButtonPosition = level33Position
        
      default:
        print("Ooops, no such button position.")
      }
      
      levelButton.setScale(0.5)
      levelButton.position = currentLevelButtonPosition
      
      levelButton.zPosition = NodesZPosition.button.rawValue
      
      if i >= 0 && i < 12 {
        page1ScrollView.addChild(levelButton)
      } else if i >= 12 && i < 23 {
        page2ScrollView.addChild(levelButton)
      } else if i >= 23 && i <= 32 {
        page3ScrollView.addChild(levelButton)
      }
      
      levelButtonsArray.append(levelButton)
      
    }
    
  }
  
  override func willMove(from view: SKView) {
    scrollView?.removeFromSuperview()
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .Settings:
      settingsButtonTapped()
    case .MoreGames:
      moreGamesButtonTapped()
    case .Level:
      levelTapped()
    }
  }
  
  func settingsButtonTapped() {
    GameXManager.shared.transition(self, to: .Settings)
  }
  
  func moreGamesButtonTapped() {
    if !Chartboost.hasMoreApps(CBLocationSettings) {
      Chartboost.cacheMoreApps(CBLocationSettings)
    }
    Chartboost.showMoreApps(CBLocationSettings)
    Chartboost.cacheMoreApps(CBLocationSettings)
  }
  
  func levelTapped() {
    GameXManager.shared.transition(self, to: .StartMission)
  }
  
  func showAds() {
    if !PlayerStats.shared.getCurrentBoolValue(.HasPurchasedNoAds) {
      if !Chartboost.hasInterstitial(CBLocationMainMenu) {
        Chartboost.cacheInterstitial(CBLocationMainMenu)
      }
      Chartboost.showInterstitial(CBLocationMainMenu)
      Chartboost.cacheInterstitial(CBLocationMainMenu)
    }
  }
  
  
}
