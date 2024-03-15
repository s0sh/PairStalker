//
//  SmartAdMobConstants.swift
//  SmartAdMob
//
//  Created by proffcoders on 31/05/2017.
//  Copyright © 2017 proffcoders. All rights reserved.
//

// SmartAdMobConstants

//----------------------------
// Device UUID
//----------------------------
let adMobMyDeviceUUID = "" // used only for testing; optional for release
//----------------------------

//----------------------------
// AdMob IDs
//----------------------------
// to get started go to: https://apps.admob.com/v2/home

// your application ID
let adMobApplicationId = "ca-app-pub-2418336475707687~3164680893" // required

// at least one AdUnitId is required
// leave as an empty string ("") if you do not want to use the ad type (and you did not set it up in the AdMob Dashboard)

// Also make sure you LINK your AdMob app to irebase and add your GoogleService-Info.plist file

//let adMobBannerAdUnitId = "ca-app-pub-3940256099942544/2934735716" // for testing purposes
let adMobBannerAdUnitId = "ca-app-pub-2418336475707687~3164680893"

let adMobInterstitialAdUnitId = "ca-app-pub-2418336475707687/8466599721"
let showAdMobInterstitalInsteadOfChartboostOnMainMenu = true // needs showAdsOnMainMenu set to true
let showAdMobInterstitalInsteadOfChartboostOnGameOver = true // needs showAdsOnGameOver set to true

let adMobRewardBasedVideoAdUnitId = ""// Not aplicable

//----------------------------
// Ad Frequencies
//----------------------------
// set the frequency of the 'interstitials' and 'reward based video ads'
// choose a number between 1 (hard value) and 10 (suggested value; could be more if you widh, but not advised)
// the smaller the number you choose the more often will the ads show
// set it to 1 if you want an ad to be shown on every occasion

let smartAdMobInterstitialFrequency = 3 // needs to be a number greater than or equal to 1 (do not set it to 0) // Not aplicable
let smartAdMobRewardBasedVideoFrequency = 2 // needs to be a number greater than or equal to 1 (do not set it to 0) // Not aplicable

// note: banner ads do not need a frequency as they are always on screen

//----------------------------
// Banner Ad Animation Delay
//----------------------------
// if you choose to animate (shake) the banner periodically than you can set the time (in seconds) between the animations
let smartAdMobBannerAnimationDelay = 30
