//
//  WeatherRowView.swift
//  App Clima
//
//  Created by juan castañeda on 31/07/22.
//

import Foundation
import SwiftUI

struct WeatherHomeView : View{
    
    @StateObject var vm = WeatherHomeView.ViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ForEach (vm.cities , id: \.self) { item in
                    NavigationLink {
                        CityDetailsView()
                    } label: {
                        WeatherHomeRowView (city: item)
                            .padding(.top)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Climas")
            .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    header
                }
            }
        }
        .onAppear {
            vm.readCities()
        }
    }
}
extension WeatherHomeView {
    var header : some View {
        HStack {
            NavigationLink {
                WeatherAddCityView(cities: $vm.cities)
            }label: {
                Image(systemName: "plus")
            }
            Button {
                
            }label: {
                Image(systemName: "ellipsis")
            }
        }
    }
}

extension WeatherHomeView {
    class ViewModel : ObservableObject {
        @Published var cities : [String] = [String]()
        
        func readCities() {
            let defaults = UserDefaults.standard
            cities = defaults.array(forKey: "cities") as? [String] ?? [String]()
            
            debugPrint(cities)
        }
    }
}

struct WeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}






