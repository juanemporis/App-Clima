//
//  WeatherHomeRowView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherHomeRowView: View {
    
    var city : String?
    
    @ObservedObject var vm = WeatherHomeRowView.ViewModel()
    
    var body: some View {
        HStack {
            Text(city ?? "Lima")
                .font(.title2)
                .foregroundColor(Color.white)
            Spacer()
            //Te mostrara en la view los datos establecidos en el customData
            Text(vm.customData? .currentTemperature ?? "")
                .font(.largeTitle)
        }
        .padding()
        .background(LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
    )
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .onAppear {
                vm.load(city: city ?? "")
            }
 }
}

extension WeatherHomeRowView {
    class ViewModel: ObservableObject {
        
        @Published var customData: WeatherModel?
        
        func load (city : String) {
            
            let url = "http://api.openweathermap.org/data/2.5/weather"
            
            let parameters = [
                "q": city,
                "appid" : "71c3e78149e90edcb26b5c8bf57708fa",
                "units": "metric",
                "lang" : "es"
            ]
            APIClient.shared.get(url, parameters: parameters) {
                (status : Int, response: WeatherResponseDataModel?) in
                
                guard let response = response else {
                    return
                }
                self.customData = WeatherModelMapper()
                    .mapDataModelToModel(dataModel: response)
            }
        }
    }
}

struct WeatherHomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeRowView()
    }
}
