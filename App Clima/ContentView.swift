//
//  ContentView.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text(weatherViewModel.weatherResponseDataModel?.city ?? "No city")
                    .foregroundColor(.white)
                    .font(.system(size: 70))
                Text(weatherViewModel.weatherResponseDataModel?.weather.first?.description ?? "No Descripcion")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8 )
                HStack {
                    if let iconURL = weatherViewModel.weatherResponseDataModel?.weather.first?.iconURLString,
                       let url = URL (string: "http://openweathermap.org/img/wn/\(iconURL)@2x.png") {
                        AsyncImage(url: url) { image in
                            image
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    Text("\(weatherViewModel.weatherResponseDataModel?.temperature.currentTemperature ?? 0.0)  °")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding(.top, -20)
                HStack(spacing: 14) {
                    Label("\(weatherViewModel.weatherResponseDataModel?.temperature.maxTemperature ?? 0.0)°" , systemImage: "thermometer.sun.fill")
                    Label("\(weatherViewModel.weatherResponseDataModel?.temperature.minTemperature ?? 0.0)°", systemImage: "thermometer.snowflake")
                    
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                Divider()
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                Divider()
                    .foregroundColor(.white)
                    .padding()
                Label("\(weatherViewModel.weatherResponseDataModel?.temperature.humidity ?? 0) %",systemImage: "humidity.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 32)
            
            .background(
                LinearGradient(colors: [.blue, . white], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        }
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

