//
//  Store.swift
//  App Clima
//
//  Created by wendy manrique on 1/08/22.
//

import Foundation
class Store : ObservableObject {
    @Published var selectedUnit: TemperatureUnit = .kelvin
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weatherViewModel : WeatherViewModel) {
        weatherList.append(weatherViewModel)
    }
}
