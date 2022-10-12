//
//  MenuViewModel.swift
//  ElluminatiTask
//
//  Created by macbook on 19/08/22.
//

import Foundation

class MenuViewModel: NSObject {
   
    var savedData = [SaveInfoModel]()

     func getData(completion: @escaping(Pakage?) -> Void) {
        readFromFile(fileName: "item_data", completion: completion)
    }
    
     func readFromFile<T>(fileName: String, completion: @escaping (T?) -> Void) where T : Decodable {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                
                completion(decodedData)
            }
        } catch (let error) {
            print(error)
        }
    }
    
    func refresh() {
        savedData = RealmDBServices.shared.getDataFromDB(object: SaveInfoModel.self).toArray(SaveInfoModel.self)
    }
    
    
}
