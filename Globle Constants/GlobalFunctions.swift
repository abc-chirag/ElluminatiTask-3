//
//  GlobalFunctions.swift
//  OneTouch
//
//  Created by Kartum Infotech on 20/05/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation
import AVKit
import MediaPlayer

func delay(time: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        closure()
    }
}

func DLog(_ items: Any?..., function: String = #function, file: String = #file, line: Int = #line) {
    if Application.debug {
        print("-----------START-------------")
        let url = NSURL(fileURLWithPath: file)
        print("Message = ", items, "\n\n(File: ", url.lastPathComponent ?? "nil", ", Function: ", function, ", Line: ", line, ")")
        print("-----------END-------------\n")
    }
}

//func getLocalizedString(key: String) -> String {
//    let languageCode = AppPrefsManager.shared.getLanguageCode()
//    if let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") {
//        let bundle = Bundle(path: path)
//        return NSLocalizedString(key, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
//    return NSLocalizedString(key, comment: "")
//}

//func getLocalizedString(key: LocalizedString) -> String {
//    return getLocalizedString(key: key.rawValue)
//}
