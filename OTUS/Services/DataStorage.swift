//
//  DataStorage.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 12.09.2022.
//

import Foundation

class DataStorage {
    
    var newsType: NewsType? {
        get {
            guard let newsType = UserDefaults.standard.value(forKey: "newsType") as? String else {
                return nil
            }
            print("newsType DataStorage get: \(newsType)")
            return NewsType(rawValue: newsType)
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: "newsType")
        }
    }
    
    init() {
        
    }
}
