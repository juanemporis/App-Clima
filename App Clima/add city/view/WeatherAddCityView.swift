//
//  WeatherAddCityView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherAddCityView: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                        DispatchQueue.main.async {
                            dismiss()
                        }
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
        .padding(32)
        .navigationBarTitle("Add City")
        .background(
            LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
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
            
            let worker = AddCityWorker()
            
            worker.save(city: city)
            
            debugPrint(worker.retrieveCities())
        }
        
        func readCities() -> [String] {
            
            let worker = AddCityWorker()
            
            return worker.retrieveCities()
        }
    }
}

