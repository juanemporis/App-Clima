//
//  ContentView.swift
//  App Clima
//
//  Created by juan castañeda on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    @State var searchText = ""
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                Text(searchText)
                        //TextField("", text: $searchText)
                        .searchable(text: $searchText)
                        .navigationTitle("Clima")
                        .onChange(of: searchText) { newValue in
                            Task {
                                await weatherViewModel.getWeather(city: searchText)
                            }
                        }
                        
                        
                        
                    Group{
                    
                    Text(weatherViewModel.weatherModel.city)
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                    
                    Text(weatherViewModel.weatherModel.description)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 8 )
                    
                    HStack {
                        if let url = weatherViewModel.weatherModel.iconURL {
                            AsyncImage(url: url) { image in
                                image
                            }placeholder: {
                                ProgressView()
                            }
                        }
                        Text(weatherViewModel.weatherModel.currentTemperature)
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -20)
                    HStack(spacing: 14) {
                        Label(weatherViewModel.weatherModel.maxTemperature, systemImage: "thermometer.sun.fill")
                        Label(weatherViewModel.weatherModel.minTemperature, systemImage:
                            "thermometer.snowflake")
                        
                    }
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                    
                    Divider()
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    HStack(spacing : 32){
                        VStack {
                            Image(systemName: "sunrise.fill")
                                .symbolRenderingMode(.multicolor)
                            Text(weatherViewModel.weatherModel.sunrise, style: .time)
                        }
                        VStack {
                            Image(systemName: "sunset.fill")
                                .symbolRenderingMode(.multicolor)
                            Text(weatherViewModel.weatherModel.sunset, style: .time)
                        }
                    }
                    .foregroundColor(.white)
                    Divider()
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    Divider()
                        .foregroundColor(.white)
                        .padding()
                    Label(weatherViewModel.weatherModel.humidity,systemImage: "humidity.fill")
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    Spacer()
                    }
                }
                .padding(.top, 32)
                
                .background(
                    LinearGradient(colors: [.blue, . white], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            }
                .task {
                    await weatherViewModel.getWeather(city: searchText)
                }
                
                
            }
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

