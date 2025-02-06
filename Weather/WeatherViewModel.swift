//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Jatin Singh on 31/01/25.
//

import Foundation
import SwiftUI

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
    
    func fetchWeatherResponse() async throws -> WeatherResponse {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=7d1d9a36abd4c76ff66c15025c9bb970&units=metric") else {
            fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard( response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return decodedData
    }
            
}
