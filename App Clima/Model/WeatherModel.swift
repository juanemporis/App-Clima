//
//  WeatherModel.swift
//  App Clima
//
//  Created by juan castañedaon 30/07/22.
//

import Foundation

//
struct WeatherModel {
    let city : String
    let weather : String
    let description : String
    let iconURL : URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    
    //Se creo un modelo vacio de weatherModel para evitar tener opcionales
    static let empty: WeatherModel = .init(city: "No city",
                                           weather: "No weather",
                                           description: "No description",
                                           iconURL: nil,
                                           currentTemperature: "0°",
                                           minTemperature: "0° Min.",
                                           maxTemperature: "0° Max.",
                                           humidity: "0%")
}
