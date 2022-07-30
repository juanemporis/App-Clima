//
//  ContentView.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    private let weatherViewModel = WeatherViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                await weatherViewModel.getWeather(city: "Lima")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

