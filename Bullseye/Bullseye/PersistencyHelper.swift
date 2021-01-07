//
//  PersistencyHelper.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 1/4/21.
//

import Foundation

class PersistencyHelper{
    static func saveHighScores(_ items: [HighScoreItem]){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: .atomic)
        }
        catch{
            print ("Error encoding items array\(error.localizedDescription).")
        }
    }
    
    static func loadHighScores() -> [HighScoreItem]{
        var items = [HighScoreItem]()
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do{
                items = try decoder.decode([HighScoreItem].self, from: data)
            }
            catch{
                print ("Error decoding items array\(error.localizedDescription).")
            }
        }
        return items
    }
    
    
    
    
    static func dataFilePath() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0].appendingPathComponent("HighScores.plist")
    }
    
}
