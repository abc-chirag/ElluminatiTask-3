//
//  PakageViewModel.swift
//  ElluminatiTask
//
//  Created by macbook on 19/08/22.
//

import Foundation

enum PakageOptions: String {
    
    //MARK:-  case
    case apartmentSize = "Apartment Size"
    case bedroomCleaning = "Bedroom Cleaning"
    case bathroomCleaning = "Bathroom Cleaning"
    case livingRoomDiningRoomCleaning = "Living Room/Dining Room Cleaning"
    case kitchenCleaning = "Kitchen Cleaning"
    case note = ""
    case notes = " "

    //MARK:- Functions
    func icon() ->  String {
        
        switch self {
      
        case .apartmentSize:
            return "Apartment Size"
        case .bedroomCleaning:
            return "Bedroom Cleaning"
        case .bathroomCleaning:
            return "Bathroom Cleaning"
        case .livingRoomDiningRoomCleaning:
            return "Living Room/Dining Room Cleaning"
        case .kitchenCleaning:
            return "Kitchen Cleaning"
        case .note:
            return ""
        
    case .notes:
        return ""
        }
    }
}

class PakageViewModel: NSObject {

    var pakageInfo: Pakage!
    var arrListForApartment = [List]()
    var arrListForBedRoom = [List]()
    var arrListForBathroomCleaning = [List]()
    var arrLivingRoomDiningRoomCleaning = [List]()
    var arrListForKitchenCleaning = [List]()
    var arrIn = [Int]()
    
    var arrpakageOptions = [PakageOptions]()
    var arrSelectedIndex = [Int]()
    
    // MARK: - Init
    override init() {
        super.init()
        generateOptionArray()
    }
    // MARK: - Functions
     func generateOptionArray() {
        if arrSelectedIndex == [3] {
            arrpakageOptions.removeAll()
            arrpakageOptions.append(.apartmentSize)
            arrpakageOptions.append(.bedroomCleaning)
            arrpakageOptions.append(.livingRoomDiningRoomCleaning)
            arrpakageOptions.append(.kitchenCleaning)
            arrpakageOptions.append(.note)
            arrpakageOptions.append(.notes)
        } else {
            arrpakageOptions.removeAll()
            arrpakageOptions.append(.apartmentSize)
            arrpakageOptions.append(.bedroomCleaning)
            arrpakageOptions.append(.bathroomCleaning)
            arrpakageOptions.append(.livingRoomDiningRoomCleaning)
            arrpakageOptions.append(.kitchenCleaning)
            arrpakageOptions.append(.note)
            arrpakageOptions.append(.notes)
        }
    }
}
