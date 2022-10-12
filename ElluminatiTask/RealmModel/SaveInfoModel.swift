//
//  SaveInfoModel.swift
//  ElluminatiTask
//
//  Created by macbook on 26/08/22.
//

import Foundation
import RealmSwift

class SaveInfoModel: Object {
    
    //MARK:- properties
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var selectedCatagoty: String = ""
    @objc dynamic var total: String = ""
    @objc dynamic var finalTotal: String = ""
    @objc dynamic var repeatCount: String = ""
    
}
