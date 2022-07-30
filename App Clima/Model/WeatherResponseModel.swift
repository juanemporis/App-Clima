//
//  WeatherResponseModel.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//

import Foundation
//Se creo los struc para obtener la información del JSON

struct WeatherResponseDataModel : Decodable {
    let city: String
    let weather: [WeatherDataModel]   //Se coloco los [] ya que weather es un array
    let temperature: TemperatureDataModel
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
    }
}

struct WeatherDataModel: Decodable {
    let main: String
    let description: String
    let iconURLString: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case description
        case iconURLString = "icon"
    }
}
struct TemperatureDataModel: Decodable {
    let currentTemperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let humidity: Int
    
    
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity
    }
}
/*{#
 "coord": {
   "lon": -76,
   "lat": -10
 },
 "weather": [
   {
     "id": 800,
     "main": "Clear",
     "description": "clear sky",
     "icon": "01d"
   }
 ],
 "base": "stations",
 "main": {
   "temp": 287.2,
   "feels_like": 286.02,
   "temp_min": 287.2,
   "temp_max": 287.2,
   "pressure": 1013,
   "humidity": 52,
   "sea_level": 1013,
   "grnd_level": 683
 },
 "visibility": 10000,
 "wind": {
   "speed": 4.1,
   "deg": 29,
   "gust": 2.8
 },
 "clouds": {
   "all": 10
 },
 "dt": 1659212419,
 "sys": {
   "country": "PE",
   "sunrise": 1659180017,
   "sunset": 1659222023
 },
 "timezone": -18000,
 "id": 3932488,
 "name": "Peru",
 "cod": 200
}*/
