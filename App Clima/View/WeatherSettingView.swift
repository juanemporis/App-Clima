//
//  WeatherSettingView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable {
    
    
    case celsius
    case fahrenheit
    case kelvin
}
extension TemperatureUnit {
    var displayText : String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
}

struct WeatherSettingView: View {
    @EnvironmentObject var store : Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("Unit") private var selectedUnit: TemperatureUnit = .kelvin
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedUnit, label: Text("Select Temperature unit?")) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                }
            }
            Spacer()
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .navigationTitle("Setting")
        .navigationBarItems(trailing: Button("Done") {
            
            mode.wrappedValue.dismiss()
            store.selectedUnit = selectedUnit
        })
        
        
    }
       
        
        }


struct WeatherSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingView()
    }
}
