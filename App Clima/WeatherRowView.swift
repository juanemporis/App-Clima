//
//  WeatherRowView.swift
//  App Clima
//
//  Created by juan castañeda on 31/07/22.
//

import Foundation
import SwiftUI

struct WeatherRowView {
    @StateObject var weatherViewModel = WeatherViewModel()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                HStack {
                    TextField("Seach", text : $searchText)
                        .searchable(text: $searchText)
                        .navigationTitle("Clima")
                        .onChange(of: searchText) { newValue in
                                Task {
                                await weatherViewModel.getWeather(city: searchText)
                            }
                        }
                }
                ForEach((0...20).filter({"\($0)".contains(searchText) || searchText.isEmpty }) ,id:
                \.self) { index in
                    HStack {
                    Text("\(index)")
                        Spacer()
                    }.padding()
                    Divider()
                        .foregroundColor(.gray)
                        .padding(.leading)
                        
                }
            
            .navigationTitle("Clima")
            
            
        }
        .task {
            await weatherViewModel.getWeather(city: searchText)
        }
       
    
    }
        
}

}




    




