//
//  CityDetailsView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct CityDetailsView: View {
    
    var data: WeatherModel?
    
    var body: some View {
        ZStack {
            VStack {
                Group{
                    
                    Text(data?.city ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                    
                    Text(data?.description ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 8 )
                    
                    HStack {
                        if let url = data?.iconURL ?? URL(string: "") {
                            AsyncImage(url: url) { image in
                                image
                            }placeholder: {
                                ProgressView()
                            }
                        }
                        Text(data?.currentTemperature ?? "")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -20)
                    
                    HStack(spacing: 14) {
                        Label(data?.maxTemperature ?? "", systemImage: "thermometer.sun.fill")
                        Label(data?.minTemperature ?? "", systemImage:
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
                            Text(data?.sunrise ?? Date(), style: .time)
                        }
                        VStack {
                            Image(systemName: "sunset.fill")
                                .symbolRenderingMode(.multicolor)
                            Text(data?.sunset ?? Date(), style: .time)
                        }
                    }
                    .foregroundColor(.white)
                    
                    Divider()
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    
                    Divider()
                        .foregroundColor(.white)
                        .padding()
                    
                    Label(data?.humidity ?? "",systemImage: "humidity.fill")
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient(colors: [.yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        }
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView()
    }
}
