//
//  WeatherWorker.swift
//  App Clima
//
//  Created by juan castañeda on 2/08/22.
//

import Foundation

class WeatherWorker {
    
    func retriveDetails(of city: String, completion: @escaping (Int, WeatherModel?) -> Void) {
        
        let url = "http://api.openweathermap.org/data/2.5/weather"
        
        let parameters = [
            "q": city,
            "appid" : "71c3e78149e90edcb26b5c8bf57708fa",
            "units": "metric",
            "lang" : "es"
        ]
        
        APIClient.shared.get(url, parameters: parameters) {
            (status : Int, response: WeatherResponseDataModel?) in
            
            guard let response = response else {
                return
            }
            
            completion(status, WeatherModelMapper()
                .mapDataModelToModel(dataModel: response))
        }
    }
}
