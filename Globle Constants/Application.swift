//
//  Application.swift
//  TaskUp
//
//  Created by Kartum on 27/07/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation
import UIKit
import Nuke

/// Application
struct Application {
    
    /// Placeholder
        static let placeHolderImageCommon = UIImage(named: "")
        static let placeHolderAvatarImageCommon = UIImage(named: "ic_sidemenu_user")
        static let placeHolderOptionsNuke = ImageLoadingOptions(
            placeholder: Application.placeHolderImageCommon,
            transition: .fadeIn(duration: 0.1)
        )
        
        static let placeHolderOptionsNukeForAvatarImage = ImageLoadingOptions(
            placeholder: Application.placeHolderAvatarImageCommon,
            transition: .fadeIn(duration: 0.1)
        )
    
    /// Debug Log enable or not
    static let isDevelopmentMode = true
    static let debug: Bool = true
    
    static let appURL = "https://apps.apple.com/in/app/whatsapp-messenger/id310633997"
    
    static let API_KEY  =   ""
    
    static let GOOGLE_API_KEY   =   ""
    static let googleClientId = ""
    static let defaultIntervalToRemindAgo = 30
    static let viewTabBottomInsertHeightIphone: CGFloat = 130
    static let viewTabBottomInsertHeightIpad: CGFloat = 220
  
    /// Application Mode
    static let mode = Mode.sendbox
    
    /// Application in production or sendbox
    enum Mode {
        case sendbox
        case production
    }
    
    
    
   
    
    
    /// App Color
    struct Color {
        static let Color_menu = UIColor(named: "Color_menu")!
        static let Color_2D3848 = UIColor(named: "Color_2D3848")!
        static let Color_7D8A9E = UIColor(named: "Color_7D8A9E")!
        static let Color_22B5A3 = UIColor(named: "Color_22B5A3")!
        static let Color_ADF1E9 = UIColor(named: "Color_ADF1E9")!
        static let Color_08E9BB = UIColor(named: "Color_08E9BB")!
    }
    
    /// App Fonts
    struct Font {
        static let Poppins_Black      =  "Poppins-Black"
        static let Poppins_Bold       =  "Poppins-Bold"
        static let Poppins_ExtraBold  =  "Poppins-ExtraBold"
        static let Poppins_Medium     =  "Poppins-Medium"
        static let Poppins_Regular    =  "Poppins-Regular"
        static let Poppins_SemiBold   =  "Poppins-SemiBold"
    }
    
    struct Device {
        static let version = UIDevice.current.systemVersion
    }
    
//    struct CountryCode {
//        static let code = isDevelopmentMode ? "+65" : "+65"
//    }
}

extension Notification.Name {
    static let refreshData    =   Notification.Name("REFRESH_DATA")
    static let refreshContactsinDuplicate  =  Notification.Name("DUPLICATE_REFRESH_CONTACTS")
    static let loginUserStatuseDidChange = Notification.Name("loginUserDidChange")
    static let addShareByMeDoc = Notification.Name("addShareByMeDoc")
    static let loginUserInShare = Notification.Name("loginUserInShare")
    static let updateSearchData = Notification.Name("updateSerachData")
    static let updateModifiteAt = Notification.Name("updateModifiteAt")
    
//    static let USER_PROFILE_STATUS_CHANGED  =   Notification.Name("USER_PROFILE_STATUS_CHANGED")
}

extension Application {
    /// Firestore
    struct FirestoreTable {
        static let users            =   "users"
        static let shared_ringtones_storage =   "shared_ringtones"
        static let profile_pictures_storage =   "profile_pictures"
    }
}
