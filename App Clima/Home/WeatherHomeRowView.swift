//
//  WeatherHomeRowView.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import SwiftUI

struct WeatherHomeRowView: View {
    
    var city : String?
    
    var body: some View {
        HStack {
            Text(city ?? "Lima")
                .font(.title2)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
    )
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
 }
}

struct WeatherHomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeRowView()
    }
}
