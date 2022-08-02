//
//  AddCityWorker.swift
//  App Clima
//
//  Created by juan castañeda on 2/08/22.
//

import Foundation

class AddCityWorker {
    
    func save(city: String) {
        
        var cities = retrieveCities()
        cities.insert(city, at: 0)
        
        let defaults = UserDefaults.standard
        defaults.set(cities, forKey: "cities")
        
        debugPrint(retrieveCities())
        
    }
    
    func retrieveCities() -> [String] {
        
        let defaults = UserDefaults.standard
        return defaults.array(forKey: "cities") as? [String] ?? [String]()
    }
}
