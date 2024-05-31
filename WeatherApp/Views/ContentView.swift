//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sakshi Chavre on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = viewModel.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }else{
                    LoadingView().task{
                        do{
                            weather = try await weatherManager.getCurrentWeather()
                        }catch{
                            print("Error, \(error)")
                        }
                       
                    }
                }
            }
            else{
                
                if viewModel.isLoading{
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(viewModel)
                }
            }
            
            
        }
        .background(Color(hue: 0.653, saturation: 0.975, brightness: 0.413)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
