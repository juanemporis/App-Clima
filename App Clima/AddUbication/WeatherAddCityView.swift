//
//  WeatherAddCityView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherAddCityView: View {
    
    @Binding var cities : [String]
    
    @ObservedObject private var vm = WeatherAddCityView.ViewModel()
    
    var body: some View {
        
        
        VStack {
            
        
            VStack {
                TextField("Enter City", text: $vm.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                   
                Button {
                    if vm.city != "" {
                        vm.save()
                        cities = vm.readCities()
                    }
                    
                
                } label: {
                Text("Save")
                    .frame(width: 100, height: 48, alignment: .center)
                        .background(CustomColor.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
                        .padding(.horizontal)
                        .padding(.bottom)
        }
    }
                        .background(CustomColor.background)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0, style:
                                .continuous))
                        .padding()
                           
                           Spacer()
            }
        .navigationBarTitle("Add City")
    
    }
}
struct WeatherAddCityView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            WeatherAddCityView(cities: .constant([]))
                .padding()
                .previewLayout(.sizeThatFits)
            
            WeatherAddCityView(cities: .constant([]))
                .padding()
                .previewLayout(.sizeThatFits)
                .background(.black)
                .environment(\.colorScheme, .dark)
        }
        
    }
}

extension WeatherAddCityView {
    
                        class  ViewModel : ObservableObject {
                            
                            @Published var city : String = ""
                            
                            func save() {
                                
                                var cities = readCities()
                                cities.append(city)
                                
                                let defaults = UserDefaults.standard
                                defaults.set(cities, forKey: "cities")
                                
                                debugPrint(readCities())
                                
                            }
                            func readCities() -> [String] {
                                let defaults = UserDefaults.standard
                                return defaults.array(forKey: "cities") as? [String] ?? [String]()
                            }
                        }
}
                    
