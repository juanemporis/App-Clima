//
//  CityDetailsWorker.swift
//  App Clima
//
//  Created by juan castañeda on 2/08/22.
//

import Foundation

class CityDetailsWorker {
    
    func update(cities: [String]) {
        
        let defaults = UserDefaults.standard
        defaults.set(cities, forKey: "cities")
    }
}
