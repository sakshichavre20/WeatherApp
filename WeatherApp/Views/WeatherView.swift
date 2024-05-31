//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Sakshi Chavre on 31/05/24.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.location.name).bold().font(.title)
                    Text("\(weather.location.region), \(weather.location.country)").fontWeight(.medium)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack{
                            Image(systemName: "sun.max").font(.system(size: 40))
                            Text(weather.current.condition.text)
                        }.frame(width:150)
                        
                        Spacer()
                        Text("\(weather.current.feelslike_c, specifier: "%.1f")° ").font(.system(size: 55)).padding().bold()
                        
                    }
                    
                    Spacer().frame(height: 80)
                    
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Spacer()
                
            }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
          
            VStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Weather now")
                                    .bold()
                                    .padding(.bottom)
                                
                               
                            
                                HStack {
                                    WeatherRow(logo: "wind", name: "Cloud", value: "\(weather.current.cloud)m/s")
                                    Spacer()
                                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.current.humidity)%")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.bottom, 20)
                            .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                            .background(.white)
                            .cornerRadius(20)
                            
                        }
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.653, saturation: 0.975, brightness: 0.413)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleWeather = ResponseBody(
            location: ResponseBody.Location(
                name: "Bengaluru",
                region: "Karnataka",
                country: "India",
                lat: 12.98,
                lon: 77.58,
                tz_id: "Asia/Kolkata",
                localtime_epoch: 1717139474,
                localtime: "2024-05-31 12:41"
            ),
            current: ResponseBody.Current(
                condition: ResponseBody.Current.Condition(
                    text: "Partly cloudy",
                    icon: "//cdn.weatherapi.com/weather/64x64/day/116.png"
                ),
                humidity: 52,
                cloud: 25,
                feelslike_c: 30.8,
                feelslike_f: 87.4
            )
        )
        
        WeatherView(weather: sampleWeather)
    }
}
