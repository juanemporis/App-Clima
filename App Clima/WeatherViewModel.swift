//
//  WeatherViewModel.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//
/*https://api.openweathermap.org/data/2.5/weather?q=Per%C3%BA&appid=282cf45b438b81cdadfa836729e82855*/

import Foundation

//Se encargara en realizar la petición Http
final class WeatherViewModel : ObservableObject {
    
    @Published var city : String = ""
    @Published var weatherModel: WeatherModel = .empty //Notificara a la vista y la vista se refrescara con los nuevos datos
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        guard city.count > 3 else {
            return
        }
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es")! //Se añadio el parametro city para que coja el valor de la petición http
        
        do {
        
        async let (data, _) = try await URLSession.shared.data(from: url) //Se encargara de la petición
             let dataModel = try?  await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)//Se encargara de hacer el mapeo del JSON de la DATA a nuestro DATAMODEL
            guard dataModel != nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel!) //Se le asigna el DATAMODEL a esta propiedad
            }
            
        } catch {
            debugPrint(error.localizedDescription)
    }
  }
}
