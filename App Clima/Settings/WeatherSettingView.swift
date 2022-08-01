//
//  WeatherSettingView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherSettingView: View {
    
    @ObservedObject var vm = WeatherSettingView.ViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
                Button {
                    vm.save()
                } label : {
                    Text("Done")
                }
            }
            HStack {
                Text("Setting")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.label))
                Spacer()
            }
            .padding(.bottom)
            
            HStack {
                Text("Select Temperature Unit")
                    .foregroundColor(Color(UIColor.systemGray2))
                Spacer()
            }
            Picker("", selection: $vm.unit) {
                ForEach(vm.units, id: \.self) { unit in
                    Text(unit)
                }
                
            }
            .pickerStyle(SegmentedPickerStyle())

            Spacer()
                
        }
        .padding()
        .onAppear {
            vm.readUnits()
        }
}
        
    }

struct WeatherSettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherSettingView()
                .padding()
                .previewLayout(.sizeThatFits)
                
            
            WeatherSettingView()
                .padding()
                .previewLayout(.sizeThatFits)
                .background(.black)
                .environment(\.colorScheme, .dark)
        }
    }
}

extension WeatherSettingView {
    class ViewModel: ObservableObject {
        let units = ["Celsius","Fahrenheit","Kelvin"]
        
        @Published var unit: String = ""
        
        func save() {
            let defaults = UserDefaults.standard
            defaults.set(unit, forKey: "units")
            
            readUnits()
            
        }
        
            func readUnits() {
                let defaults = UserDefaults.standard
            unit = defaults.string(forKey: "units") ?? "Celsius"
            
            debugPrint(unit)
        }
    }
}
