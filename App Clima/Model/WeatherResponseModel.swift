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
    let sun : SunModel
    let timezone: Double
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
        case sun = "sys"
        case timezone
    }
    struct SunModel: Decodable  {
        let sunrise: Date
        let sunset: Date
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
/*
 {
   "coord": {
     "lon": -77.0282,
     "lat": -12.0432
   },
   "weather": [
     {
       "id": 804,
       "main": "Clouds",
       "description": "nubes",
       "icon": "04n"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 14.14,
     "feels_like": 13.91,
     "temp_min": 14.14,
     "temp_max": 14.14,
     "pressure": 1014,
     "humidity": 88
   },
   "visibility": 8000,
   "wind": {
     "speed": 3.6,
     "deg": 180
   },
   "clouds": {
     "all": 100
   },
   "dt": 1659244858,
   "sys": {
     "type": 1,
     "id": 8682,
     "country": "PE",
     "sunrise": 1659266817,
     "sunset": 1659308513
   },
   "timezone": -18000,
   "id": 3936456,
   "name": "Lima",
   "cod": 200
 }*/
