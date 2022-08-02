//
//  WeatherHomeRowView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherHomeRowView: View {
    
    var city : String?
    
    @Binding var cities: [String]
    @ObservedObject var vm = WeatherHomeRowView.ViewModel()
    
    var body: some View {
        NavigationLink {
            CityDetailsView(cities: $cities, data: vm.customData)
        } label: {
            HStack {
                Text(city ?? "Lima")
                    .font(.title2)
                    .foregroundColor(Color.white)
                Spacer()
                
                if let url = vm.customData?.iconURL ?? URL(string: "") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                    }placeholder: {
                        ProgressView()
                    }
                }
                //Te mostrara en la view los datos establecidos en el customData
                Text(vm.customData?.currentTemperature ?? "")
                    .font(.largeTitle)
            }
            .padding()
            .background(LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        }
        .onAppear {
            vm.load(city: city ?? "")
        }
    }
}

extension WeatherHomeRowView {
    class ViewModel: ObservableObject {
        
        @Published var customData: WeatherModel?
        
        func load (city : String) {
            
            let worker = WeatherWorker()
            
            worker.retriveDetails(of: city) { status, response in
                self.customData = response
            }
        }
    }
}

struct WeatherHomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeRowView(cities: .constant([""]))
    }
}
