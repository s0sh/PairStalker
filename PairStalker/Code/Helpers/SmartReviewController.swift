//
//  SmartReviewController.swift
//  AntiCandyCrunch
//
//  Created by proffcoders on 22/09/2017.
//  Copyright © 2017 proffcoders. All rights reserved.
//

import Foundation
import StoreKit

final class SmartReviewController {
  // Can't init is singleton
  private init() { }
  
  static let shared = SmartReviewController()
  
  let runIncrementerSetting = "numberOfRuns"  // UserDefauls dictionary key where we store number of runs
  var minimumRunCount = 5                     // Minimum number of runs that we should have until we ask for review
  
  public func launch(rateAlertPromptAfterUses: Int) { // You have to call this from App Delegate.
    
    if #available(iOS 10.3, *) {
      minimumRunCount = rateAlertPromptAfterUses
    } else {
      // Fallback on earlier versions
      setupRateMyApp()
    }
  }
  
  public func trackAppUsage() {                   // counter for number of runs for the app.
    
    if #available(iOS 10.3, *) {
      let usD = UserDefaults()
      let runs = getRunCounts() + 1
      usD.setValuesForKeys([runIncrementerSetting: runs])
      usD.synchronize()
      showReview()
    } else {
      // Fallback on earlier versions
      RateMyApp.sharedInstance.trackAppUsage()
    }
    
  }
  
  public func rateApp() {
    RateMyApp.sharedInstance.okButtonPressed()
    print("[SmartReviewController] Rate button tapped. Going to the App Store. If your app is not yet on the App Store nothing will happen, but this is perfectly fine. The app will go to the app's page once it is live on the App Store.")
  }
  
  private func getRunCounts () -> Int {               // Reads number of runs from UserDefaults and returns it.
    
    let usD = UserDefaults()
    let savedRuns = usD.value(forKey: runIncrementerSetting)
    
    var runs = 0
    if (savedRuns != nil) {
      
      runs = savedRuns as! Int
    }
    
    print("[SmartReviewController] Run Counts are \(runs)")
    return runs
    
  }
  
  private func showReview() {
    
    let runs = getRunCounts()
    print("[SmartReviewController] Show Review")
    
    if (runs > minimumRunCount) {
      
      print("[SmartReviewController] Review Requested")
      if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
      } else {
        // Fallback on earlier versions
      }
      
    } else {
      
      print("[SmartReviewController] Runs are now enough to request review!")
      
    }
    
  }
  
  private func setupRateMyApp() {
    let rate = RateMyApp.sharedInstance
    rate.appID = appID
    //rate.debugEnabled(true)
    rate.promptAfterDays = rateAlertPromptAfterDays
    rate.promptAfterUses = rateAlertPromptAfterUses
    rate.daysBeforeReminding = rateAlertDaysBeforeReminding
    
  }
  
}

