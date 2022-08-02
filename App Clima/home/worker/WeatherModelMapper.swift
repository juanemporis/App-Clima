//
//  WeatherModelMapper.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//

import Foundation

//
struct WeatherModelMapper {
    
    func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        let temperature = dataModel.temperature
        
        let sunsetWithTimeZone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunriseWithTimeZone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        
        var current = ""
        let units = readUnits()
        
        if units == "Celsius" {
            current = "\(Int(temperature.currentTemperature)) °C"
        } else if units == "Fahrenheit" {
            current = "\(String(format: "%.1f", Double(temperature.currentTemperature * 9.0 / 5.0) + 32)) °F"
        } else if units == "Kelvin" {
            current = "\(String(format: "%.1f", Double(temperature.currentTemperature) + 273.15)) K"
        }

        
        
        
        return WeatherModel(city: dataModel.city,
                            weather: weather.main,
                            description: "\(weather.description)",
                            iconURL: URL(string: "http://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"),
                            currentTemperature: current,
                            minTemperature: "\(Int(temperature.minTemperature))° Min.",
                            maxTemperature: "\(Int(temperature.maxTemperature))° Max.",
                            humidity: "\(temperature.humidity)%",
                            sunset: sunsetWithTimeZone,
                            sunrise: sunriseWithTimeZone)
    }
    
    func readUnits() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "units") ?? "Celsius"
    }
}
