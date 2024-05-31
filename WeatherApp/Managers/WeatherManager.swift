//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Sakshi Chavre on 31/05/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather()async throws -> ResponseBody{
        
        guard let url = URL(string : "https://api.weatherapi.com/v1/current.json?key=33613a5af0df452993035535210211&q=Bengaluru&aqi=no")else{
            fatalError("Missing URL")
        }
        let urlResponse = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlResponse)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error in Fetching")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from:data)
        print(decodedData)
        
        return decodedData
    }
}


struct ResponseBody: Decodable {
    let location: Location
    let current: Current

    struct Location: Decodable {
        let name: String
        let region: String
        let country: String
        let lat: Double
        let lon: Double
        let tz_id: String
        let localtime_epoch: Int
        let localtime: String
    }

    struct Current: Decodable {
        let condition: Condition
        let humidity: Int
        let cloud: Int
        let feelslike_c: Double
        let feelslike_f: Double

        struct Condition: Decodable {
            let text: String
            let icon: String
        }
    }
}
