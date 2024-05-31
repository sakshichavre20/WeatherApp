//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Sakshi Chavre on 31/05/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the weather app").bold().font(.title)
                Text("Please share your current location to know the weather in your surrounding").padding()
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                viewModel.requestLocation()
            }.cornerRadius(30).symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
