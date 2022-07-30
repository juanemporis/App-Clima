//
//  WeatherViewModel.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//
/*https://api.openweathermap.org/data/2.5/weather?q=Per%C3%BA&appid=282cf45b438b81cdadfa836729e82855*/

import Foundation

//Se encargara en realizar la petición Http
final class WeatherViewModel {
    func getWeather(city: String) async {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=282cf45b438b81cdadfa836729e82855")! //Se añadio el parametro city para que coja el valor de la petición http
        
        do {
        
        async let (data, _) = try await URLSession.shared.data(from: url) 
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            debugPrint(dataModel)
        } catch {
            debugPrint(error.localizedDescription)
    }
  }
}
