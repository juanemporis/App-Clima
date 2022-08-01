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
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("Unit") private var selectedUnit: TemperatureUnit = .kelvin
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedUnit, label: Text("Select Temperature unit?")){
                
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                    
                }
            
            }
            .pickerStyle(SegmentedPickerStyle())

            Spacer()
                
        }
        .background(LinearGradient(colors: [.white, .blue], startPoint: .leading, endPoint: .bottomTrailing))
        .padding(.top , 32)
        .navigationTitle("Setting")
        .navigationBarItems(trailing: Button("Done") {
            mode.wrappedValue.dismiss()
            
        })
        
}
        
      
    }
    
  

struct WeatherSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingView()
    }
}
