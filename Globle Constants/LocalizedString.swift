//
//  LocalizedString.swift
//  OneTouch
//
//  Created by Kartum on 05/06/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation

enum LocalizedString: String {
    
    case error =    "error"
    case noNetworkConnection          =   "noNetworkConnection"
    case checkConnectionMsg           =   "checkConnectionMsg"
    case cameraNotAvailable           =   "cameraNotAvailable"
    case photoLibraryNotAvailable     =   "photoLibraryNotAvailable"
    case ConfirmPassword              =  "ConfirmPassword"
    case Image                        =  "Image"
    case enterYourName                =  "enterYourName"
    case enterYourEmail               =  "enterYourEmail"
    case description                  = "description"
    case Somethingwrong               =  "Somethingwrong"
    
    //Login
    case Login                      =   "Login"
    case Country                    =   "Country"
    case MobileNumber               =   "MobileNumber"
    case selectCountry              =   "selectCountry"
    case enterPhoneNumber           =   "enterPhoneNumber"
    case phoneNumberValidation      =   "phoneNumberValidation"
    case enterOtp                   =   "enterOtp"
    case Continue                   =   "Continue"
    case TurkTalk                   =   "TurkTalk"
    
    //Registration
    case Enterthecode     =   "Enterthecode"
    case Requestagain     =   "Requestagain"
    case Confirm          =   "Confirm"
    case Registration     =   "Registration"
    
    //Login
    case Email            =  "Email"
    case UserName         =   "UserName"
    case Password         =   "Password"
    case Submit           =   "Submit"
    
    //Tapbar
    case Home             =   "Home"
    case Contacts         =   "Contacts"
    case Map              =   "Map"
    case Radar            =   "Radar"
    case Settings         =   "Settings"
    
    //Setting
    case Language         =   "Language"
    case Profile          =   "Profile"
    case User             =   "User"
    case Friends          =   "Friends"
    case TurkTalkWebside  =   "TurkTalkWebside"
    case Condition        =   "Condition"
    case Imprint          =   "Imprint"
    case DataProtection   =   "DataProtection"
    case Account          =   "Account"
    case BanUsers        =   "BanUsers"
    case Logout          = "Logout"
    case logoutConfirmationMsg          = "logoutConfirmationMsg"
    
    //Language
    case Languages       = "Languages"
    case Turkish          = "Turkish"
    case English          = "English"
    case Germany          = "Germany"
    case germany          = "germany"
    
    //Status
    case MainStatus         = "MainStatus"
    case YourStatus        =   "YourStatus"
    case Available          =   "Available"
    case Busy               =   "Busy"
    case Offline            =   "Offline"
    case Finished           =   "Finished"
    case Silent             =   "Silent"
    case Friend             =   "Friend"
    case Search             =  "Search"
    
    //Profile
    case PhotoUpload        =  "PhotoUpload"
    case TakePhoto          = "TakePhoto"
    case ChangePassword     =  "ChangePassword"
    case ReportProblem      = "ReportProblem"
    case enterFullName      =   "enterFullName"
    case enterEmail         =   "enterEmail"
    case enterValidEmail    =   "enterValidEmail"
    case enterWebsite       =   "enterWebsite"
    case Update             =   "Update"
    case Enterthefullname = "Enterthefullname"
    case Enteremail = "Enteremail"
    case Enteryourwebsite = "Enteryourwebsite"
    
    //Report Problem
    case Describetheproblem     = "Describetheproblem"
    case Enteryourname           = "Enteryourname"
    case Enteryouremailaddress   = "Enteryouremailaddress"
    case Send                   = "Send"
    
    //Home
    // case TurkTalk       = "TurkTalk"
    case ScantheQRCode      =   "ScantheQRCode"
    case Directory          =   "Directory"
    case TurktalkContacts   =   "TurktalkContacts"
    case Ban8Hour           =   "Ban8Hour"
    case BanFor1week        =   "BanFor1week"
    case Ban30days          =   "Ban30days"
    case BanPermanently     =   "BanPermanently"
    case AllUser            =   "AllUser"
    
    //Contacts
    case ContactlblDescriptionOption = "ContactlblDescriptionOption"
    
    //Abort
    case AddasFriend        = "AddasFriend"
    case Invite             = "Invite"
    case Pending            = "Pending"
    case Received           = "Received"
    case Abort              = "Abort"
    
    //QR Code Scan
    
    case QRCodeScan       =  "QRCodeScan"
    case ScantheQRfromyourmobilephone = "ScantheQRfromyourmobilephone"
    
    //Channels
    case Channels            = "Channels"
    case Edit                = "Edit"
    case TurkishReise2020    = "TurkishReise2020"
    case FindChannel         =  "FindChannel"
    case AddChannel          =  "AddChannel"
    case CreateChannel       = "CreateChannel"
    case enterChannelName   =   "enterChannelName"
    case EnterDescription   = "EnterDescription"
    case Description        = "Description"
    case EnterLocation      = "EnterLocation"
    case EncryptChannel     = "EncryptChannel"
    case selectPicture      =   "selectPicture"
    case Join               =   "Join"
    //SideMenu
    case Status             = "Status"
    case News               = "News"
    case QRCode             = "QRCode"
    case Messages           =  "Messages"
    case Notifications      =   "Notifications"
    //Inbox
    case Inbox              =  "Inbox"
    
    //actionsheet
    case Camera             = "Camera"
    case Photo              = "Photo"
    case Cancel             = "Cancel"
    case Gallery            = "Gallery"
    case Document           = "Document"
    case Done               = "Done"
    case massage            = "massage"
    case requestSent        =   "requestSent"
    case joined             =   "joined"
    case joinRequestIsPendingForApproval    =   "joinRequestIsPendingForApproval"
    case joinChannelToStartTalk             =   "joinChannelToStartTalk"
    case Accepted           = "Accepted"
    case channelDetails     =   "channelDetails"
    case selectChannelToSendSOS             =   "selectChannelToSendSOS"
    case sosSent            =   "sosSent"
    case InvalidQrCode      = "InvalidQrCode"
    case Leave              = "Leave"
    
    case deleteChat         =   "deleteChat"
    case deleteChatConfirmation      =   "deleteChatConfirmation"
    case no                 =   "no"
    case yes                =   "yes"
    
    case remove =   "remove"
    case BanUser        =   "BanUser"
    
    case invalidMobileNumber  =   "invalidMobileNumber"
    case tooManyRequests      = "tooManyRequests"
    case invalidCode          = "invalidCode"
    case smsCodeExpired       = "smsCodeExpired"
    case otpSentSuccess       = "otpSentSuccess"
    
    case newMsgReceived     =   "newMsgReceived"
    
    case LocationOfLinemap    = "Allow Turk Talk to turn or your device GPS for accessing the Map Option"
    case LocationOfLineradar  = "Allow Turk Talk to turn or your device GPS for accessing the radar Option"
    
    case Ok                   = "Ok"
    case Dear                 = "Dear"
    
    
    
}
