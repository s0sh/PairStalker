//
//  GameOver.swift
//  BallaceTheBall
//
//  Created by Alpar on 04/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: SKScene {
  
  var background = SKSpriteNode(imageNamed: "Shared/MiniBackground")
  var mainMenuButton: RBButton!
  var replayButton: RBButton!
  var shareButton: RBButton!
  
  var bestScoreTextLabel = SKLabelNode()
  var bestScore = 0
  var bestScoreLabel = SKLabelNode()
  var scoreTextLabel = SKLabelNode()
  var score = 0
  var scoreLabel = SKLabelNode()
  var shareImage: UIImage!
  
  enum NodesZPosition: CGFloat {
    case background = 0, label = 1, button = 2
  }
  
  enum RBButtonType: String {
    case MainMenu
    case Replay
    case Share
  }
  
  override func didMove(to view: SKView) {
    
    if showAdsOnGameOver {
      if showAdMobInterstitalInsteadOfChartboostOnGameOver {
        NotificationCenter.default.post(name: NSNotification.Name("swowAdMobInterstitial"), object: nil, userInfo: nil)
      } else {
        showAds()
      }
    }
    
    self.anchorPoint = CGPoint.zero

    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    //background.setScale(0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
  
    mainMenuButton = RBButton(buttonImage: "Shared/MiniButtonHome", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .MainMenu)
    })
    mainMenuButton.setScale(0.5)
    mainMenuButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.15)
    mainMenuButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(mainMenuButton)
    
    replayButton = RBButton(buttonImage: "Shared/MiniButtonReplay", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Replay)
    })
    replayButton.setScale(0.5)
    replayButton.position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.3)
    replayButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(replayButton)
    
    shareButton = RBButton(buttonImage: "Shared/MiniButtonShare", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Share)
    })
    shareButton.setScale(0.5)
    shareButton.position = CGPoint(x: self.frame.width * 0.7, y: self.frame.height * 0.3)
    shareButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(shareButton)
    
    bestScoreTextLabel.position = CGPoint(x: self.frame.width * 0.6, y: self.frame.height * 0.8)
    bestScoreTextLabel.fontName = FontName
    bestScoreTextLabel.fontSize = CGFloat(FontSize)
    bestScoreTextLabel.fontColor = FontColorScore
    bestScoreTextLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
    bestScoreTextLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    bestScoreTextLabel.text = "Best Score :"
    bestScoreTextLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(bestScoreTextLabel)
    
    bestScore = PlayerStats.shared.getCurrentValue(.BestScore)
    
    bestScoreLabel.position = CGPoint(x: self.frame.width * 0.6 + 10, y: self.frame.height * 0.8)
    bestScoreLabel.fontName = FontName
    bestScoreLabel.fontSize = CGFloat(FontSize)
    bestScoreLabel.fontColor = FontColorScore
    bestScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    bestScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    bestScoreLabel.text = "\(bestScore)"
    bestScoreLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(bestScoreLabel)
    
    scoreTextLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.65)
    scoreTextLabel.fontName = FontName
    scoreTextLabel.fontSize = CGFloat(FontSize) * 3
    scoreTextLabel.fontColor = FontColorScore
    scoreTextLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    scoreTextLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    scoreTextLabel.text = "Score"
    scoreTextLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(scoreTextLabel)
    
    score = PlayerStats.shared.getCurrentValue(.CurrentScore)
    
    scoreLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    scoreLabel.fontName = FontName
    scoreLabel.fontSize = CGFloat(FontSize) * 6
    scoreLabel.fontColor = FontColorScore
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    scoreLabel.text = "\(score)"
    scoreLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(scoreLabel)
    
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .MainMenu:
      mainMenuButtonTapped()
    case .Replay:
      replayButtonTapped()
    case .Share:
      shareButtonTapped()
    }
  }

  
  func mainMenuButtonTapped() {
    GameXManager.shared.transition(self, to: .MainMenu)
  }
  
  func replayButtonTapped() {
    GameXManager.shared.transition(self, to: .Gameplay)
  }
  
  func shareButtonTapped() {
    shareScore()
  }
  
  func shareScore(){
    //loadImageForScoreShare(String(describing: Bundle.main.url(forResource: LocalNotificationAttachmentName, withExtension: LocalNotificationAttachmentExtention)))
    openShareScoreController()
  }
  
  func openShareScoreController() {
    let vc = self.view?.window?.rootViewController
    
    let myText = ShareScoreTextFirstPart + String(PlayerStats.shared.getCurrentValue(.CurrentScore)) + ShareScoreTextSecondPart
    
    let shareImage = UIImage(named: "Shared/ShareImage")
    
    let activityVC:UIActivityViewController = UIActivityViewController(activityItems: [shareImage!, myText], applicationActivities: nil)
    
    // added for iPad
    activityVC.popoverPresentationController?.sourceView = self.view
    
    vc?.present(activityVC, animated: true, completion: nil)
  }
  
  func loadImageForScoreShare(_ urlString:String){
    
    let imgURL: URL = URL(string: urlString)!
    let request: URLRequest = URLRequest(url: imgURL)
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: {
      (data, response, error) -> Void in
  
      if (error == nil && data != nil){
        func display_image(){
          self.shareImage = UIImage(data: data!)
          self.openShareScoreController()
        }
            DispatchQueue.main.async(execute: display_image)
            } else {
              // alert no image
          }
    })
  
      task.resume()
    }
  
  func showAds() {
    if !PlayerStats.shared.getCurrentBoolValue(.HasPurchasedNoAds) {
      if !Chartboost.hasInterstitial(CBLocationGameOver) {
        Chartboost.cacheInterstitial(CBLocationGameOver)
      }
      Chartboost.showInterstitial(CBLocationGameOver)
      Chartboost.cacheInterstitial(CBLocationGameOver)
    }
  }
  
}
